/* Joel Gruselius, 2016, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/16s/";
var form = "16s.VWForm"

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var columns = parseInt(formColumns, 10);
var originalIndexPlate = !!formOriginalIndexPlate;

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Running in test mode: Skipping incubations!");

var protocols = {};

protocols["PCR setup 1"] = {
	file: "16s_first_pcr.pro",
	settings: {
		sampleVolume: 4,
		reagentVolume: 11,
		primerVolume: 6,
		tipColumn: 1,
		reagentColumn: 1,
		finalHold: false
	}
};

protocols["PCR setup 2"] = {
	file: "16s_second_pcr.pro",
	settings: {
		sampleVolume: 6,
		reagentVolume: 10,
		primerVolume: 4,
		tipColumn: 1,
		reagentColumn: 1,
		finalHold: false,
		originalIndexPlate: false
	}
};

protocols["PCR cleanup 1"] = {
	file: "16s_ampure_xp.pro",
	settings: {
		sampleVolume: 21,
		beadVolume: 37.8,
		bindTime: 300,
		elutionVolume: 30,
		beadPlateToUse: 1,
		altBindPlate: true,
		splitEluateVolume: 6
	}
};

protocols["PCR cleanup 2"] = {
	file: "16s_ampure_xp.pro",
	settings: {
		sampleVolume: 20,
		beadVolume: 20,
		bindTime: 300,
		elutionVolume: 20,
		altBindPlate: true
	}
};

var settings = {};

updateSettings(formProtocol);

if(formProtocol === "PCR cleanup 1" && settings.splitEluateVolume > 0) {
	runset.openRunsetFile(path+"16s_ampure_and_transfer.rst", form);
} else {
	runset.appendProtocolFileToRunset(path+protocols[formProtocol].file, 1, "", form);
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
