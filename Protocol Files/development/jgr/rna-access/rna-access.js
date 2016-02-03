runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/rna-access/";
var form = "rna-access.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formColumns = parseInt(formColumns, 10);

var testMode = !!(typeof formTestMode !== "undefined" && formTestMode);
if(testMode) print("Skipping incubations!");

var presets = {};

presets["Plate filler"] = {
	volumes:[400,1300],
	protocolName:"Plate filler"
	};

presets["Fragmentation"] = {
	tipColumn:1,
	reagentColumn:1,
	sampleVolume:8.5,
	reagentVolume:8.5,
	doOffDeckIncubation:true,
	protocolName:"Fragmentation"
	};

presets["1st strand synthesis"] = {
	tipColumn:2,
	reagentColumn:2,
	sampleVolume:15,
	reagentVolume:8,
	doOffDeckIncubation:true,
	protocolName:"1st strand synthesis"
	};

presets["2nd strand synthesis"] = {
	tipColumn:3,
	reagentColumn:3,
	sampleVolume:23,
	bufferVolume:5,
	reagentVolume:20,
	doOffDeckIncubation:true,
	protocolName:"2nd strand synthesis"
	};

presets["A-tailing"] = {
	tipColumn:4,
	reagentColumn:4,
	sampleVolume:17.5,
	bufferVolume:2.5,
	reagentVolume:12.5,
	doOffDeckIncubation:true,
	protocolName:"A-tailing"
	};

presets["Ligation"] = {
	tipColumn:5,
	reagentColumn:5,
	sampleVolume:30,
	bufferVolume:2.5,
	reagentVolume:2.5,
	adapterVolume:2.5,
	stopVolume:5,
	doOffDeckIncubation:false,
	incubationTime:600,
	incubationTemperature:30,
	protocolName:"Ligation"
	};

presets["cDNA cleanup"] = {
	sampleVolume:48,
	beadVolume:90,
	elutionVolume:17.5,
	protocolName:"cDNA cleanup"
	};

presets["Ligation cleanup 1"] = {
	sampleVolume:42.5,
	beadVolume:42,
	elutionVolume:50,
	protocolName:"Ligation cleanup 1"
	};

presets["Ligation cleanup 2"] = {
	sampleVolume:50,
	beadVolume:50,
	elutionVolume:20,
	protocolName:"Ligation cleanup 2"
	};

presets["PCR cleanup"] = {
	sampleVolume:50,
	beadVolume:50,
	elutionVolume:15,
	protocolName:"PCR cleanup"
	};

presets["PCR setup"] = {
	tipColumn:7,
	reagentColumn:7,
	sampleVolume:20,
	reagentVolume:25,
	primerVolume:5,
	doOffDeckIncubation:true,
	protocolName:"PCR setup"
	};

presets["Hyb setup 1"] = {
	tipColumn:7,
	reagentColumn:7,
	bufferVolume:50,
	oligoVolume:5,
	sampleVolume:45,
	dilutionVolume:0,
	protocolName:"Hyb setup"
	};

presets["Capture wash"] = {
	sampleVolume:45,
	beadVolume:250,
	washVolume:200,
	protocolName:"Capture wash"
	};

presets["Capture elution"] = {
	tipColumn:9,
	reagentColumn:9,
	buffer1Volume:23,
	buffer2Volume:4,
	protocolName:"Capture elution"
	};
	
presets["Hyb setup 2"] = {
	tipColumn:11,
	reagentColumn:11,
	bufferVolume:50,
	oligoVolume:5,
	sampleVolume:20,
	dilutionVolume:20,
	protocolName:"Second hyb setup"
	};

presets["PCR setup 2"] = {
	tipColumn:1,
	reagentColumn:1,
	sampleVolume:20,
	reagentVolume:20,
	primerVolume:5,
	doOffDeckIncubation:true,
	protocolName:"PCR setup 2"
	};

var settings = {};

var fileNames = {};
fileNames["Plate filler"] = "rna-access_filler.pro";
fileNames["Fragmentation"] = "rna-access_reaction.pro";
fileNames["1st strand synthesis"] = "rna-access_reaction.pro";
fileNames["2nd strand synthesis"] = "rna-access_reaction.pro";
fileNames["cDNA cleanup"] = "illumina_spri.pro";
fileNames["A-tailing"] = "rna-access_reaction.pro";
fileNames["Ligation"] = "rna-access_ligation.pro";
fileNames["Library prep"] = "rna-access.rst";
fileNames["Ligation cleanup"] = ".rst";
fileNames["PCR setup"] = "rna-access_pcr.pro";
fileNames["PCR cleanup"] = "illumina_spri.pro";
fileNames["Hyb setup 1"] = "rna-access_hyb.pro";
fileNames["Hyb setup 2"] = "rna-access_hyb.pro";
fileNames["Capture wash"] = "rna-access_wash.pro";
fileNames["Capture elution"] = "rna-access_elution.pro";
fileNames["Capture"] = "rna-access_capture.rst";

var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["Fragmentation","1st strand synthesis", "2nd strand synthesis",
		"cDNA cleanup","A-tailing","Ligation","Ligation cleanup 1",
		"Ligation cleanup 2", "PCR setup"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else if(formProtocol === "Ligation cleanup") {
	runsetMode = true;
	runset.openRunsetFile(path+fileNames[formProtocol], form);
	updateSettings(formProtocol);
} else if(formProtocol === "Capture") {
	runsetMode = true;
	runsetOrder = ["Capture wash", "Capture elution"];
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
