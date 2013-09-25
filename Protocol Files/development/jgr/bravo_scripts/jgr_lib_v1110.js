/*
 jgr_lib_v1110.js
 Author: Joel Gruselius
 Version: v1110
 Description: Helper functions and classes for VWorks scripts, requires
 the VWorks-defined global functions 
*/

// CLASSES =====================================================================

/*
 A Setting object consists of a name (could also be a description),
 value and a lower and upper limit for that value. The value is set
 after instantiation
*/
function Setting(name, min, max, defaultValue) {
    this.name = name;
    this.min = readNumerical(min);
    this.max = readNumerical(max);
    this.value = defaultValue;
    if(min > max || defaultValue > max || defaultValue < min) {
        throw "InvalidBoundsException";
    }
}
Setting.prototype.setValue = function(value) {
    if(value >= this.min && value <= this.max) {
        try {
            this.value = readNumerical(value);
        } catch(e) {
            throw e;
        }
    } else {
        throw "OutOfBoundsException";
    }
}
Setting.prototype.getValue = function() {
    if(typeof this.value === "undefined") {
        throw "UndefinedValueException";
    }
    return this.value;
}
Setting.prototype.getStringRepresentation = function() {
    var str = "value: ";
    if(typeof this.value === "undefined") {
        str += "not set, ";
    } else {
        str += this.value + ", ";
    }
    str += "min: " + this.min + ", max: " + this.max + ", descr: " + this.name;
    return str;
}

/*
 Object containing information of a liquid transfer; a set of source
 coordinates (row, columnn), a volume and destination coordinates
*/
function Transfer(source, volume, destination) {
    this.source = source;
    this.volume = volume;
    this.destination = destination;
    this.getStringRepresentation = function() {
        return this.volume + " from " + this.source + " to " + this.destination;
    }
}

/*
 Functions to track tips and tipbox configuration, assumes headmode
 is '4,2,1,1', i.e. one tip at back-left.
*/
function Tipbox(type) {
    if(type === "empty") {
        this.type = 0;
        this.row = 0;
        this.column = 1;
    } else if(type === "full") {
        this.type = 1;
        this.row = 9;
        this.column = 12;
    }
    this.getNextPosition = function() {
        switch(this.type) {
            // Empty tipbox:
            case 0:
                if(this.row === 8) {
                    this.column++;
                    this.row = 1;
                } else {
                    this.row++;
                }
                break;
            // Full tipbox:
            case 1:
                if(this.row === 1) {
                    this.column--;
                    this.row = 8;
                } else {
                    this.row--;
                }
                break;
        }
        return [this.row, this.column];
    }
}

/*
 Class composition that includes all underlying code for handling single-tip
 transfers.
*/
function TransferManager() {
    this.errorState = true;     // Changes to 'false' if error occurs
    this.transferTable;
    this.size = 0;
    this.count = 0;
    this.newTips = new Tipbox("full");
    this.oldTips = new Tipbox("empty");
    this.currentGetTip;
    this.currentReturnTip;
    this.currentTransfer; 
    this.loadTransferTable = function(filePath) {
        try {
            this.transferTable = parseTransferTable(readFile(filePath));
            this.size = this.transferTable.length;
        } catch(e) {
            this.errorState = false;
            print(e);
        } finally {
            // Overkill perhaps..
            if(typeof this.transferTable === "undefined") {
                this.errorState = false;
            } else if(this.transferTable.length === 0) {
                this.errorState = false;
            }
        }
    }
    this.increment = function(changeTip) {
        if(typeof changeTip === "undefined" || typeof changeTip !== "boolean") {
            changeTip = true;
        }
        if(changeTip) {
            this.currentGetTip = this.newTips.getNextPosition();
            this.currentReturnTip = this.oldTips.getNextPosition();
        }
        this.currentTransfer = this.transferTable[this.count];
        this.count++;
    }
    this.hasNext = function() {
        return (this.count < this.size);
    }
    this.getCount = function() {
        return this.count;
    }
    this.getNewTipSelection = function() {
        return [this.currentGetTip];
    }
    this.getReturnTipSelection = function() {
        return [this.currentReturnTip];
    }
    this.getVolume = function() {
        return this.currentTransfer.volume;
    }
    this.getSourceSelection = function() {
        return [this.currentTransfer.source];
    }
    this.getDestinationSelection = function() {
        return [this.currentTransfer.destination];
    }
}

// FUNCTIONS ===================================================================

/*
 Parses a string-represented integer or float
*/
function readNumerical(value) {
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
 Check if a given value lies within the defined
 bounds, i.e. between the minimum and maximum value
 returns the boolean result
*/
function isWithin(value, min, max) {
    return ((value <= min) && (value >= max));
}

/*
 Checks an array of values against an array of
 defined bounds and returns true if all values
 are within their bounds and false if any value
 is out of bounds
*/
function areWithin(valueArray, boundsArray) {
    var pass = true;
    for(var i = 0, len = valueArray.length; i < len; i++) {
        var value = valueArray[i];
        var bounds = boundsArray[i];
        if(value < bounds.min || value > bounds.max) {
            pass = false;
            break;
        }
    }
    return pass;
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
    var conversionTable = {A:1, B:2, C:3, D:4, E:5, F:6, G:7, H:8};
    // readNumerical function is used here to work both when wellPos
    // has format 'A5' as well as 'A05'
    try {
        var row = readNumerical(conversionTable[wellPos.charAt(0)]);
        var column = readNumerical(wellPos.slice(1));
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
 Parses a string containing position and volume information
 into an array, assumes format is <source,volume,destination>,
 e.g. 'A6,25,B8'
*/
function parseTransferTable(str, delimiter) {
    if(typeof delimiter === "undefined") {
        delimiter = ",";
    }
    var rawRowArray = str.split("\n");
    // Remove all empty rows:
    var rowArray = new Array();
    for(var i = 0, len = rawRowArray.length; i < len; i++) {
        var row = rawRowArray[i];
        if(row !== "") {
            rowArray.push(row);
        }
    }
    var transferTable = new Array();
    // Parse row-by-row:
    for(var i = 0, len = rowArray.length; i < len; i++) {
        var currentRow = rowArray[i].split(delimiter);
        if(currentRow.length > 0) {
            try {
                var source = convertCoords(currentRow[0]);
                var volume = readNumerical(currentRow[1]);
                var destination = convertCoords(currentRow[2]);
            } catch(e) {
                throw "UnableToParseTransferTableException:" + e;
            }
            transferTable[i] = new Transfer(source, volume, destination);
        }
    }
    return transferTable;
}

/*
 Parses a string containing name/value information into a table/object,
 assumes entries are in format name=value and separated by a
 newline character. Returns an object with name/value properties
*/
function parseSettings(str) {
    var settingTable = {};
    var rawRowArray = str.split("\n");
    // Remove all empty rows:
    var rowArray = new Array();
    for(var i = 0, len = rawRowArray.length; i < len; i++) {
        var row = rawRowArray[i];
        if(row !== "") {
            rowArray.push(row);
        }
    }
    // Parse row-by-row:
    for(var i = 0, len = rowArray.length; i < len; i++) {
        var currentRow = rowArray[i].split("=");
        if(currentRow.length > 0) {
            try {
                var name = currentRow[0];
                var value = readNumerical(currentRow[1]);
            } catch(e) {
                throw "UnableToParseSettingTableException:" + e;
            }
            settingTable[name] = value;
        }
    }
    return settingTable;
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

// PROXIES =====================================================================

/*
 Opens the specified file, reads content and returns an array
 of settings
*/
function loadSettings(filePath) {
    try {
        return parseSettings(readFile(filePath));
    } catch(e) {
        throw "UnableToLoadSettingsException:" + e;
    }
}

/*
 Writes the strings in the array to a text file and separates
 them by a newline character
*/
function saveSettings(settingsArray, filePath) {
    var str = "";
    for(var i = 0, len = settingsArray.length; i < len; i++) {
        str += settingsArray[i] + "\n";
    }
    try {
        writeFile(filePath, str);
    } catch(e) {
        throw "UnableToWriteSettingsException:" + e;
    }
}

/*
 Combines functions for loading a text file and parsing the contents.
 Returns transfer array if no exceptions were raised, otherwise 'false'.
*/
function loadTransfer(filePath) {
    var state;
    try {
        state = parseTransferTable(readFile(filePath));
    } catch(e) {
        state = false;
    } finally {
        return state;
    }
}

