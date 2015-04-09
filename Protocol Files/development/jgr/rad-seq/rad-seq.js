runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/rad-seq/";
var form = "rad-seq.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);

var presets = {};

presets["Strand displacement"] = {
	tipColumn:2,
	reagentColumn:2,
	sampleVolume:25,
	reagentVolume:25,
	doOffDeckIncubation:true
	};

presets["Ligation"] = {
	tipColumn:1,
	reagentColumn:1,
	sampleVolume:13,
	reagentVolume:7,
	bufferVolume:5,
	adapterVolume:3,
	doOffDeckIncubation:true
	};

presets["Size selection 350 bp"] = {
	sampleVolume:50,
	beadVolume1:95,
	beadVolume2:30,
	bindVolume:160,
	transferVolume:250,
	elutionVolume:20
	};

presets["Size selection 550 bp"] = {
	sampleVolume:100,
	beadVolume1:80,
	beadVolume2:30,
	bindVolume:160,
	transferVolume:250,
	elutionVolume:17.5
	};

presets["Ligation cleanup"] = {
	sampleVolume:50,
	beadVolume:90,
	elutionVolume:25
	};

presets["PCR cleanup"] = {
	sampleVolume:50,
	beadVolume:50,
	elutionVolume:25,
	};

presets["PCR setup"] = {
	tipColumn:3,
	reagentColumn:3,
	sampleVolume:20,
	reagentVolume:25,
	primerVolume:5
	};

var settings = {};

var fileNames = {};
fileNames["Strand displacement"] = "rad-seq_reaction.pro";
fileNames["Ligation"] = "rad-seq_ligation.pro";
fileNames["Ligation cleanup"] = "illumina_spri.pro";
fileNames["Size selection 350 bp"] = "illumina_double-spri.pro";
fileNames["Library prep"] = "rad-seq.rst";
fileNames["PCR setup"] = "rad-seq_pcr.pro";
fileNames["PCR cleanup"] = "illumina_spri.pro";

var runsetOrder = [];

if(formProtocol === "Library prep") {
	runsetMode = true;
	runsetOrder = ["Ligation","Ligation cleanup", "Strand displacement", "Size selection "+formInsertSize,
			"PCR setup"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
	print("Runset file loaded");
} else if(formProtocol === "Size selection") {
	runsetMode = false;
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol+" "+formInsertSize], 1, "", form);
	updateSettings(formProtocol+" "+formInsertSize);
}  else {
	runsetMode = false;
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol], 1, "", form);
	updateSettings(formProtocol);
}

function updateSettings(protocol) {
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

// Dynamic Pipetting Height:
function dph(vol) {
	var v = parseFloat(vol);
	if(v > 0 && !isNaN(v)) {
		return (0.08*v + 0.2) / v;
	} else {
		throw "ValueException";
	}
}
