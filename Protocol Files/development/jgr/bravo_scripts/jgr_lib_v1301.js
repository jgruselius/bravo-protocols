/*
 jgr_lib_v1301.js
 Author: Joel Gruselius
 Version: v1301
 Description: Helper functions and classes for VWorks scripts, requires
 the VWorks-defined global functions 
*/

/*
 Changes in v1301:
 --TransferManager now reports total size with getSize() and size per source
   in member array TransferManager.sizes
 --convertCoords can now handle 384-plate coordinates.
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
	this.getStringRepresentation = function() {
		return this.volume + " uL from " + this.sourceWell + " of " +
		this.sourcePlate + " to " + this.destinationWell +
		" new tip: " + this.newTip;
	}
}

/*
Tip box class to handle single-tip processes filling tips columns-wise
from up/left to down/right, i.e. A1, B1...H1, A2...
*/
function Tipbox(tips) {
	this.tipCount = parseInt(tips, 10);
	this.tipCount = (!this.tipCount || this.tipCount < 0) ? 0 : this.tipCount;
	// Return the row of the lower right-most tip:
	this.getRow = function(n) {
		return (n-1) % 8 + 1;
	}
	// Return the column of the lower right-most tip:
	this.getColumn = function(n) {
		return ((n-1) - (n-1) % 8) / 8 + 1;
	}
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
 Parses a string-represented integer or float
*/
function readNumeral(value) {
	var number;
	if(parseFloat(value) == parseInt(value, 10)) {
		number = parseInt(value, 10);
	} else {
		number = parseFloat(value);
	}
	if(isNaN(number) || !isFinite(number)) {
		throw "UnexpectedValueException";
	}
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
	var msTimeDif = new Date.getTime() - fromDate.getTime();
	return Math.floor((msTimeDif / 1000));
}

/*
 Converts a set of plate coordinates to a row and column number,
 e.g. 'C4' returns [3, 4]
*/
function convertCoords(wellPos) {
	// readNumeral function is used here to work both when wellPos
	// has format 'A5' as well as 'A05'
	try {
		var row = readNumeral(wellPos.toUpperCase().charCodeAt(0) - 64);
		var column = readNumeral(wellPos.substr(1));
	} catch(e) {
		throw "InvalidCoordinatesException:" + e;
	}
	if(column < 1 || column > 24 || row < 1 || row > 16) {
		throw "InvalidCoordinatesException";
	}
	return [row, column];
}

// PARSING =====================================================================

/*
 Parses a string representation of a csv-file using newline as row delimiter
 and the specified character as column delimiter or ',' by default and returns
 the resulting 2D array
*/
function parseCsv(str, delim) {
	var delimiter = delim || ",";
	var rawRowArray = str.split("\n");
	// Remove all empty rows:
	var rowArray = [];
	for(var i = 0, n = rawRowArray.length; i < n; i++) {
		var row = rawRowArray[i];
		if(row) { 
			rowArray.push(row.split(delimiter));
		}
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
	/*
	// Sort the array alphabetically by plate ID:
	rowArray.sort(function(row1, row2) {
		var a = row1[0].toLowerCase();
		var b = row2[0].toLowerCase();
		return a < b ? -1 : (a > b ? 1 : 0);
	});
	*/
	// Sort the array numerically by plate index:
	rowArray.sort(function(row1, row2) {
		var a = parseInt(row1[0], 10);
		var b = parseInt(row2[0], 10);
		return a - b;
	});
	var transferArray = [];
	var plateMap = {};
	for(var i = 0, n = rowArray.length; i < n; i++) {
		var row = rowArray[i];
		/*
		var sourcePlate = row[0];
		var sourcePlateIndex;
		// Assign an index to the plate ID:
		if(sourcePlate in plateMap) {
			sourcePlateIndex = plateMap[sourcePlate];
		} else {
			sourcePlateIndex = Object.keys(plateMap).length - 1;
			plateMap[sourcePlate] = sourcePlateIndex;
		}
		*/
		var sourcePlateIndex, sourceWell, volume, destinationWell;
		try {
			sourcePlateIndex = readNumeral(row[0]) - 1;
			sourceWell = convertCoords(row[1]);
			volume = readNumeral(row[2]);
			destinationWell = convertCoords(row[3]);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		if(volume) {
			transferArray.push(new Transfer(sourcePlateIndex, sourceWell,
				volume, destinationWell, true));
		}
	}
	return transferArray;
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
	var plateMap; 
	if(!indexSet) {
		plateMap = INDEX_SETS["truseq"];
	} else if(indexSet in INDEX_SETS) {
		plateMap = INDEX_SETS[indexSet];
	} else {
		throw "UnknownIndexSetIdException";
	}
	var rowArray = parseCsv(str, ",");
	// Sort the array by index:
	rowArray.sort(function(a, b) {
		// Assumes a, b is [(string) well, (int) index]
		return parseInt(a[1], 10) - parseInt(b[1], 10);
	});
	// Create transfer objects from sorted array:
	var transferArray = [];
	for(var i = 0, len = rowArray.length; i < len; i++) {
		var row = rowArray[i];
		var source, volume, destination;
		try {
			source = convertCoords(plateMap[row[1]]);
			volume = readNumeral(row[2]);
			destination = convertCoords(row[0]);
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		// Keep tip between transfers of the same index:
		var newTip = (i == 0) || (row[1] != rowArray[i-1][1]);
		if(volume) {
			transferArray.push(new Transfer("adapter_plate", source, volume,
				destination, newTip));
		}
	}
	return transferArray;
}

/*
 Creates an array of Transfer objects from a csv file with format:
	sourceWell,sourceVolume,destinationWell,finalVolume
 where sourceWell and destinationWell are given in plate coordinates, e.g. 'D4'
*/
function parseDilutionTransfers(str) {
	var rowArray = parseCsv(str, ",");
	var diluentTransferArray = [];
	var sampleTransferArray = [];
	for(var i = 0, n = rowArray.length; i < n; i++) {
		var row = rowArray[i];
		var sourceWell, sourceVolume, destinationWell, finalVolume;
		try {
			sourceWell = convertCoords(row[0]);
			sourceVolume = readNumeral(row[1]);
			destinationWell = convertCoords(row[2]);
			diluentWell = convertCoords("A1");
			diluentVolume = readNumeral(row[3]) - sourceVolume;
		} catch(e) {
			throw "UnableToParseTransferTableException:" + e;
		}
		var newTip = (i != 0);
		if(sourceVolume) {
			sampleTransferArray.push(new Transfer("sample_plate", sourceWell,
				sourceVolume, destinationWell, newTip));
		}
		newTip = (i == 0);
		if(diluentVolume > 0) {
			diluentTransferArray.push(new Transfer("diluent_reservoir",
				diluentWell, diluentVolume, destinationWell, newTip));
		}
	}
	return diluentTransferArray.concat(sampleTransferArray);
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
function TransferManager(mode) {
	// Error state is set to false if an exception is caught:
	this.errorState = true;
	this.functionMap = {"transfer":parseTransfers,
						"dilution":parseDilutionTransfers,
						"adapter":parseAdapterTransfers };
	if(mode in this.functionMap) {
		this.parseFunction = this.functionMap[mode];
	} else {
		this.parseFunction = parseTransfers;
		// DEBUG
		print("Unknown string parameter for parse function. Using default.");
	}
	// Array of Transfer objects:
	this.transfers;
	// Current transfer object:
	this.current;
	// Index of current transfer object:
	this.index;
	// Reference next element to predict tip handling:
	this.next;
	// Number of transfers per source:
	this.sizes;
	// Tip handling:
	this.newTips = new Tipbox(96);
	this.usedTips = new Tipbox(0);
	// Open and parse a transfer file:
	this.openTransferFile = function(filePath) {
		try {
			var fileContent = readFile(filePath);
			this.transfers = this.parseFunction(fileContent);
			this.next = this.transfers[0];
		} catch(e) {
			this.next = undefined;
			this.errorState = false;
			print(e);
		}
		// Reset state:
		this.current = undefined;
		this.index = -1;
		this.updateSize();
	}
	// Calculate number of transfers for each source ID:
	this.updateSize = function() {
		if(this.transfers && this.transfers.length) {
			this.sizes = [];
			var sourceIndex = -1;
			var previousSourceId, currentSourceId;
			for(var i = 0, n = this.transfers.length; i < n; i++) {
				currentSourceId = this.transfers[i].sourcePlate;
				if(currentSourceId === previousSourceId) {
					this.sizes[sourceIndex]++;
				} else {
					this.sizes[++sourceIndex] = 1;
				}
				previousSourceId = currentSourceId;
			}
		}
	}
	// Return total size:
	this.getSize = function() {
		var totalSize = 0;
		if(typeof this.sizes !== "undefined") {
			for(var i = 0, n = this.sizes.length; i < n; i++) {
				totalSize += this.sizes[i];
			}
		}
		return totalSize;
	}
	this.increment = function() {
		try {
			this.current = this.next;
			this.index++;
			if(this.index < this.getSize() - 1) {
				this.next = this.transfers[this.index+1];   
			} else {
				this.next = undefined;
			}
		} catch(e) {
			this.errorState = false;
			print(e);
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
		return (this.index == this.getSize()-1 || this.next.newTip);
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
print("jgr_lib_v1301.js EOF");
