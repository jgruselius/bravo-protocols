runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/sebastian/small_rna/";
var form = "small_rna.VWForm";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

numberOfColumns = parseInt(numberOfColumns);

var fileNames = {};
fileNames["Run Both Protocols"] = "small_rna.rst";
fileNames["Adapter Ligation"] = "adapterLigation.pro";
fileNames["Reverse Transcribe"] = "reverseTranscription.pro";


if(protocolToBeRun === "Adapter Ligation + Reverse Transcribe") {
	runset.openRunsetFile(path+fileNames["Run Both Protocols"], form);
} 
if(protocolToBeRun === "Adapter Ligation") {
	runset.appendProtocolFileToRunset(path+fileNames["Adapter Ligation"], 1, "", form);
} 
if(protocolToBeRun === "Reverse Transcribe") {
	runset.appendProtocolFileToRunset(path+fileNames["Reverse Transcribe"], 1, "", form);
} 

function dph(vol) {
	var v = parseFloat(vol);
	if(v > 0 && !isNaN(v)) {
		return (0.08*v + 0.2) / v;
	} else {
		throw "ValueException";
	}
}

