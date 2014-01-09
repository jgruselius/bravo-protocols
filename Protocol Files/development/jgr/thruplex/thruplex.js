runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/thruplex/";
var form = "thruplex.VWForm"

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);

var presets = {};
presets["Template preparation"] = {tipColumn:1,reagentColumn:1,sampleVolume:10,reagentVolume:3,incubationTemperature:22,incubationTime:1500,doOffDeckIncubation:true};
presets["Library synthesis"] = {tipColumn:2,reagentColumn:2,sampleVolume:13,reagentVolume:2,incubationTemperature:22,incubationTime:2400,doOffDeckIncubation:false};
presets["PCR setup"] = {tipColumn:3,reagentColumn:3,sampleVolume:16,reagentVolume:58,incubationTemperature:22,incubationTime:0,doOffDeckIncubation:true};

presets["PCR cleanup"] = {sampleVolume:50,beadVolume:50,elutionVolume:30};

var settings = {};

var fileNames = {};
fileNames["Template preparation"] = "thruplex.pro";
fileNames["Library synthesis"] = "thruplex.pro";
fileNames["PCR setup"] = "thruplex_pcr.pro";
fileNames["PCR cleanup"] = "illumina_spri.pro";
fileNames["ThruPLEX"] = "thruplex.rst";

var runsetOrder = [];

if(formProtocol === "ThruPLEX") {
	runsetMode = true;
	runsetOrder = ["Template preparation","Library synthesis","PCR setup"];
	runset.openRunsetFile(path+fileNames[formProtocol], form);
} else {
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
