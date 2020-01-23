/* Joel Gruselius, 2016, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/nextera_flex/";
var form = "nextera_flex.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formColumns = parseInt(formColumns, 10);
var originalIndexPlate = !!formOriginalIndexPlate;

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Running in test mode: Skipping incubations!");

var protocols = {};

protocols["Plate filler"] = {
	file: "nextera_flex_filler.pro",
	settings: {
		volumes: [400]
	}
};

protocols["Tagmentation"] = {
	file: "nextera_flex.pro",
	settings: {
		tipColumn: 12,
		reagentColumn: 1,
		sampleVolume: 30,
		reagentVolume: 20,
		beadVolume: 0,
		stopVolume: 10,
		doOffDeckIncubation: true
	}
};

protocols["Denaturation wash"] = {
	file: "nextera_flex_wash.pro",
	settings: {
		sampleVolume: 60,
		washVolume: 100,
		doOffDeckIncubation: false,
		incubationTime: 900,
		incubationTemperature: 37
	}
};

protocols["PCR setup"] = {
	file: "nextera_flex_pcr.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		sampleVolume: 100,
		reagentVolume: 40,
		primerVolume: 10,
		doOffDeckIncubation: true
	}
};

protocols["PCR cleanup"] = {
	file: "nextera_flex_spri.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 35,
		elutionVolume: 32.5
	}
};

protocols["Size selection"] = {
	file: "nextera_flex_double-spri.pro",
	settings: {
		sampleVolume: 45,
		beadVolume1: 42.5,
		beadVolume2: 15,
		beadDiluteVolume1: 40,
		beadDiluteVolume2: 0,
		transferVolume: 125,
		elutionVolume: 32.5
	}
};

protocols["Library prep"] = {
	file: "nextera_flex.rst"
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
