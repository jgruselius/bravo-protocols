runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/truseq_nano/";
var form = "truseq_nano.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);

var presets = {};
presets["End repair"] = {
	tipColumn:1,
	reagentColumn:1,
	sampleVolume:60,
	reagentVolume:40,
	incubationTemperature:30,
	incubationTime:1800,
	doOffDeckIncubation:true
	};

presets["A-tailing"] = {
	tipColumn:2,
	reagentColumn:2,
	sampleVolume:17.5,
	reagentVolume:12.5,
	incubationTemperature:37,
	incubationTime:1800,
	doOffDeckIncubation:true
	};

presets["Ligation"] = {
	tipColumn:3,
	reagentColumn:3,
	sampleVolume:30,
	reagentVolume:5,
	bufferVolume:5,
	adapterVolume:2.5,
	incubationTemperature:30,
	incubationTime:600,
	doOffDeckIncubation:true
	};

presets["Fragmentation cleanup"] = {
	sampleVolume:50,
	beadVolume:80,
	elutionVolume:60
	};

presets["Size selection 350 bp"] = {
	sampleVolume:100,
	beadVolume1:95,
	beadVolume2:30,
	bindVolume:160,
	transferVolume:250,
	elutionVolume:17.5
	};

presets["Size selection 550 bp"] = {
	sampleVolume:100,
	beadVolume1:80,
	beadVolume2:30,
	bindVolume:160,
	transferVolume:250,
	elutionVolume:17.5
	};

presets["Ligation cleanup 1"] = {
	sampleVolume:42.5,
	beadVolume:42.5,
	elutionVolume:50
	};

presets["Ligation cleanup 2"] = {
	sampleVolume:50,
	beadVolume:50,
	elutionVolume:25
	};

	// Bead volume should be 50 if using single index
presets["PCR cleanup"] = {
	sampleVolume:50,
	beadVolume:50,
	elutionVolume:30
	};

presets["qPCR setup"] = {};

presets["PCR setup"] = {
	tipColumn:5,
	reagentColumn:5,
	sampleVolume:25,
	reagentVolume:20,
	primerVolume:5
	};

var settings = {};

var fileNames = {};
fileNames["End repair"] = "truseq_nano_reaction.pro";
fileNames["A-tailing"] = "truseq_nano_reaction.pro";
fileNames["Ligation"] = "truseq_nano_ligation.pro";
fileNames["Fragmentation cleanup"] = "illumina_spri.pro";
fileNames["Size selection 350 bp"] = "illumina_double-spri.pro";
fileNames["Size selection 550 bp"] = "illumina_double-spri.pro";
fileNames["Ligation cleanup 1"] = "illumina_spri.pro";
fileNames["Ligation cleanup 2"] = "illumina_spri.pro";
fileNames["Library prep"] = "truseq_nano.rst";
fileNames["Ligation cleanup"] = "truseq_nano_cleanup.rst";
fileNames["qPCR setup"] = "../qpcr-384/qpcr-384_setup_ver2.pro";
fileNames["PCR setup"] = "truseq_nano_pcr.pro";
fileNames["PCR cleanup"] = "illumina_spri.pro";

var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["Fragmentation cleanup","End repair","Size selection "+formInsertSize,
			"A-tailing","Ligation","Ligation cleanup 1","Ligation cleanup 2","PCR setup"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else if(formProtocol === "Size selection") {
	runsetMode = false;
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol+" "+formInsertSize], 1, "", form);
	updateSettings(formProtocol+" "+formInsertSize);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runsetOrder = ["Ligation cleanup 1","Ligation cleanup 2"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else {
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
