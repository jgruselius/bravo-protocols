/*
 barcodes.js
 Author: Joel Gruselius
 Description: Functions for using barcode information read by the robot
*/

// Which barcode index to use (see VWorks plate object):
var SIDE = 3;

// Return a string with the current date and time
// format YY-MM-DD HH:MM:SS
function timestamp() {
	var d = new Date();
	var date = [d.getFullYear(), d.getMonth()+1, d.getDate(), d.getHours(),
			d.getMinutes(), d.getSeconds()];
	// Convert to string and pad with zeroes, i.e. 8 -> "08":
	date = date.map(function(x) { 
		return (x > 9) ? x + "" : "0" + x;
	})
	return date.slice(0,3).join("-") + " " + date.slice(3).join(":"); 
}

function defaults(value, def) {
	return (typeof value === "undefined") ? def : value;
}

function hasBc(plateObj) {
	var bc = plateObj.barcode[SIDE];
	// Check if undefined/null (VWorks may use string 'undefined'):
	var hasBc = (typeof bc !== "undefined" && bc !== null && bc !== "undefined");
	// Check for number or non-blank string:
	hasBc = hasBc && (!isNaN(parseFloat(bc)) || !!bc.trim());
	return hasBc;
}

function printBc(plateObj) {
	print(plateObj.barcode[SIDE]);
}

function bcMatches(plateObj, barcode) {
	return (plateObj.barcode[SIDE] === barcode);
}

function logBc(plateObj, taskObj, path) {
	var bc = plateObj.barcode[SIDE];
	var plate = plateObj.name;
	var pro = taskObj.getProtocolName();
	var logStr = timestamp() + "\t" + pro + "\t" + plate + "\t" + bc; 
	var file;
	try {
		file = Open(path);
		try {
			file.Write(logStr);
		} catch(e) {
			throw e;
		} finally {
			file.Close();
		}
	} catch(e) {
		throw e;
	}
}

print("barcode.js EOF");