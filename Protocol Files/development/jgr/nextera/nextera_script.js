runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/nextera";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
var formMode;			// Sets Nextera RC (1) or XT (0) mode
formColumns = parseInt(formColumns, 10);

var purif = {};
var capture = {};
var pcr = {};

var purifPresets = {};
purifPresets["Tagmentation cleanup"] = {sampleVolume:65,beadVolume:65,elutionVolume:20};
purifPresets["First PCR cleanup"] = {sampleVolume:50,beadVolume:90,elutionVolume:25};
purifPresets["Second PCR cleanup"] = {sampleVolume:50,beadVolume:90,elutionVolume:30};
purifPresets["Capture cleanup"] = {sampleVolume:40,beadVolume:45,elutionVolume:25}; // Extra 15 uL sample volume to compensate for foaming

switch(formProtocol) {
	case "Bead purification":
		// Expand to nextera_spri_setup + nextera_spri runset?
		runset.appendProtocolFileToRunset(path+"/nextera_spri.pro", 1, "", "nextera_form.VWForm");
		var settings = purifPresets[formPurificationMode];
		purif.sampleVolume = settings.sampleVolume;
		purif.beadVolume = settings.beadVolume;
		purif.eluteVolume = settings.elutionVolume;
		break;
	case "Library prep":
		formMode = 1;
		var settings = purifPresets["Tagmentation cleanup"];
		purif.sampleVolume = settings.sampleVolume;
		purif.beadVolume = settings.beadVolume;
		purif.eluteVolume = settings.elutionVolume;
		pcr.sampleVolume = 20;
		pcr.reagentVolume = 20;
		pcr.primerVolume = 10;
		runsetMode = true;
		runset.openRunsetFile(path+"/nextera_runset.rst", "nextera_form.VWForm");
		break;
	case "First hyb setup":
		runset.appendProtocolFileToRunset(path+"/nextera_capture_hyb.pro", 1, "", "nextera_form.VWForm");
		capture.hybMode = 1;
		break;
	case "Second hyb setup":
		runset.appendProtocolFileToRunset(path+"/nextera_capture_hyb.pro", 1, "", "nextera_form.VWForm");
		capture.hybMode = 2;
		break;
	case "Capture-elution":
		runset.openRunsetFile(path+"/nextera_capture_runset.rst", "nextera_form.VWForm");
		break;
	case "Second PCR setup":
		runset.appendProtocolFileToRunset(path+"/nextera_pcr.pro", 1, "", "nextera_form.VWForm");
		pcr.sampleVolume = 25;
		pcr.reagentVolume = 20;
		pcr.primerVolume = 5;
		break;
		
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