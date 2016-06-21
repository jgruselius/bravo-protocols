runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/truemethyl/";
var form = "truemethyl.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);
var arrayMode = (formMode === "Array");

var presets = {};

presets["oxBS"] = {
	volume: {
		denat: arrayMode ? 50 : 26,
		eluate: 24,
		sample: 50,
		beads1: 100,
		wash1: 170,
		oxsol: 1,
		bsreag: 170,
		bsadd: 5
		},
	washes:3
	};

presets["Post-BS purification"] = {
	sampleVolume:195,
	beadVolume:1000,
	washVolume:1400,
	desulfonationVolume:1000,
	washes:4,
	elutionVolume:15,
	};

var settings = {};

var fileNames = {};
fileNames["oxBS"] = "truemethyl.pro";
fileNames["Post-BS purification"] = "truemethyl_purif.pro";

var runsetOrder = [];

if(true) {
	runsetMode = false;
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol], 1, "", form);
	updateSettings(formProtocol);
}

function updateSettings(protocol) {
	settings = {};
	if(protocol in presets) {
		for(var s in presets[protocol]) {
			settings[s] = presets[protocol][s];
		}
	} else {
		throw "EXCEPTION__UndefinedSetting:"+protocol;
	}
	print(protocol + " preset loaded");
}

var runsetIndex = 0;
function updateRunset() {
	updateSettings(runsetOrder[runsetIndex++]);
}

// Dynamic Pipetting Height 2.0:
function dph(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}

