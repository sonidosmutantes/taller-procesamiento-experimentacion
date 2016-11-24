s.boot;

/*
Reads audio from the sound input hardware.
channel - input channel number to read.
          Channel numbers begin at 1.
*/


s.meter	//level meters (or press 'l' when server window in focus (inputs/outpus)


// (MONO) patching input to output
// Channel numbers begin at 1.
(
SynthDef("help-AudioInMono",{ arg out=0;
	Out.ar(out,
		AudioIn.ar(1)
	)
}).play;
)



// stereo through patching from input to output
(
SynthDef("help-AudioInStereo",{ arg out=0;
	Out.ar(out,
		AudioIn.ar([1,2])
	)
}).play;
)
