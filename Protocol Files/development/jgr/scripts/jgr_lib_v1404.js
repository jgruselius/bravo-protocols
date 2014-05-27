/*
 jgr_lib_v1404.js
 Author: Joel Gruselius
 Version: v1404
 Description: Helper functions and classes for VWorks scripts, requires
 the VWorks-defined global functions 
*/

/*
 CHANGED in v1404:
 --TransferManager should hold Transfer objects in arrays of arrays per source
 --Implement tip tracking and support more than 96 transfers
 --[TEST]parseDilutionTransfer uses the regex-based covertCoords (allows format A:1)
 --[TEST]Sorting in parseTransfers uses regex-based converCoords (allows format A:1)
 --[TEST]Add TruSeq dual index set, Nextera and Agilent 96 index set

 TODO
 --Dilution protocol able to handle multiple input plates
 --Make a common function for assigning sourceVolume, sourcePlate etc. 
 --Methods to prototype properties
 */

// CLASSES =====================================================================

/*
 Object containing information of a liquid transfer; a set of source
 coordinates (row, columnn), a volume and destination coordinates
*/
function Transfer(sourcePlate, sourceWell, volume, destinationWell, newTip) {
	this.sourcePlate = sourcePlate;
	this.sourceWell = sourceWell;
	this.volume = volume;
	this.destinationWell = destinationWell;
	this.newTip = newTip;
	this.toString = function () {
		var str = ["{" + 
				"sourcePlate: " + this.sourcePlate,
				"sourceWell: " + String.fromCharCode(this.sourceWell[0]+64) + 
						this.sourceWell[1],
				"volume: " + this.volume,
				"destinationWell: " + String.fromCharCode(this.destinationWell[0]+64) +
						this.destinationWell[1],
				"newTip: " + newTip +
				"}"];
		return str.join(", ");
	}
}

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
	// has format 'A5' as well as 'A05'
	try {
		var row = parseNumber(wellPos.toUpperCase().charCodeAt(0) - 64);
		var column = parseNumber(wellPos.substr(1));
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
	var match = wellPos.match(/^([A-Ha-h])(?:\:)?((?:0)?[1-9]|1[0-2])$/);
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
 Sorts rows alphabetically or numerically column 1, then by well (col-then-row)
 in column 2
*/
function sortRowsByPlate(row1, row2) {
	var a = {}, b = {};
	a.id = row1[0].toLowerCase();
	b.id = row2[0].toLowerCase();
	// If plate ID is a number, convert from string to int/double:
	if(isNumber(a.id) && isNumber(b.id)) {
		a.id = parseNumber(a.id);
		b.id = parseNumber(b.id);
	}
	// Sort alphabetically/numerically on plate ID, then source well:
	if(a.id !== b.id) {
		return (a.id < b.id) ? -1 : (a.id > b.id ? 1 : 0);
	} else {
		a.coords = convertCoordsRegExp(row1[1]);
		b.coords = convertCoordsRegExp(row2[1]);
		return (a.coords[1] === b.coords[1]) ? a.coords[0] - b.coords[0] : a.coords[1] - b.coords[1];
	}
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
	for(var i in rawRowArray) {
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
	rowArray.sort(sortRowsByPlate);
	var transferArrays = [];
	var plateSet = {};
	var plateIndex = 0;
	for(var i in rowArray) {
		var row = rowArray[i];
		var sourcePlate, sourcePlateIndex, sourceWell, volume, destinationWell;
		try {
			sourcePlate = row[0];
			sourceWell = convertCoords(row[1]);
			volume = parseNumber(row[2], 3);
			destinationWell = convertCoords(row[3]);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		if(volume > 0) {
			if(!(sourcePlate in plateSet)) {
				plateSet[sourcePlate] = sourcePlate;
				plateIndex = transferArrays.push([]) - 1;
			}
			transferArrays[plateIndex].push(new Transfer(sourcePlate, 
				sourceWell, volume, destinationWell, true));
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
	
	INDEX_SETS["truseq"] = {1:"A1", 2:"B1", 3:"C1", 4:"D1", 5:"E1", 6:"F1",
							7:"G1", 8:"H1", 9:"A2", 10:"B2", 11:"C2", 12:"D2",
							13:"E2", 14:"F2", 15:"G2", 16:"H2", 18:"A3",
							19:"B3", 20:"C3", 21:"D3", 22:"E3", 23:"F3",
							25:"G3", 27:"H3"};
	
	INDEX_SETS["sureselect"] = {1:"A1", 2:"B1", 3:"C1", 4:"D1", 5:"E1", 6:"F1",
							7:"G1", 8:"H1", 9:"A2", 10:"B2", 11:"C2", 12:"D2",
							13:"E2"};
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
	for(var i in rowArray) {
		var row = rowArray[i];
		var source, volume, destination;
		try {
			source = convertCoords(plateMap[row[1]]);
			volume = parseNumber(row[2], 3);
			destination = convertCoords(row[0]);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		// Keep tip between transfers of the same index:
		var newTip = (i == 0) || (row[1] != rowArray[i-1][1]);
		if(volume > 0) {
			transferArray.push(new Transfer("adapter_plate", source, volume,
				destination, newTip));
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
	rowArray.sort(sortRowsByPlate);
	var transferArrays = [];
	var plateSet = {};
	var diluentIndex;
	var sourceIndex;
	for(var i in rowArray) {
		var row = rowArray[i];
		var sourcePlate, sourceWell, sourceVolume, destinationWell;
		try {
			sourcePlate = row[0];
			sourceWell = convertCoordsRegExp(row[1]);
			sourceVolume = parseNumber(row[2], 3);
			destinationWell = convertCoordsRegExp(row[3]);
			diluentWell = convertCoords("A1");
			// The substraction float may contain many dec so it is rounded:
			diluentVolume = +(parseNumber(row[4], 3) - sourceVolume).toFixed(3);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		// Each diluentTransferArray must preceed its 
		// sourceTransferArray. Make sure the order is correct by using
		// plateIndex
		if(!(sourcePlate in plateSet)) {
				plateSet[sourcePlate] = sourcePlate;
				diluentIndex = transferArrays.push([]) - 1;
				sourceIndex = transferArrays.push([]) - 1;
		}
		var newTip;
		if(sourceVolume > 0) {
			newTip = (transferArrays[sourceIndex].length != 0);
			transferArrays[sourceIndex].push(new Transfer(sourcePlate, sourceWell,
				sourceVolume, destinationWell, newTip));
		}
		if(diluentVolume > 0) {
			newTip = (transferArrays[diluentIndex].length == 0);
			transferArrays[diluentIndex].push(new Transfer("diluent_reservoir",
				diluentWell, diluentVolume, destinationWell, newTip));
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
	var diluentTransferArray = [];
	var sampleTransferArray = [];
	var firstDataRow;
	// Find the header row:
	for(var i=0, n=rowArray.length; i<n; i++) {
		if(rowArray[i][0] === "Sample Name") {
			firstDataRow = i + 1;
			break;
		}
	}
	for(var i=firstDataRow, n=rowArray.length; i<n; i++) {
		var row = rowArray[i];
		var sourceWell, sourceVolume, destinationWell, diluentVolume;
		try {
			sourceWell = convertCoordsRegExp(row[2]);
			destinationWell = convertCoordsRegExp(row[7]);
			diluentWell = convertCoords("A1");
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
		if(sourceVolume > 0) {
			newTip = (sampleTransferArray.length != 0);
			sampleTransferArray.push(new Transfer("sample_plate", sourceWell,
				sourceVolume, destinationWell, newTip));
		}
		if(diluentVolume > 0) {
			newTip = (diluentTransferArray.length == 0);
			diluentTransferArray.push(new Transfer("diluent_reservoir",
				diluentWell, diluentVolume, destinationWell, newTip));
		}
	}
	return [diluentTransferArray, sampleTransferArray];
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
		content = fileObj.Read();
	} catch(e) {
		// IO error
		throw "UnableToReadFile(" + filePath + "):" + e;
	} finally {
		fileObj.Close();
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
		fileObj.Write(content + "\n");
	} catch(e) {
		// IO error
		throw "UnableToWriteFile(" + filePath + "):" + e;
	} finally {
		fileObj.Close();
	}
}

/*
 Write the passed string to a file with specified path (overwrites existing)
*/
function writeFile(filePath, content) {
	var fileObj = new File();
	try {
		fileObj.Open(filePath, 1, 0);
		// If the string ends with a newline character:
		if(content.substr(-1) === "\n") {
			fileObj.Write(content);
		} else {
			fileObj.Write(content + "\n");
		}
	} catch(e) {
		// IO error
		throw "UnableToWriteFile(" + filePath + "):" + e;
	} finally {
		fileObj.Close();
	}
}

// MANAGERS ====================================================================

// Transfer/tip manager, mode can be string "transfer" "dilution" "adapter" 
function TransferManager(transferMode, tipMode) {
	// Error state is set to false if an exception is caught:
	this.errorState = true;
	this.functionMap = {"transfer":parseTransfers,
						"dilution":parseDilutionTransfers,
						"adapter":parseAdapterTransfers,
						"lims_dilution": parseDilutionTransfersLims };
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
			print("fileContent.length="+fileContent.length);
			this.transfers = this.parseFunction(fileContent);
			print("transfers.length="+this.transfers.length);
			this.next = this.transfers[0][0];
		} catch(e) {
			this.next = undefined;
			this.errorState = false;
			print(e);
		}
		// Reset state:
		this.current = undefined;
		this.plate = 0;
		this.index = -1;
		this.updateSize();
		this.checkVolumes();
	}
	// Calculate number of transfers for each source ID:
	// Calculate number of transfers for each source ID:
	this.updateSize = function() {
		if(this.transfers && this.transfers.length) {
			this.size = this.transfers.map(function(x) { return x.length; });
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
	this.increment2 = function() {
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
				for(var j=0, m=this.transfers[i].length; j<m-1; j++) {
					if(temp[j].volume !== temp[j+1].volume) {
						this.constantVolumes[i] = false;
						break;
					}
				}
			}
		}
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

//DEBUG:
print("jgr_lib_v1404.js EOF");
