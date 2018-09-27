/* Joel Gruselius, 2016, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/16s/";
var form = "16s.VWForm"

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var columns = parseInt(formColumns, 10);
var originalIndexPlate = !!formOriginalIndexPlate;

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Running in test mode: Skipping incubations!");

var protocols = {};

protocols["PCR setup 1"] = {
	file: "16s_first_pcr.pro",
	settings: {
		sampleVolume: 20,
		reagentVolume: 25,
		primerVolume: 5,
		tipColumn: 1,
		reagentColumn: 1,
		finalHold: false
	}
};

protocols["PCR setup 2"] = {
	file: "16s_second_pcr.pro",
	settings: {
		sampleVolume: 20,
		reagentVolume: 25,
		primerVolume: 5,
		tipColumn: 2,
		reagentColumn: 2,
		finalHold: false,
		originalIndexPlate: false
	}
};

protocols["PCR cleanup 1"] = {
	file: "ampure_xp.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 90,
		bindTime: 300,
		elutionVolume: 18,
		beadPlateToUse: 1
	}
};

protocols["PCR cleanup 2"] = {
	file: "ampure_xp.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 40,
		bindTime: 300,
		elutionVolume: 32
	}
};

var settings = {};
var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["Tagmentation","Denaturation wash", "PCR setup"];
	runset.openRunsetFile(path+protocols[formProtocol].file, form);
} else {
	runset.appendProtocolFileToRunset(path+protocols[formProtocol].file, 1, "", form);
	updateSettings(formProtocol);
}

function updateSettings(protocol) {
	if(protocol in protocols) {
		settings = protocols[protocol].settings;
		settings.protocolName = protocol;
		print(protocol + " preset loaded");
	} else {
		settings = {};
		throw "EXCEPTION__UndefinedSetting:"+protocol;
	}
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
		return 0.078 - 9.501E-5*v + (0.734-e)/v;
	} else {
		throw "ValueException";
	}
}
