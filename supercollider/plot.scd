s.boot;

{SinOsc.ar([400, 404])}.play

s.meter	//level meters (or press 'l' when server window in focus (inputs/outpus)


//Plot a non-band-limited sawtooth oscillator. Output ranges from -1 to +1.
{LFSaw.ar(200)}.plot			//10ms the default (0.01)
{LFSaw.ar(200)}.plot(0.2)		//200ms
{LFSaw.ar(200)}.plot(1)			//1sec
//careful when plotting more then 1sec.  might crash

{LFSaw.ar([200, 300, 400, 500])}.plot(0.1, minval: -2, maxval: 2)



