// osc tone synth ADSR, gate, detune

//s.boot;
NetAddr.langPort; //OSC


/*
So I'm gonna quickly contstruct a SynthDef. An adsr envelope will control the amplitude of the sound, and the gate will be closed by default. The source of the sound will come from Blip.ar, which generates harmonic partials. I'll set a fundamental frequency, and to create a detuning feature, I'll multiply the frequency by a slow moving LFNoise1, ranging between negative and positive detune values. I'm envisioning detune as a number of semitones, so I'll use midiratio to make the output values suitable for frequency scaling. I also want to add a second argument to Blip for the number of harmonic partials to generate. I'm going to multichannel expand the noise generator, which means the enclosing Blip UGen is expanded to an array of 16 Blip generators each with a uniquely meandering frequency.

URL original (configurado para TouchOSC, app paga): "https://github.com/zeffii/Supercollider3_tutorials_code/blob/master/full video scripts/11_script.scd"

Más abajo se configura para CONTROL app (Mixer/Landscape UI) free y software libre
*/

SynthDef.new(\tone, {
	arg freq=40, nharm=12, detune=0.2, gate=0, pan=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env.adsr(0.05,0.1,0.5,3), gate);
	sig = Blip.ar(
		freq * LFNoise1.kr(0.2!16).bipolar(detune).midiratio,
		nharm
	);
    sig = sig * LFNoise1.kr(0.5!16).exprange(0.1,1);
	sig = Splay.ar(sig);
	sig = Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;

t= Synth.new(\tone, [\gate, 1])

//default values
t.set(\freq, 50)
t.set(\pan, 0.0)
t.set(\nharm, 12)
t.set(\detune, 0.25)
t.set(\amp, 1)
//t.set(\gate, 0)
t.set(\gate, 1)

//Configurado para mensajes OSC de CONTROL app (Mixer/Landscape UI)
~maxvolume = 3;
(
OSCdef.new(
	\toggle1,
	{
		arg msg;
		t.set(\gate, msg[1]);
	},
	'/vol5',
);
OSCdef.new(
	\fader1,
	{
		arg msg;
		t.set(\freq, msg[1].linexp(0,1,20,400));
	},
	'/vol4',
);
OSCdef.new(
	\fader2,
	{
		arg msg;
		t.set(\nharm, msg[1].linlin(0,1,1,50));
	},
	'/vol3',
);
OSCdef.new(
	\fader3,
	{
		arg msg;
		t.set(\amp, msg[1].linexp(0,1,0.005,~maxvolume));
	},
	'/vol1',
);
OSCdef.new(
	\rotary1,
	{
		arg msg;
		t.set(\pan, msg[1].linlin(0,1,-1,1));
	},
	'/pan1',
);
OSCdef.new(
	\rotary2,
	{
		arg msg;
		t.set(\detune, msg[1].linexp(0,1,0.01,12));
	},
	'/vol2',
);
)