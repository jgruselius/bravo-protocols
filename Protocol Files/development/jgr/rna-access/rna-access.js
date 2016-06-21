/* Joel Gruselius, 2015, National Genomics Infrastructure */

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/rna-access/";
var form = "rna-access.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formColumns = parseInt(formColumns, 10);

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Skipping incubations!");

var protocols = {};

protocols["Plate filler"] = {
	file: "rna-access_filler.pro",
	settings: {
		volumes: [400, 1300]
	}
};

protocols["Fragmentation"] = {
	file: "rna-access_reaction.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		sampleVolume: 8.5,
		reagentVolume: 8.5,
		doOffDeckIncubation: true
	}
};

protocols["1st strand synthesis"] = {
	file: "rna-access_reaction.pro",
	settings: {
		tipColumn: 2,
		reagentColumn: 2,
		sampleVolume: 15,
		reagentVolume: 8,
		doOffDeckIncubation: true
	}
};

protocols["2nd strand synthesis"] = {
	file: "rna-access_reaction.pro",
	settings: {
		tipColumn: 3,
		reagentColumn: 3,
		sampleVolume: 23,
		bufferVolume: 5,
		reagentVolume: 20,
		doOffDeckIncubation: true
	}
};

protocols["A-tailing"] = {
	file: "rna-access_reaction.pro",
	settings: {
		tipColumn: 4,
		reagentColumn: 4,
		sampleVolume: 17.5,
		bufferVolume: 2.5,
		reagentVolume: 12.5,
		doOffDeckIncubation: true
	}
};

protocols["Ligation"] = {
	file: "rna-access_ligation.pro",
	settings: {
		tipColumn: 5,
		reagentColumn: 5,
		sampleVolume: 30,
		bufferVolume: 2.5,
		reagentVolume: 2.5,
		adapterVolume: 2.5,
		stopVolume: 5,
		doOffDeckIncubation: false,
		incubationTime: 600,
		incubationTemperature: 30,
	}
};

protocols["cDNA cleanup"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 48,
		beadVolume: 90,
		elutionVolume: 17.5
	}
};

protocols["Ligation cleanup 1"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 42.5,
		beadVolume: 42,
		elutionVolume: 50
	}
};

protocols["Ligation cleanup 2"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 50,
		elutionVolume: 20,
	}
};

protocols["PCR cleanup"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 50,
		elutionVolume: 15
	}
};

protocols["Capture cleanup"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 25,
		beadVolume: 45,
		elutionVolume: 25
	}
};

protocols["PCR cleanup 2"] = {
	file: "illumina_spri.pro",
	settings: {
		sampleVolume: 50,
		beadVolume: 90,
		elutionVolume: 30
	}
};

protocols["PCR setup"] = {
	file: "illumina_spri.pro",
	settings: {
		tipColumn: 7,
		reagentColumn: 7,
		sampleVolume: 20,
		reagentVolume: 25,
		primerVolume: 5,
		doOffDeckIncubation: true
	}
};

protocols["Hyb setup 1"] = {
	file: "rna-access_hyb.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		bufferVolume: 50,
		oligoVolume: 5,
		sampleVolume: 45,
		dilutionVolume: 0
	}
};

protocols["Capture wash"] = {
	file: "rna-access_wash.pro",
	settings: {
		sampleVolume: 100,
		beadVolume: 250,
		washVolume: 200
	}
};

protocols["Capture elution"] = {
	file: "rna-access_elution.pro";
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		buffer1Volume: 23,
		buffer2Volume: 4
	}
};

protocols["Hyb setup 2"] = {
	file: "rna-access_hyb.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		bufferVolume: 50,
		oligoVolume: 5,
		sampleVolume: 25,
		dilutionVolume: 20
	}
};

protocols["PCR setup 2"] = {
	file: "rna-access_pcr.pro",
	settings: {
		tipColumn: 1,
		reagentColumn: 1,
		sampleVolume: 20,
		reagentVolume: 20,
		primerVolume: 5,
		doOffDeckIncubation: true
	}
};

protocols["Library prep"] = {
	file: "rna-access.rst"
};

protocols["Ligation cleanup"] = {
	file: ".rst"
};

protocols["Capture"] = {
	file: "rna-access_capture.rst"
};

var settings = {};
var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["Fragmentation","1st strand synthesis", "2nd strand synthesis",
		"cDNA cleanup","A-tailing","Ligation","Ligation cleanup 1",
		"Ligation cleanup 2", "PCR setup"];
	runset.openRunsetFile(path+protocols[formProtocol].file, form);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runset.openRunsetFile(path+protocols[formProtocol].file, form);
	updateSettings(formProtocol);
} else if(formProtocol === "Capture") {
	runsetMode = true;
	runsetOrder = ["Capture wash", "Capture elution"];
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
