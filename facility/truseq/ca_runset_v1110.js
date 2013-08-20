/*
 ca_runset_v1110.js
 Author: Joel Gruselius
 Version: v1110
 Description: Helper functions for CA purification runset protocol
*/

function checkSettings() {
    columnsOfSamples = check(columnsOfSamples, 12);
    sampleVolume = check(sampleVolume, 50);
    beadVolume = check(beadVolume, 50);
    precipVolume = check(precipVolume, 100);
    beadResuspVolume = check(beadResuspVolume, 10);
    bindTime = check(bindTime, 10);
    elutionVolume = check(elutionVolume, 50);
}

function check(currentValue, defaultValue) {
    var newValue = currentValue;
    if(typeof currentValue === "undefined") {
        newValue = defaultValue;
        print("WARNING: value undefined - using default value (ca_runset)");
    }
    return newValue;
}