/* Joel Gruselius, 2016, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/10x/";
var form = "10x.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formColumns = parseInt(formColumns, 10);

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Skipping incubations!");

var protocols = {};

protocols["Plate filler"] = {
	file: "10x_filler.pro",
	settings: {
		volumes: [400, 1300]
	}
};

protocols["A-tailing"] = {
	file: "10x_reaction.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		sampleVolume: 50,
		bufferVolume: 0,
		reagentVolume: 10,
		doOffDeckIncubation: true
	}
};

protocols["Ligation"] = {
	file: "10x_ligation.pro",
	settings: {
		tipColumn: 2,
		reagentColumn: 2,
		sampleVolume: 60,
		bufferVolume: 0,
		reagentVolume: 47.5,
		adapterVolume: 2.5,
		doOffDeckIncubation: true
	}
};

protocols["Ligation cleanup"] = {
	file: "10x_spri.pro",
	settings: {
		sampleVolume: 110,
		beadVolume: 88,
		elutionVolume: 40
	}
};

protocols["PCR setup"] = {
	file: "10x_pcr.pro",
	settings: {
		tipColumn:3,
		reagentColumn:3,
		sampleVolume:40,
		reagentVolume:55,
		primerVolume:5
	}
};

protocols["PCR cleanup"] = {
	file: "10x_double-spri.pro",
	settings: {
		sampleVolume: 100,
		beadVolume1: 50,
		beadVolume2: 20,
		beadDiluteVolume1: 0,
		transferVolume: 150,
		elutionVolume: 20
	}
};

protocols["Library prep"] = {
	file: "10x.rst"
};

var settings = {};
var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["A-tailing","Ligation","Ligation cleanup","PCR setup"];
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
