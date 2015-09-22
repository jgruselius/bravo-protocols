/*
 truseq_rna.js
 Author: Joel Gruselius
 Version: 2015-09
 Description: Helper functions for TruSeq runset
*/

/*
 Settings for purification must be accessible form the purification protocol
 and updated from other protocols. This script must be run so that the variables
 are defined in the global namespace:
*/

function CA() {
	this.columns;
	this.sampleVolume;
	this.beadVolume;
	this.precipVolume;
	this.beadResuspVolume;
	this.bindTime;
	this.elutionVolume;
	var presets = {
		"default": {
			sampleVolume: 50,
			beadVolume: 20,
			precipVolume: 100,
			beadResuspVolume: 10,
			bindTime: 600,
			elutionVolume: 30
		},
		"cdna_synthesis": {
			sampleVolume: 50,
			beadVolume: 20,
			precipVolume: 100,
			beadResuspVolume: 10,
			bindTime: 600,
			elutionVolume: 17.5
		},
		"ligation": {
			sampleVolume: 42.5,
			beadVolume: 20,
			precipVolume: 100,
			beadResuspVolume: 17.5,
			bindTime: 600,
			elutionVolume: 30
		},
		"pcr": {
			sampleVolume: 50,
			beadVolume: 50,
			precipVolume: 100,
			beadResuspVolume: 10,
			bindTime: 600,
			elutionVolume: 30
		}
	};

};

/*
 Adds/sets the variables in the ca object. Returns true if the specified
 string 'type' is recognized, otherwise returns false:
*/
CA.prototype.useSetting = function(name) {
	for(setting in this.presets[name]) {
		this[setting] = this.presets[setting];
	}
	return (name in this.presets);
};

CA.prototype.setColumns = function(n) {
	this.columns = n;
};

var ca = CA();

function dph(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}