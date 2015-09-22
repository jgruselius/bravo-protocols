/*
 truseq_startup.js
 Author: Joel Gruselius
 Version: v1501
 Description: Helper functions for TruSeq runset
*/

// Get columns of samples value from form:
var n_columns = parseInt(formColumns, 10);

var time_mod = 1; // Incubation time multiplier for testing
var temp_rt = 20;
var col_er_mix = 1;
var col_at_mix = 2;
var col_lig_mix = 3;

setColumns(n_columns);
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
        ca.beadVolume = 20;
        ca.precipVolume = 200;
        ca.beadResuspVolume = 20;
        ca.bindTime = 10;
        ca.elutionVolume = 15;
    } else if(type === "ligation") {
        ca.sampleVolume = 42.5;
        ca.beadVolume = 20;
        ca.precipVolume = 100;
        ca.beadResuspVolume = 17.5;
        ca.bindTime = 10;
        ca.elutionVolume = 30;
    } else {
        return_state = false;
    }
    return return_state;
}

function setColumns(num) {
    ca.columnsOfSamples = num;
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

print("truseq_startup.js loaded");