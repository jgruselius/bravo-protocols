/*
 transfer_lib.js
 Author: Joel Gruselius
 Description: Helper functions and classes for VWorks scripts, requires
 the VWorks-defined global functions
*/

/*
 CHANGED in this version:
 -- Numeric conversion of LIMS ID's (P1234P1, 27-12345) when sorting

 TODO
 --Make a common function for assigning sourceVolume, sourcePlate etc.
 --Methods to prototype properties
 */

 var testing = false;

// CLASSES =====================================================================

/*
 Object containing information of a liquid transfer; a set of source
 coordinates (row, columnn), a volume and destination coordinates
*/
function Transfer(sourcePlate, sourceWell, volume, destinationWell, destinationPlate, newTip) {
	this.sourcePlate = sourcePlate;
	this.sourceWell = sourceWell;
	this.volume = volume;
	this.destinationWell = destinationWell;
	this.destinationPlate = destinationPlate;
	this.newTip = newTip;
}

Transfer.prototype.toString = function() {
	var str = ["{" +
			"sourcePlate: " + this.sourcePlate,
			"sourceWell: " + String.fromCharCode(this.sourceWell[0]+64) +
					this.sourceWell[1],
			"volume: " + this.volume,
			"destinationPlate: " + this.destinationPlate,
			"destinationWell: " + String.fromCharCode(this.destinationWell[0]+64) +
					this.destinationWell[1],
			"newTip: " + this.newTip +
			"}"];
	return str.join(", ");
};
/*
 Tipbox class to track single-tip usage. Tips are taken/placed column-wise
 starting from {row,column} given in 'origin', where row is 1 or 8 and column
 is 1 or 12
*/
function Tipbox(tips, origin) {
	if(origin.row === 1) {
		this.getRow = rowFromIndexReverse;
	} else if(origin.row === 8) {
		this.getRow = rowFromIndex;
	} else {
		throw "UnknownStartPositionException: \"" + origin.row + "\"";
	}
	if(origin.column === 1) {
		this.getColumn = columnFromIndexReverse;
	} else if(origin.column === 12) {
		this.getColumn = columnFromIndex;
	} else {
		throw "UnknownStartPositionException: \"" + origin.column + "\"";
	}
	this.tipCount = parseInt(tips, 10) || 0;
	this.hasTip = function() {
		return this.tipCount > 0;
	}
	this.isEmpty = function() {
		return this.tipCount < 1;
	}
	// Methods takeTip and putTip returns the position of the lower
	// right-most tip and updates 'tipCount' if "successful":
	this.takeTip = function() {
		var tip = new Array(2);
		// Find the "last" tip:
		tip[0] = this.getRow(this.tipCount);
		tip[1] = this.getColumn(this.tipCount);
		if(tip[0] > 0 && tip[1] > 0) {
			this.tipCount--;
		} else {
			tip = undefined;
		}
		return tip;
	}
	this.putTip = function() {
		var temp = this.tipCount + 1;
		var tip = new Array(2);
		// Find the "last" empty position:
		tip[0] = this.getRow(temp);
		tip[1] = this.getColumn(temp);
		if(tip[1] < 13 && tip[0] > 0 && tip[1] > 0) {
			this.tipCount++;
		} else {
			tip = undefined;
		}
		return tip;
	}
	// The following methods allow getting coords without incrementation:
	this.getNextTipPosition =  function() {
		var tip = new Array(2);
		// Find the "last" tip:
		tip[0] = this.getRow(this.tipCount);
		tip[1] = this.getColumn(this.tipCount);
		if(tip[0] < 1 || tip[1] < 1) {
			tip = undefined;
		}
		return tip;
	}
	this.getNextEmptyPosition = function() {
		var temp = this.tipCount + 1;
		var tip = new Array(2);
		// Find the "last" empty position:
		tip[0] = this.getRow(temp);
		tip[1] = this.getColumn(temp);
		if(tip[1] > 12 || tip[0] < 1 || tip[1] < 1) {
			tip = undefined;
		}
		return tip;
	}
	this.increment = function() {
		this.tipCount++;
	}
	this.decrement = function() {
		this.tipCount--;
	}
}

// FUNCTIONS ===================================================================

/*
 Parses a string-represented integer or float, optionally rounds to number
 of decimal places given by places
*/
function parseNumber(value, places) {
	var intValue = parseInt(value, 10);
	var floatValue = parseFloat(value);
	var number = (intValue == floatValue) ? intValue : floatValue;
	if(isNaN(number) || !isFinite(number)) {
		throw "UnexpectedValueException: \"" + value + "\"";
	}
	if(typeof places === "number") number = parseFloat(number.toFixed(places));
	return number;
}

/*
 Checks if n is a valid number
*/
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

/*
 Returns the elapsed time in whole seconds since the specified date
*/
function getElapsedTime(fromDate) {
	var msTimeDif = new Date().getTime() - fromDate.getTime();
	return Math.floor((msTimeDif / 1000));
}

// Return the row or column index of the nth well of a 96 plate counting
// column-wise from well A1 or H12 (reverse):
function rowFromIndex(n) { return (n-1) % 8 + 1; }
function rowFromIndexReverse(n) { return 8 - (n-1) % 8; }
function columnFromIndex(n) { return ((n-1) - (n-1) % 8) / 8 + 1; }
function columnFromIndexReverse(n) { return 12 - ((n-1) - (n-1) % 8) / 8; }

/*
 Converts a set of plate coordinates to a row and column number,
 e.g. 'C4' returns [3, 4]
*/
function convertCoords(wellPos) {
	// parseNumber function is used here to work both when wellPos
	// has format 'A5' as well as 'A05', 'A:5' or 'A:05'
	try {
		var row = parseNumber(wellPos.trim().toUpperCase().charCodeAt(0) - 64);
		var column = parseNumber(wellPos.trim().replace(":","").substr(1));
	} catch(e) {
		throw "InvalidCoordinatesException: \"" + wellPos + "\": " + e;
	}
	if(column < 1 || column > 24 || row < 1 || row > 16) {
		throw "InvalidCoordinatesException: \"" + wellPos + "\"";
	}
	return [row, column];
}

/*
 Converts a set of 96 well microplate coordinates to a row and column number,
 supports formats 'C4', 'C04', 'C:4', 'C:04' and returns [3, 4]
*/
function convertCoordsRegExp(wellPos) {
	var match = wellPos.trim().match(/^([A-Ha-h])(?:\:)?((?:0)?[1-9]|1[0-2])$/);
	if(!match) throw "InvalidCoordinatesException: \"" + wellPos + "\"";
	try {
		var row = parseNumber(match[1].toUpperCase().charCodeAt(0) - 64);
		var column = parseNumber(match[2]);
	} catch(e) {
		throw "InvalidCoordinatesException: \"" + wellPos + "\": " + e;
	}
	return [row, column];
}

/*
 Sorts rows first alphabetically or numerically by the column given by plateCol,
 then by the well (col-then-row) in wellCol:
*/
function transferSorter(plateCol, wellCol) {
	return (function(row1, row2) {
		var a = {}, b = {};
		a.id = row1[plateCol].trim().toLowerCase();
		b.id = row2[plateCol].trim().toLowerCase();
		// If plate ID is a number, convert from string to int/double:
		if(isNumber(a.id) && isNumber(b.id)) {
			a.id = parseNumber(a.id);
			b.id = parseNumber(b.id);
		} else {
			var p = /\d\d\-\d{4,}/;
			// If plate ID is a LIMS ID, convert from string to int:
			if(a.id.match(p) && b.id.match(p)) {
				a.id = parseNumber(a.id.replace("-",""));
				b.id = parseNumber(b.id.replace("-",""));
			} else {
				p = /P\d{3,}P\d{1,2}/i;
				// If plate ID is a project plate ID, e.g. P4568P2,
				// covert to int by removing 'P', e.g. 45682:
				if(a.id.match(p) && b.id.match(p)) {
					a.id = parseNumber(a.id.replace(/P/gi,""));
					b.id = parseNumber(b.id.replace(/P/gi,""));
				}
			}
		}
		// Sort alphabetically/numerically on plate ID, then source well:
		if(a.id !== b.id) {
			return (a.id < b.id) ? -1 : (a.id > b.id ? 1 : 0);
		} else {
			a.pos = convertCoordsRegExp(row1[wellCol]);
			b.pos = convertCoordsRegExp(row2[wellCol]);
			return (a.pos[1] === b.pos[1]) ? a.pos[0]-b.pos[0] : a.pos[1]-b.pos[1];
		}
	});
}


// PARSING =====================================================================

/*
 Parses a string representation of a csv-file using newline as row delimiter
 and the specified character as column delimiter or ',' by default and returns
 the resulting 2D array
*/
function parseCsv(str, delim) {
	var delimiter = delim || ",";
	// Atm. it does not support quoted fields so replace them:
	var rawRowArray = str.replace(/"/g,"").split("\n");
	// Remove all empty rows:
	var rowArray = [];
	for(var i=0, n=rawRowArray.length; i<n; i++) {
		var row = rawRowArray[i];
		if(row) rowArray.push(row.split(delimiter));
	}
	return rowArray;
}

/*
 Creates an array of Transfer objects from a csv file with format:
		sourcePlate,sourceWell,volume,destinationWell
 where sourceWell and destination are given in well coordinates, e.g. 'D4'
 and sourcePlate is an index, starting from 1, identifying which plate to
 transfer from
*/
function parseTransfers(str) {
	var rowArray = parseCsv(str, ",");
	// Sort the array alphabetically by plate ID:
	rowArray.sort(transferSorter(0,1));
	var transferArrays = [];
	var plateSet = {};
	var plateIndex = 0;
	for(var i=0, n=rowArray.length; i<n; i++) {
		var row = rowArray[i];
		var sourcePlate, sourceWell, volume, destinationWell, destinationPlate;
		try {
			sourcePlate = row[0].trim();
			sourceWell = convertCoordsRegExp(row[1]);
			volume = parseNumber(row[2], 3);
			// Temporary fix to also handle format with destination plate ID:
			try {
				destinationWell = convertCoordsRegExp(row[4]);
				destinationPlate = row[3].trim();
			} catch(e) {
				destinationPlate = "aliquot_plate";
				destinationWell = convertCoordsRegExp(row[3]);
			}
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		if(volume > 0) {
			if(!(sourcePlate in plateSet)) {
				plateSet[sourcePlate] = sourcePlate;
				plateIndex = transferArrays.push([]) - 1;
			}
			transferArrays[plateIndex].push(new Transfer(sourcePlate,
				sourceWell, volume, destinationWell, destinationPlate, true));
		}
	}
	return transferArrays;
}

/*
 Creates an array of Transfer objects from a csv file with format:
		destination,index,volume
 where well is given in well coordinates, e.g. 'D4'
*/
function parseAdapterTransfers(str, indexSet) {
	// Tables mapping the plate positions of the different adapters:
	var INDEX_SETS = {};

	INDEX_SETS["truseq"] = {
		1:"A1", 2:"B1", 3:"C1", 4:"D1", 5:"E1", 6:"F1", 7:"G1", 8:"H1",
		9:"A2", 10:"B2", 11:"C2", 12:"D2", 13:"E2", 14:"F2", 15:"G2",
		16:"H2", 18:"A3", 19:"B3", 20:"C3", 21:"D3", 22:"E3", 23:"F3",
		25:"G3", 27:"H3"
	};

	INDEX_SETS["sureselect"] = {
		1:"A1", 2:"B1", 3:"C1", 4:"D1", 5:"E1", 6:"F1", 7:"G1", 8:"H1",
		9:"A2", 10:"B2", 11:"C2", 12:"D2", 13:"E2"
	};
	// TruSeq dual indexes are numbered column-wise for the SciLife ID (dualNN)
	INDEX_SETS["truseq_dual"] = {};
	for(var i=1; i<=96; i++) {
		var row = String.fromCharCode(64+rowFromIndex(i));
		var col = columnFromIndex(i);
		INDEX_SETS["truseq_dual"][i+1] = row + col;
	}
	// Agilent 8 nt indexes are numbered column-wise for the
	// SciLife ID (halohtNN), in other words the same as TruSeq Dual
	INDEX_SETS["agilent96"] = INDEX_SETS["truseq_dual"];

	var plateMap;
	if(indexSet in INDEX_SETS) {
		plateMap = INDEX_SETS[indexSet];
	} else {
		throw "UnknownIndexSetIdException: \"" + indexSet + "\"";
	}
	var rowArray = parseCsv(str, ",");
	// Sort the array by index:
	rowArray.sort(function(a, b) {
		// Assumes a, b is [(string) well, (int) index]
		return parseInt(a[1], 10) - parseInt(b[1], 10);
	});
	// Create transfer objects from sorted array:
	var transferArray = [];
	for(var i=0, n=rowArray.length; i<n; i++) {
		var row = rowArray[i];
		var source, volume, destinationWell;
		try {
			source = convertCoords(plateMap[row[1]]);
			volume = parseNumber(row[2], 3);
			destinationWell = convertCoordsRegExp(row[0]);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		// Keep tip between transfers of the same index:
		var newTip = (i == 0) || (row[1] != rowArray[i-1][1]);
		if(volume > 0) {
			transferArray.push(new Transfer("adapter_plate", source, volume,
				destinationWell, "aliquot_plate", newTip));
		}
	}
	return [transferArray];
}

/*
 Creates an array of Transfer objects from a csv file with format:
	sourcePlate,sourceWell,sourceVolume,destinationWell,finalVolume
 where sourceWell and destinationWell are given in plate coordinates, e.g. 'D4'
*/
function parseDilutionTransfers(str) {
	var rowArray = parseCsv(str, ",");
	// Order the arrray on plate ID:
	rowArray.sort(transferSorter(0,1));
	var transferArrays = [];
	// Add the array that will hold the buffer transfers:
	transferArrays.push([]);
	var plateSet = {};
	var sourceIndex;
	var diluentWell = convertCoords("A1");
	for(var i=0, n=rowArray.length; i<n; i++) {
		var row = rowArray[i];
		var sourcePlate, sourceWell, sourceVolume;
		var destinationPlate, destinationWell, diluentVolume;
		try {
			sourcePlate = row[0].trim();
			sourceWell = convertCoordsRegExp(row[1]);
			sourceVolume = parseNumber(row[2], 3);
			// Temporary fix to also handle format with destination plate ID:
			try {
				destinationWell = convertCoordsRegExp(row[4]);
				destinationPlate = row[3].trim();
				// The substraction float may contain many dec so it is rounded:
				diluentVolume = +(parseNumber(row[5], 3) - sourceVolume).toFixed(3);
			} catch(e) {
				destinationPlate = "diluted_plate";
				destinationWell = convertCoordsRegExp(row[3]);
				// The substraction float may contain many dec so it is rounded:
				diluentVolume = +(parseNumber(row[4], 3) - sourceVolume).toFixed(3);
			}
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		var newTip;
		if(diluentVolume > 0) {
			newTip = (transferArrays[0].length === 0);
			transferArrays[0].push(new Transfer("diluent_reservoir",
				diluentWell, diluentVolume, destinationWell, destinationPlate, newTip));
		}
		if(!(sourcePlate in plateSet)) {
			plateSet[sourcePlate] = sourcePlate;
			sourceIndex = transferArrays.push([]) - 1;
		}
		if(sourceVolume > 0) {
			newTip = (sourceIndex > 1 || transferArrays[sourceIndex].length > 0);
			transferArrays[sourceIndex].push(new Transfer(sourcePlate, sourceWell,
				sourceVolume, destinationWell, destinationPlate, newTip));
		}
	}
	return transferArrays;
}

/*
 Creates an array of Transfer objects from a csv file with a format matching
 what the normalization process of the GenoLogics Clarity LIMS produces
*/
function parseDilutionTransfersLims(str) {
	var rowArray = parseCsv(str, ",");
	var firstDataRow;
	// Find the header row:
	for(var i=0, n=rowArray.length; i<n; i++) {
		if(rowArray[i][0] === "Sample Name") {
			firstDataRow = i + 1;
			break;
		}
	}
	if(firstDataRow === undefined) {
		throw "UnableToParseTransferTableException: Missing header row"
	}
	rowArray = rowArray.slice(firstDataRow);
	// Alternatively: rowArray.splice(0, firstDataRow);
	rowArray.sort(transferSorter(1,2));
	var transferArrays = [];
	// Add the array that will hold the buffer transfers:
	transferArrays.push([]);
	var plateSet = {};
	var sourceIndex;
	var diluentWell = convertCoords("A1");
	for(var i=0, n=rowArray.length; i<n; i++) {
		var row = rowArray[i];
		var sourcePlate, sourceWell, sourceVolume;
		var destinationPlate, destinationWell, diluentVolume;
		try {
			sourcePlate = row[1].trim();
			sourceWell = convertCoordsRegExp(row[2]);
			destinationPlate = row[6].trim();
			destinationWell = convertCoordsRegExp(row[7]);
			// A missing value should be treated as 0 volume:
			try {
				sourceVolume = parseNumber(row[5], 3);
			} catch(e) {
				if(row[5] === "") {
					sourceVolume = 0;
				} else {
					throw e;
				}
			}
			try {
				diluentVolume = parseNumber(row[11], 3);
			} catch(e) {
				if(row[11] === "") {
					diluentVolume = 0;
				} else {
					throw e;
				}
			}
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		var newTip;
		if(diluentVolume > 0) {
			newTip = (transferArrays[0].length === 0);
			transferArrays[0].push(new Transfer("diluent_reservoir",
				diluentWell, diluentVolume, destinationWell, destinationPlate, newTip));
		}
		if(!(sourcePlate in plateSet)) {
			plateSet[sourcePlate] = sourcePlate;
			sourceIndex = transferArrays.push([]) - 1;
		}
		if(sourceVolume > 0) {
			newTip = (sourceIndex > 1 || transferArrays[sourceIndex].length > 0);
			transferArrays[sourceIndex].push(new Transfer(sourcePlate, sourceWell,
				sourceVolume, destinationWell, destinationPlate, newTip));
		}
	}
	return transferArrays;
}

// FILE_OPERATIONS==============================================================

/*
 Parse a text file and return the contents in a string
*/
function readFile(filePath) {
	var fileObj = new File();
	var content;
	try {
		fileObj.Open(filePath, 0, 0);
		try {
			content = fileObj.Read();
		} catch(e) {
			throw "UnableToReadFile(" + filePath + "):" + e;
		} finally {
			fileObj.Close();
		}
	} catch(e) {
		throw "FileError(" + filePath + "):" + e;
	}
	return content;
}

/*
 Append the passed string to a file with specified path
*/
function appendFile(filePath, content) {
	var fileObj = new File();
	try {
		fileObj.Open(filePath, 0, 0);
		try {
			// If the string ends with a newline character:
			if(content.substr(-1) === "\n") {
				fileObj.Write(content);
			} else {
				fileObj.Write(content + "\n");
			}
		} catch(e) {
			throw "UnableToWriteFile(" + filePath + "):" + e;
		} finally {
			fileObj.Close();
		}
	} catch(e) {
		throw "FileError(" + filePath + "):" + e;
	}
}

/*
 Write the passed string to a file with specified path (overwrites existing)
*/
function writeFile(filePath, content) {
	var fileObj = new File();
	try {
		fileObj.Open(filePath, 1, 0);
		try {
			// If the string ends with a newline character:
			if(content.substr(-1) === "\n") {
				fileObj.Write(content);
			} else {
				fileObj.Write(content + "\n");
			}
		} catch(e) {
			throw "UnableToWriteFile(" + filePath + "):" + e;
		} finally {
			fileObj.Close();
		}
	} catch(e) {
		throw "FileError(" + filePath + "):" + e;
	}
}

// MANAGERS ====================================================================

// Transfer/tip manager, mode can be string "transfer" "dilution" "adapter"
function TransferManager(transferMode, tipMode) {
	// Error state is set to false if an exception is caught:
	this.errorState = true;
	this.functionMap = {
		"transfer":parseTransfers,
		"dilution":parseDilutionTransfers,
		"adapter":parseAdapterTransfers,
		"lims_dilution": parseDilutionTransfersLims
	};
	if(transferMode in this.functionMap) {
		this.parseFunction = this.functionMap[transferMode];
	} else {
		throw "UnknownParseModeException: \"" + transferMode + "\"";
	}
	// Array of Transfer object arrays:
	this.transfers;
	// Current transfer object:
	this.current;
	// Index of current plate:
	this.plate;
	// Index of current transfer object (reset for each plate):
	this.index;
	// Reference next element to predict tip handling:
	this.next;
	// Number of transfers per source:
	this.sizes;
	// Whether all volumes are the same (per source):
	this.constantVolumes;
	// Tip handling (uses default value if not specified):
	this.tipMode = tipMode || {"row":8, "column":12};
	this.newTips = new Tipbox(96, this.tipMode);
	this.usedTips = new Tipbox(0, this.tipMode);
	// Open and parse a transfer file:
	this.openTransferFile = function(filePath) {
		try {
			var fileContent = readFile(filePath);
			if(testing) print("fileContent.length="+fileContent.length);
			this.transfers = this.parseFunction(fileContent);
			if(testing) print("transfers.length="+this.transfers.length);
			if(testing) print("getAll().length="+this.getAll().length);
			this.next = this.transfers[0][0];
			this.updateSize();
			this.checkVolumes();
		} catch(e) {
			this.next = undefined;
			this.errorState = false;
			print(e);
		}
		// Reset state:
		this.current = undefined;
		this.plate = 0;
		this.index = -1;
	}
	// Calculate number of transfers for each source ID:
	// Calculate number of transfers for each source ID:
	this.updateSize = function() {
		var n = this.transfers.length
		if(this.transfers && n) {
			this.sizes = Array(n);
			for(var i=n; i-->0;) {
				this.sizes[i] = this.transfers[i].length;
			}
			// The VWorks JS engine doesn't seem to support Array.map
			// this.sizes = this.transfers.map(function(x) { return x.length; });
		}
	}
	// Return total size:
	this.getSize = function() {
		var tot = 0;
		for(var i=this.transfers.length; i-->0;) {
			tot += this.transfers[i].length;
		}
		return tot;
	}
	// Return the length of the current transfer array:
	this.getCurrentSize = function() {
		return this.transfers[this.plate].length;
	}
	// Return the number of plates in the transfer array:
	this.numberOfPlates = function() {
		return this.transfers.length;
	}
	// Return an array of transfer objects:
	this.getAll = function() {
		var all = [];
		for(var i=0, n=this.transfers.length; i<n; i++) {
			var x = this.transfers[i];
			for(var j=0, m=x.length; j<m; j++) {
				all.push(x[j]);
			}
		}
		// Alt: Array.prototype.concat.apply([],this.transfers);
		return all;
	}
	// Return whether the transfer array of the current plate has a next element:
	this.hasNextTransfer = function() {
		return this.index < this.transfers[this.plate].length - 1;
	}
	// Return whether the transfer array has an array for another plate:
	this.hasNextPlate = function() {
		return this.plate < this.transfers.length - 1;
	}
	// Return whether tipbox is empty:
	this.hasTip = function() {
		return this.newTips.hasTip();
	}
	this.resetTips = function() {
		this.newTips = new Tipbox(96, this.tipMode);
		this.usedTips = new Tipbox(0, this.tipMode);
	}
	this.increment = function() {
		// Temporarily store the transfer array of the current plate:
		var temp = this.transfers[this.plate];
		try {
			this.current = this.next;
			this.index++;
			if(this.hasNextTransfer()) {
				this.next = temp[this.index+1];
			} else if(this.hasNextPlate()) {
				temp = this.transfers[++this.plate];
				this.index = -1;
				this.next = temp[0];
			} else {
				this.next = undefined;
			}
		} catch(e) {
			this.errorState = false;
			print(e);
		}
	}
	// This could be implemented with a queue as well:
	// (Just an example, do not use this method)
	this.increment2 = function() {
		return undefined;
		this.current = this.transfers[0].shift();
		if(this.transfers[0].length === 0) this.transfers.shift();
		this.next = this.transfers[0][0];
	}
	// For each array of transfers, check if the volumes in that array are equal:
	this.checkVolumes = function() {
		if(this.transfers && this.transfers.length) {
			this.constantVolumes = [];
			for(var i=this.transfers.length; i-->0;) {
				var temp = this.transfers[i];
				this.constantVolumes[i] = temp.length > 0;
				for(var j=temp.length; j-->1;) {
					if(temp[j].volume !== temp[j-1].volume) {
						this.constantVolumes[i] = false;
						break;
					}
				}
			}
		}
	}
	// Check if any volume exceed the  the specified limit:
	this.volumeLimitedTo = function(limit) {
		var test = true;
		if(this.transfers && this.transfers.length) {
			for(var i=this.transfers.length; i-->0 && test;) {
				var temp = this.transfers[i];
				for(var j=temp.length; j-->0 && test;) {
					test = temp[j].volume <= limit;
				}
			}
		}
		return test;
	}
	this.getWellSelectionTransferSource = function() {
		return this.current.sourceWell;
	}
	this.getWellSelectionTransferDestination = function() {
		return this.current.destinationWell;
	}
	this.getWellSelectionTipSource = function() {
		return this.newTips.getNextTipPosition();
	}
	this.getWellSelectionTipDestination = function() {
		return this.usedTips.getNextEmptyPosition();
	}
	this.takeTip = function() {
		return this.newTips.takeTip();
	}
	this.putTip = function() {
		return this.usedTips.putTip();
	}
	this.getVolume = function() {
		return this.current.volume;
	}
	this.useNewTip = function() {
		return this.current.newTip;
	}
	this.returnTip = function() {
		return (!(this.hasNextTransfer() || this.hasNextPlate()) || this.next.newTip);
	}
	this.updateTipState = function() {
		this.newTips.increment();
		this.usedTips.increment();
	}
	this.changePlate = function() {
		return (this.next && this.current.sourcePlate !== this.next.sourcePlate);
	}
}

/*
 Barcode manager
 Author: Joel Gruselius
 Description: Functions for using barcode information read by the robot
*/
/**
 * Functions for dealing with plate barcodes in VWorks
 * @author Joel Gruselius
 * @class
 * @param {string} side - The side of the plate where the barcode
 * @param {string} logPath - Full path to where to save the log file
 */
function BarcodeManager(side, logPath) {
	var sides = {
		"south": 0,
		"west": 1,
		"north": 2,
		"east": 3,
		"front": 0,
		"left": 1,
		"back": 2,
		"right": 3
	};
	// Which barcode index to use (see VWorks plate object), default to 3:
	if(!isNaN(parseInt(side, 10))) {
		this.side = parseInt(side, 10);
	} else if(side.trim().toLowerCase() in sides) {
		this.side = sides[side.trim().toLowerCase()];
	} else {
		this.side = 3;
	}
	// Where to put the logfiles:
	this.logPath = logPath || "C:/VWorks Workspace/Barcode_logs/";

	// Return a string with the current date and time
	// format YY-MM-DD HH:MM:SS
	this.timestamp = function() {
		var d = new Date();
		var date = [d.getFullYear(), d.getMonth()+1, d.getDate(), d.getHours(),
				d.getMinutes(), d.getSeconds()];
		// Convert to string and pad with zeroes, i.e. 8 -> "08":
		for(var i=date.length; i-->0;) {
			var x = date[i];
			date[i] = (x > 9) ? x + "" : "0" + x;
		}
		return date.slice(0,3).join("-") + " " + date.slice(3).join(":");
	};

	this.datestamp = function() {
		var d = new Date();
		var date = [d.getFullYear(), d.getMonth()+1, d.getDate()];
		// Convert to string and pad with zeroes, i.e. 8 -> "08":
		for(var i=date.length; i-->0;) {
			var x = date[i];
			date[i] = (x > 9) ? x + "" : "0" + x;
		}
		return date.slice(0,3).join("-");
	};

	this.hasBc = function(plateObj) {
		//var bc = (typeof plateObj === "string") ? plateObj : plateObj.barcode[this.side];
		var bc = plateObj.barcode[this.side];
		// Check if undefined/null (VWorks may use string 'undefined'):
		var hasBc = (typeof bc !== "undefined" && bc !== null && bc !== "undefined");
		// Check for number or non-blank string:
		hasBc = hasBc && (!isNaN(parseFloat(bc)) || !!bc.trim());
		return hasBc;
	};

	this.printBc = function(plateObj) {
		//var bc = (typeof plateObj === "string") ? plateObj : plateObj.barcode[this.side];
		var bc = plateObj.barcode[this.side];
		print(bc || "<no barcode>");
	};

	this.bcMatches = function(plateObj, barcode) {
		//var bc = (typeof plateObj === "string") ? plateObj : plateObj.barcode[this.side];
		var bc = plateObj.barcode[this.side];
		return (bc === barcode);
	};

	this.logBc = function(plateObj, taskObj, text) {
		var bc = plateObj.barcode[this.side];
		var plate = plateObj.name;
		var pro = taskObj.getProtocolName();
		var t = (typeof text === "undefined") ? "" : "\t" + text;
		var logStr = this.timestamp() + "\t" + pro + "\t" + plate + "\t" + bc + t;
		appendFile(this.logPath + "barcode_log_" + this.datestamp() + ".log", logStr);
	};
}

// POLYFILLS ===================================================================
// Source: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference

if(!String.prototype.trim) {
	(function() {
		// Make sure we trim BOM and NBSP
		var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
		String.prototype.trim = function() {
			return this.replace(rtrim, '');
		};
	})();
}

//DEBUG:
print("transfer_lib.js loaded");
