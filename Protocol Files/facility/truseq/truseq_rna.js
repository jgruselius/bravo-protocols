/*
 truseq_rna.js
 Author: Joel Gruselius
 Version: 2016-01
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
		sampleVolume: 30,
		reagentVolume: 37.5,
		primerVolume: 7.5,
		tipColumn: 1,
		reagentColumn: 1
};
presets["CA default"] = {
		sampleVolume: 50,
		beadVolume: 20,
		precipVolume: 100,
		beadResuspVolume: 10,
		bindTime: 600,
		elutionVolume: 30,
		sealFinalPlate: false
};
presets["cDNA cleanup"] = {
		sampleVolume: 50,
		beadVolume: 15,
		precipVolume: 100,
		beadResuspVolume: 10,
		dilutionVolume: 0,
		bindTime: 600,
		elutionVolume: 16,
		transferSample: false,
		sealFinalPlate: false
};
presets["Ligation cleanup 1"] = {
		sampleVolume: 42.5,
		beadVolume: 20,
		precipVolume: 100,
		beadResuspVolume: 0,
		dilutionVolume: 17.5,
		bindTime: 600,
		elutionVolume: 50,
		transferSample: true,
		sealFinalPlate: false
};
presets["Ligation cleanup 2"] = {
		sampleVolume: 50,
		beadVolume: 20,
		precipVolume: 100,
		beadResuspVolume: 0,
		dilutionVolume: 10,
		bindTime: 600,
		elutionVolume: 20,
		transferSample: false,
		sealFinalPlate: true
};
presets["PCR cleanup"] = {
		sampleVolume: 50,
		beadVolume: 50,
		precipVolume: 100,
		beadResuspVolume: 10,
		bindTime: 600,
		elutionVolume: 30,
		transferSample: true,
		sealFinalPlate: true
};

var settings = {};

var fileNames = {};
fileNames["mRNA purification"] = "rna_prep_v1511.pro";
fileNames["cDNA cleanup"] = "ca_p1-2.rst";
fileNames["Adenylation"] = "truseq_rna_adenylation.pro";
fileNames["PCR setup"] = "truseq_rna_pcr.pro";
fileNames["PCR cleanup"] = "ca_p2-3.rst";
fileNames["Ligation"] = "truseq_rna_ligation.pro";
fileNames["Adapter ligation"] = "truseq_rna_adapter_ligation.rst";
fileNames["Ligation cleanup"] = "ca_p2-3.rst";

if(extended) {
	for(var p in fileNames) {
		if(!~p.indexOf("cleanup")) {
			fileNames[p] = "extended/" + fileNames[p];
		}
	}
}

var runsetOrder = [];

if(formProtocol === "Adapter ligation") {
	runsetMode = true;
	runsetOrder = ["cDNA cleanup","cDNA cleanup","Adenylation","Ligation",
		"Ligation cleanup 1","Ligation cleanup 2","Ligation cleanup 2"];
	runset.appendRunsetFileToRunset(path+fileNames[formProtocol], form);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runsetOrder = ["Ligation cleanup 1","Ligation cleanup 1",
		"Ligation cleanup 2","Ligation cleanup 2"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else {
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

function dph(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}