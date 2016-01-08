var formColumns = 12;

var settings = {
		sampleVolume: 50,
		beadVolume: 20,
		precipVolume: 100,
		beadResuspVolume: 10,
		bindTime: 60,
		elutionVolume: 30,
		sealFinalPlate: true
};

function dph(vol, endHeight) {
	var v = parseFloat(vol);
	var e = parseFloat(endHeight);
	if(v > 0 && e > 0 && !isNaN(v+e)) {
		return 0.078 - 9.184E-5*v + (0.777-e)/v;
	} else {
		throw "ValueException";
	}
}