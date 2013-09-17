runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/nextera";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode;		// Alt settings for library prep runset (true/false)
var formMode;		// Sets Nextera RC (1) or XT (0) mode
formColumns = parseInt(formColumns, 10);

var purif = {};
var pcr = {};

var purifPresets = {};
purifPresets["Tagmentation cleanup"] = {sampleVolume:65,beadVolume:65,elutionVolume:20};
purifPresets["PCR cleanup"] = {sampleVolume:50,beadVolume:90,elutionVolume:50};
purifPresets["PCR cleanup (long insert)"] = {sampleVolume:50,beadVolume:30,elutionVolume:50};
purifPresets["PCR cleanup (MiSeq 2x250 bp)"] = {sampleVolume:50,beadVolume:25,elutionVolume:50};

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