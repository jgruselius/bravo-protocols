var formColumns = 12;
var extended = true;
var runsetMode = false;
var testMode = true;

var settings = {
		sampleVolume: 50,
		beadVolume: 20,
		precipVolume: 100,
		beadResuspVolume: 10,
		bindTime: 600,
		elutionVolume: 30,
		transferSample: true,
		sealFinalPlate: true
};

var dph = function(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}
