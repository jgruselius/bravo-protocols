/*
 ca_init.js
 Author: Joel Gruselius
 Version: v1109
 Description: Defines user setting variables for the CA protocol, requires
 classes/functions defined in jgr_lib_v1109.js
*/ 

var userSettings = {};
userSettings["columnsOfSamples"] = new Setting("Number of columns of samples", 1, 12, 12);
userSettings["sampleVolume"] = new Setting("Volume of sample", 5, 150, 50);
userSettings["beadVolume"] = new Setting("Volume of beads", 5, 150, 50);
userSettings["precipVolume"] = new Setting("Volume of precipitation buffer", 10, 500, 100);
userSettings["beadResuspVolume"] = new Setting("Volume of bead resupsension", 5, 100, 10);
userSettings["elutionVolume"] = new Setting("Volume to elute sample in", 10, 150, 50);
userSettings["beadWashVolume"] = new Setting("Volume to wash beads in", 5, 500, 100);
userSettings["dnaWashVolume"] = new Setting("Volume to wash beads/DNA in", 50, 500, 200);
userSettings["rinseVolume"] = new Setting("Volume to rinse tips in", 10, 160, 100);
userSettings["bindTime"] = new Setting("Time to incubate binding in min", 1, 30, 10);
userSettings["elutionTime"] = new Setting("Time to incubate elution in min", 1, 30, 2);
userSettings["bindMixInterval"] = new Setting("Time between binding mixes in min", 0.5, 30, 2);
userSettings["beadWashRepeats"] = new Setting("Number of times to wash beads", 1, 5, 1);
userSettings["dnaWashRepeats"] = new Setting("Number of times to wash beads/DNA", 1, 5, 1);

function getSettings(fpath) {
    var settings;
    try {
        settings = loadSettings(fpath);
    } catch(e) {
        print(e);
    }
    // DEBUG:
    if(typeof settings === "undefined") {
        print("UNDEFINED: " + fpath);
		return false;
    }
    for(setting in settings) {
        // DEBUG:
        if(typeof setting === "undefined") {
            print("UNDEFINED ELEMENT");
        }
        try {
            userSettings[setting].setValue(settings[setting]);
        } catch(e) {
            print(e);
        }
    }
    return true;
}