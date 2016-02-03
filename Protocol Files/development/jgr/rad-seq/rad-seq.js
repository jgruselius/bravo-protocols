runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/rad-seq/";
var form = "rad-seq.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);

var presets = {};

presets["Ligation"] = {
	tipColumn:1,
	reagentColumn:1,
	sampleVolume:13,
	reagentVolume:4,
	bufferVolume:30,
	adapterVolume:3,
	doOffDeckIncubation:true,
	protocolName:"Ligation"
	};

presets["Strand displacement"] = {
	tipColumn:4,
	reagentColumn:4,
	sampleVolume:25,
	reagentVolume:25,
	doOffDeckIncubation:true,
	protocolName:"Strand displacement"
	};

presets["Size selection 350 bp"] = {
	sampleVolume:50,
	beadVolume1:95,
	beadVolume2:30,
	bindVolume:160,
	transferVolume:250,
	elutionVolume:20,
	protocolName:"Size selection (350 bp)"
	};

presets["Size selection 550 bp"] = {
	sampleVolume:100,
	beadVolume1:80,
	beadVolume2:30,
	bindVolume:160,
	elutionVolume:20,
	protocolName:"Size selection (550 bp)"
	};

presets["Ligation cleanup"] = {
	sampleVolume:50,
	beadVolume:90,
	elutionVolume:25,
	protocolName:"Ligation cleanup"
	};

presets["PCR cleanup"] = {
	sampleVolume:60,
	beadVolume:60,
	elutionVolume:25,
	protocolName:"PCR cleanup"
	};

presets["PCR setup"] = {
	tipColumn:5,
	reagentColumn:5,
	sampleVolume:20,
	reagentVolume:30,
	primerVolume:10,
	protocolName:"PCR setup"
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