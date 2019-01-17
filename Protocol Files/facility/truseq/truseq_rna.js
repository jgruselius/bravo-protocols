/*
 truseq_rna.js
 Author: Joel Gruselius
 Version: 2017-10
 Description: Helper functions for TruSeq runset
*/

/*
 Settings for purification must be accessible form the purification protocol
 and updated from other protocols. This script must be run so that the variables
 are defined in the global namespace:
*/

runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/facility/truseq/";
var form = "truseq_rna.VWForm"

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var extended = !!formExtended;
var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);
var reagentPause = !!formReagentPause;

var testMode = false;

var presets = {};

presets["Adenylation"] = {
		sampleVolume: 15,
		reagentVolume: 15,
		tipColumn: 1,
		reagentColumn: 1,
		incubationTemp: 53,
		incubationTime: 1800
};
presets["Ligation"] = {
		sampleVolume: 30,
		reagentVolume: 5,
		bufferVolume: 5,
		adapterVolume: 2.5,
		tipColumn: 2,
		reagentColumn: 2,
		incubationTemp: 30,
		incubationTime: 600,
};
presets["PCR setup"] = {
		sampleVolume: 20,
		reagentVolume: 25,
		primerVolume: 5,
		tipColumn: 1,
		reagentColumn: 1,
		finalHold: !!formFinalHold
};
presets["cDNA cleanup"] = {
		sampleVolume: 50,
		beadVolume: 90,
		bindTime: 600,
		elutionVolume: 18,
		sealFinalPlate: false,
		finalHold: false,
		beadPlateToUse: 1
};
presets["Ligation cleanup 1"] = {
		sampleVolume: 42.5,
		beadVolume: 34,
		bindTime: 300,
		elutionVolume: 52,
		sealFinalPlate: false,
		finalHold: false,
		beadPlateToUse: 2
};
presets["Ligation cleanup 2"] = {
		sampleVolume: 50,
		beadVolume: 40,
		bindTime: 300,
		elutionVolume: 22,
		sealFinalPlate: true,
		finalHold: !!formFinalHold,
		beadPlateToUse: 3
};
presets["PCR cleanup"] = {
		sampleVolume: 50,
		beadVolume: 40,
		bindTime: 300,
		elutionVolume: 32,
		sealFinalPlate: true,
		beadPlateToUse: 1,
		finalHold: !!formFinalHold
};

var settings = {};

var fileNames = {};
fileNames["mRNA purification"] = "rna_prep_v1511.pro";
fileNames["cDNA cleanup"] = "illumina_spri.pro";
fileNames["Adenylation"] = "truseq_rna_adenylation.pro";
fileNames["PCR setup"] = "truseq_rna_pcr.pro";
fileNames["PCR cleanup"] = "illumina_spri.pro";
fileNames["Ligation"] = "truseq_rna_ligation.pro";
fileNames["Adapter ligation"] = "truseq_rna_adapter_ligation.rst";
fileNames["Adapter ligation (no cDNA cleanup)"] = "truseq_rna_adapter_ligation_short.rst";
fileNames["Ligation cleanup"] = "illumina_spri_runset_twice.rst";

if(extended) {
	for(var p in fileNames) {
		fileNames[p] = "extended/" + fileNames[p];
	}
}

var runsetOrder = [];

if(formProtocol === "Adapter ligation") {
	runsetMode = true;
	runsetOrder = ["cDNA cleanup","Adenylation","Ligation",
		"Ligation cleanup 1","Ligation cleanup 2"];
	runset.appendRunsetFileToRunset(path+fileNames[formProtocol], form);
} else if(formProtocol === "Adapter ligation (no cDNA cleanup)") {
	runsetMode = true;
	runsetOrder = ["Adenylation","Ligation", "Ligation cleanup 1",
		"Ligation cleanup 2"];
	runset.appendRunsetFileToRunset(path+fileNames[formProtocol], form);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runsetOrder = ["Ligation cleanup 1","Ligation cleanup 2"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else {
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol], 1, "", form);
	updateSettings(formProtocol);
}

function updateSettings(protocol) {
	settings = {};
	if(protocol in presets) {
		settings = presets[protocol];
	} else {
		throw "EXCEPTION__UndefinedSetting:"+protocol;
	}
	print(protocol + " preset loaded");
}

var runsetIndex = 0;
function updateRunset() {
	updateSettings(runsetOrder[runsetIndex++]);
}

function dph(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}