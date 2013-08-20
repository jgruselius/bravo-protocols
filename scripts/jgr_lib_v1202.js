/*
 jgr_lib_v1202.js
 Author: Joel Gruselius
 Version: v1202
 Description: Helper functions and classes for VWorks scripts, requires
 the VWorks-defined global functions 
*/

// CLASSES =====================================================================

/*
 Object containing information of a liquid transfer; a set of source
 coordinates (row, columnn), a volume and destination coordinates
*/
function Transfer(source, volume, destination, newTip) {
    this.source = source;
    this.volume = volume;
    this.destination = destination;
    this.newTip = newTip;
    this.getStringRepresentation = function() {
        return this.volume + " from " + this.source + " to " +
        this.destination + " new tip: " + this.newTip;
    }
}

/*
Tip box class to handle single-tip processes filling tips columns-wise
from up/left to down/right, i.e. A1, B1...H1, A2...
*/
function Tipbox(tips) {
    this.tipCount = parseInt(tips);
    this.getRow = function(n) {
        return (n-1) % 8 + 1;
    }
    this.getColumn = function(n) {
        return ((n-1) - (n-1) % 8) / 8 + 1;
    }
    this.hasTip = function() {
        return this.tipCount > 0;
    }
    this.isEmpty = function() {
        return this.tipCount < 1;
    }
    // Methods takeTip and putTip returns the next position and increments if
    // "successful":
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
    // The following methods allow retrieval of coords without incrementation:
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
    var conversionMap = {A:1, B:2, C:3, D:4, E:5, F:6, G:7, H:8};
    // readNumeral function is used here to work both when wellPos
    // has format 'A5' as well as 'A05'
    try {
        var row = readNumeral(conversionMap[wellPos.charAt(0)]);
        var column = readNumeral(wellPos.slice(1));
    } catch(e) {
        // UnexpectedValueException
        throw "InvalidCoordinatesException:" + e;
    }
    if(column < 1 || column > 12) {
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
function parseCsv(str, delimiter) {
    if(typeof delimiter === "undefined") {
        delimiter = ",";
    }
    var rawRowArray = str.split("\n");
    // Remove all empty rows:
    var rowArray = new Array();
    for(var i = 0, len = rawRowArray.length; i < len; i++) {
        var row = rawRowArray[i];
        if(row !== "") {
            rowArray.push(row.split(delimiter));
        }
    }
    return rowArray;
}

/*
 Creates an array of Transfer objects from a csv file with format:
        source,volume,destination
 where source and destination are given in well coordinates, e.g. 'D4'
*/
function parseTransfers(str) {
    var rowArray = parseCsv(str, ",");
    var transferArray = new Array();
    for(var i = 0, len = rowArray.length; i < len; i++) {
        var row = rowArray[i];
        var source, volume, destination;
        try {
            source = convertCoords(row[0]);
            volume = readNumeral(row[1]);
            destination = convertCoords(row[2]);
        } catch(e) {
            throw "UnableToParseTransferTableException:" + e;
        }
        transferArray[i] = new Transfer(source, volume, destination, true);
    }
    return transferArray;
}

/*
 Creates an array of Transfer objects from a csv file with format:
        destination,index,volume
 where well is given in well coordinates, e.g. 'D4'
*/
function parseAdapterTransfers(str) {
    // A table mapping the plate position of the different indexes: 
    var adapterLocations = {1:"A1", 2:"B1", 3:"C1", 4:"D1", 5:"E1", 6:"F1",
                            7:"G1", 8:"H1", 9:"A2", 10:"B2", 11:"C2", 12:"D2",
                            13:"E2", 14:"F2", 15:"G2", 16:"H2", 18:"A3",
                            19:"B3", 20:"C3", 21:"D3", 22:"E3", 23:"F3",
                            25:"G3", 27:"H3"};
    var rowArray = parseCsv(str, ",");
    this.adapterIndexSort = function(a, b) {
        // Assumes a, b is [(string) well, (int) index]
        return a[1] - b[1];
    }
    rowArray.sort(this.adapterIndexSort);
    // Create transfer objects from sorted array:
    var transferArray = new Array();
    for(var i = 0, len = rowArray.length; i < len; i++) {
        var row = rowArray[i];
        try {
            var source = convertCoords(adapterLocations[row[1]]);
            var volume = readNumeral(row[2]);
            var destination = convertCoords(row[0]);
        } catch(e) {
            throw "UnableToParseTransferTableException:" + e;
        }
        var newTip = (i == 0) ? true : (rowArray[i-1][1] != row[1]);
        transferArray[i] = new Transfer(source, volume, destination, newTip);
    }
    return transferArray;
}

/*
 Creates an array of Transfer objects from a csv file with format:
    sampleSource,sampleVolume,sampleDestination,finalVolume
 where sampleSource and sampleDestination are given in well coordinates, e.g. 'D4'
*/
function parseDilutionTransfers(str) {
    var rowArray = parseCsv(str, ",");
    var diluentTransferArray = new Array();
    var sampleTransferArray = new Array();
    for(var i = 0, len = rowArray.length; i < len; i++) {
        var row = rowArray[i];
        try {
            var sampleSource = convertCoords(row[0]);
            var sampleVolume = readNumeral(row[1]);
            var sampleDestination = convertCoords(row[2]);
            var diluentSource = convertCoords("A1");
            var diluentVolume = readNumeral(row[3]) - sampleVolume;
        } catch(e) {
            throw "UnableToParseTransferTableException:" + e;
        }
        var newTip = (i != 0);
        sampleTransferArray[i] = new Transfer(sampleSource, sampleVolume,
                                              sampleDestination, newTip);
        newTip = (i == 0);
        diluentTransferArray[i] = new Transfer(diluentSource, diluentVolume,
                                               sampleDestination, newTip);
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

// Transfer/tip manager, mode is string "transfer"/"dilute"/"adapter" 
function TransferManager(mode) {
    // Error state set to false if an exception is caught:
    this.errorState = true;
    this.functionMap = {"transfer":parseTransfers,
                    "dilution":parseDilutionTransfers,
                    "adapter":parseAdapterTransfers };
    this.parseFunction = this.functionMap[mode];
    if(typeof this.parseFunction === "undefined") {
        this.parseFunction = parseTransfers;
        // DEBUG
        print("Unknown string parameter for parse function. " +
              "Defaulting to parseTransfers");
    }
    // Array of Transfer objects:
    this.transfers;
    // Current transfer object:
    this.current;
    // Index of current transfer object:
    this.index;
    // Reference next element to predict tip handling:
    this.next;
    // Tip handling:
    this.newTips = new Tipbox(96);
    this.usedTips = new Tipbox(0);
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
    }
    this.size = function() {
        return (typeof this.transfers !== "undefined") ? this.transfers.length : 0;
    }
    this.increment = function() {
        try {
            this.current = this.next;
            this.index++;
            if(this.index < this.size() - 1) {
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
        return this.current.source;
    }
    this.getWellSelectionTransferDestination = function() {
        return this.current.destination;
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
        return (this.index == this.size()-1 || this.next.newTip);
    }
    this.updateTipState = function() {
        this.newTips.increment();
        this.usedTips.increment();
    }
    
}
//DEBUG:
print("jgr_lib_v1202.js EOF");
