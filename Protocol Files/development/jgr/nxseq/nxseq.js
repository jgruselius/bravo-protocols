/* Joel Gruselius, 2016, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/nxseq/";
var form = "nxseq.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formColumns = parseInt(formColumns, 10);

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Skipping incubations!");

var protocols = {};

protocols["Plate filler"] = {
	file: "nxseq_filler.pro",
	settings: {
		volumes: [400, 1300]
	}
};

protocols["A-tailing"] = {
	file: "nxseq_reaction.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		sampleVolume: 17,
		bufferVolume: 0,
		reagentVolume: 33,
		doOffDeckIncubation: true
	}
};

protocols["Ligation"] = {
	file: "nxseq_ligation.pro",
	settings: {
		tipColumn: 2,
		reagentColumn: 2,
		sampleVolume: 50,
		bufferVolume: 0,
		reagentVolume: 4,
		adapterVolume: 3,
		doOffDeckIncubation: true
	}
};

protocols["Ligation cleanup 1"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 57,
		beadVolume: 57,
		elutionVolume: 50
	}
};

protocols["Ligation cleanup 2"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 100,
		beadVolume: 75,
		elutionVolume: 25,
	}
};

protocols["Library prep"] = {
	file: "nxseq.rst"
};

protocols["Ligation cleanup"] = {
	file: ".rst"
};

var settings = {};
var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["A-tailing","Ligation","Ligation cleanup 1",
		"Ligation cleanup 2"];
	runset.openRunsetFile(path+protocols[formProtocol].file, form);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runset.openRunsetFile(path+protocols[formProtocol].file, form);
	updateSettings(formProtocol);
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
