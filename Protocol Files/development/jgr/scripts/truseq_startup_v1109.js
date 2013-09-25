/*
 truseq_startup_v1109.js
 Author: Joel Gruselius
 Version: v1109
 Description: Helper functions for TruSeq runset
*/

var truseqPath = "C:\\VWorks Workspace\\Protocol Files\\jgr\\truseq\\";
var configPath = truseqPath + "ca_settings.cfg";

/*
 Writes settings for CA purification protocol, parameter 'type'
 specifies which settings should be stored
*/
function updateSettings(type) {
	print("settings updated to " + type);
    var settingTable = {};
    
    settingTable["end_repair"] = ["columnsOfSamples="+n_columns,
                                  "sampleVolume=100",
                                  "beadVolume=50",
                                  "precipVolume=200",
                                  "beadResuspVolume=20",
                                  "elutionVolume=15",
                                  "bindTime=10"];
    
    settingTable["ligation"] = ["columnsOfSamples="+n_columns,
                                "sampleVolume=40",
                                "beadVolume=50",
                                "precipVolume=100",
                                "beadResuspVolume=20",
                                "elutionVolume=22.5",
                                "bindTime=10"];
    
    var caSettings = settingTable[type];
	// DEBUG:
    if(typeof caSettings === "undefined") {
        print("UndefinedSettingsType");
    }
    try {
        saveSettings(caSettings, configPath);
    } catch(e) {
        print(e);
    }
}