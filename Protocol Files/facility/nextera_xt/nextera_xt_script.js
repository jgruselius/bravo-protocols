runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/facility/nextera_xt";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode;		// Alt settings for library prep runset (true/false)
var formMode;		// Sets Nextera RC (1) or XT (0) mode
formColumns = parseInt(formColumns, 10);

var purif = {};
var pcr = {};

var purifPresets = {};
purifPresets["Tagmentation cleanup"] = {sampleVolume:65,beadVolume:65,elutionVolume:20};
purifPresets["PCR cleanup"] = {sampleVolume:50,beadVolume:90,elutionVolume:25};
purifPresets["PCR cleanup (long insert)"] = {sampleVolume:50,beadVolume:30,elutionVolume:25};
purifPresets["PCR cleanup (MiSeq 2x250 bp)"] = {sampleVolume:50,beadVolume:25,elutionVolume:25};

switch(formProtocol) {
	case "Bead purification":
		// Expand to nextera_spri_setup + nextera_spri runset?
		runset.appendProtocolFileToRunset(path+"/nextera_spri.pro", 1, "", "nextera_xt_form.VWForm");
		var settings = purifPresets[formPurificationMode];
		purif.sampleVolume = settings.sampleVolume;
		purif.beadVolume = settings.beadVolume;
		purif.eluteVolume = settings.elutionVolume;
		break;
	case "Library prep":
		formMode = 0;
		var settings = purifPresets["Tagmentation cleanup"];
		purif.sampleVolume = settings.sampleVolume;
		purif.beadVolume = settings.beadVolume;
		purif.eluteVolume = settings.elutionVolume;
		pcr.sampleVolume = 25;
		pcr.reagentVolume = 15;
		pcr.primerVolume = 10;
		runsetMode = true;
		runset.openRunsetFile(path+"/nextera_xt_runset.rst", "nextera_xt_form.VWForm");
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
