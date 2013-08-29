runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/truseq_pcr-free/";
var form = "truseq_pcr-free.VWForm"

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);

var presets = {};
presets["End repair"] = {tipColumn:1,reagentColumn:1,sampleVolume:50,reagentVolume:50,incubationTime:1800,doOffDeckIncubation:true};
presets["A-tailing"] = {tipColumn:2,reagentColumn:2,sampleVolume:15,reagentVolume:15,incubationTime:1800,doOffDeckIncubation:true};
presets["Ligation"] = {tipColumn:3,reagentColumn:3,sampleVolume:30,reagentVolume:5,incubationTime:600,doOffDeckIncubation:true};
presets["Stop ligation"] = {tipColumn:4,reagentColumn:4,sampleVolume:35,reagentVolume:5,incubationTime:0,doOffDeckIncubation:false};

presets["Fragmentation cleanup"] = {sampleVolume:50,beadVolume:80,elutionVolume:50};
presets["Size selection"] = {sampleVolume:100,beadVolume1:95,beadVolume2:30,bindVolume:160,transferVolume:150,elutionVolume:15};
presets["Ligation cleanup 1"] = {sampleVolume:37.5,beadVolume:42.5,elutionVolume:50};
presets["Ligation cleanup 2"] = {sampleVolume:50,beadVolume:50,elutionVolume:20};

var fileNames = {};
fileNames["End repair"] = "truseq_reaction_NEXT.pro";
fileNames["A-tailing"] = "truseq_reaction_NEXT.pro";
fileNames["Ligation"] = "truseq_reaction_NEXT.pro";
fileNames["Stop ligation"] = "truseq_reaction_NEXT.pro";
fileNames["Fragmentation cleanup"] = "illumina_spri.pro";
fileNames["Size selection"] = "illumina_double-spri.pro";
fileNames["Ligation cleanup 1"] = "illumina_spri.pro";
fileNames["Ligation cleanup 2"] = "illumina_spri.pro";
fileNames["Library prep"] = "truseq_pcr-free.rst";

if(formProtocol === "Library prep") {
	runsetMode = true;
	runset.openRunsetFile(path+fileNames[formProtocol], form);
	updateSettings("End repair");
} else {
	runset.appendProtocolFileToRunset(path+fileNames[formProtocol], 1, "", form);
	updateSettings[formProtocol];
}

function updateSettings(protocol) {
	if(protocol in presets) {
		// Define globally:
		settings = {};
		for(var s in presets[protocol]) {
			settings[s] = presets[protocol][s];
		}
	} else {
		throw "EXCEPTION__UndefinedSetting:"+protocol;
	}
	print(protocol + " preset loaded");
}
