/*
 truseq_startup_v1110.js
 Author: Joel Gruselius
 Version: v1110
 Description: Helper functions for TruSeq runset
*/

/*
 Settings for purification must be accessible form the purification protocol
 and updated from other protocols. The variables are defined in the global
 context:
*/

var ca = {};


/*
 Adds/sets the variables in the ca object. Returns true if the specified
 string 'type' is recognized, otherwise returns false:
*/
function updateSettings(type) {
    var return_state = true;
    if(type === "end_repair") {
        ca.sampleVolume = 100;
        ca.beadVolume = 50;
        ca.precipVolume = 200;
        ca.beadResuspVolume = 20;
        ca.bindTime = 10;
        ca.elutionVolume = 15;
    } else if(type === "ligation") {
        ca.sampleVolume = 40;
        ca.beadVolume = 50;
        ca.precipVolume = 100;
        ca.beadResuspVolume = 20;
        ca.bindTime = 10;
        ca.elutionVolume = 30;
    } else {
        return_state = false;
    }
    return return_state;
}