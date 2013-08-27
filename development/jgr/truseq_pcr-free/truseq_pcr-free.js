runset.clear();

var path = "C:/VWorks Workspace/Protocol Files/development/jgr/truseq_pcr-free";

run("C:/VWorks Workspace/Protocol Files/facility/resources/clear_inventory.bat", true);

var runsetMode = false;	// Alt settings for library prep runset (true/false)
formColumns = parseInt(formColumns, 10);


var truseq = {};
var purif = {};

var truseqPresets = {};
truseqPresets["End repair"] = {tipColumn:1,reagentColumn:1,sampleVolume:50,reagentVolume:50,incubationTime:1800,doOffDeckIncubation:true};
truseqPresets["A-tailing"] = {tipColumn:2,reagentColumn:2,sampleVolume:15,reagentVolume:15,incubationTime:1800,doOffDeckIncubation:true};
truseqPresets["Ligation"] = {tipColumn:3,reagentColumn:3,sampleVolume:30,reagentVolume:5,incubationTime:600,doOffDeckIncubation:true};
truseqPresets["Stop ligation"] = {tipColumn:4,reagentColumn:4,sampleVolume:35,reagentVolume:5,incubationTime:0,doOffDeckIncubation:false};

var purifPresets = {};
purifPresets["Fragmentation cleanup"] = {sampleVolume:50,beadVolume:80,elutionVolume:50};
purifPresets["Size selection"] = {sampleVolume:100,beadVolume1:95,beadVolume2:30,bindVolume:160,transferVolume:150,elutionVolume:15};
purifPresets["Ligation cleanup 1"] = {sampleVolume:37.5,beadVolume:42.5,elutionVolume:50};
purifPresets["Ligation cleanup 2"] = {sampleVolume:50,beadVolume:50,elutionVolume:20};

// Allow to run individually??
switch(formProtocol) {
	case "Bead purification":
		// Expand to nextera_spri_setup + nextera_spri runset?
		runset.appendProtocolFileToRunset(path+"/illumina_spri.pro", 1, "", "truseq_pcr-free.VWForm");
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
		runsetMode = true;
		runset.openRunsetFile(path+"/truseq_pcr-free.rst", "truseq_pcr-free.VWForm");
		break;
	case "End repair":
		var settings = truseqPresets["End repair"];
		truseq.tipColumn = settings.tipColumn;
		truseq.reagentColumn = settings.reagentColumn;
		truseq.sampleVolume = settings.sampleVolume;
		truseq.reagentVolume = settings.reagentVolume;
		truseq.incubationTime = settings.incubationTime;
		truseq.doOffDeckIncubation = settings.doOffDeckIncubation;
		runset.appendProtocolFileToRunset(path+"/truseq_reaction_NEXT.pro", 1, "", "truseq_pcr-free.VWForm");
		break;
	case "A-tailing":
		var settings = truseqPresets["A-tailing"];
		truseq.tipColumn = settings.tipColumn;
		truseq.reagentColumn = settings.reagentColumn;
		truseq.sampleVolume = settings.sampleVolume;
		truseq.reagentVolume = settings.reagentVolume;
		truseq.incubationTime = settings.incubationTime;
		truseq.doOffDeckIncubation = settings.doOffDeckIncubation;
		runset.appendProtocolFileToRunset(path+"/truseq_reaction_NEXT.pro", 1, "", "truseq_pcr-free.VWForm");
		break;
	case "Ligation":
		var settings = truseqPresets["Ligation"];
		truseq.tipColumn = settings.tipColumn;
		truseq.reagentColumn = settings.reagentColumn;
		truseq.sampleVolume = settings.sampleVolume;
		truseq.reagentVolume = settings.reagentVolume;
		truseq.incubationTime = settings.incubationTime;
		truseq.doOffDeckIncubation = settings.doOffDeckIncubation;
		runset.appendProtocolFileToRunset(path+"/truseq_reaction_NEXT.pro", 1, "", "truseq_pcr-free.VWForm");
		break;
	case "Stop ligation":
		var settings = truseqPresets["Stop ligation"];
		truseq.tipColumn = settings.tipColumn;
		truseq.reagentColumn = settings.reagentColumn;
		truseq.sampleVolume = settings.sampleVolume;
		truseq.reagentVolume = settings.reagentVolume;
		truseq.incubationTime = settings.incubationTime;
		truseq.doOffDeckIncubation = settings.doOffDeckIncubation;
		runset.appendProtocolFileToRunset(path+"/truseq_reaction_NEXT.pro", 1, "", "truseq_pcr-free.VWForm");
		break;
}