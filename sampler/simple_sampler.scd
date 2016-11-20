/*
* Ejemplo simple de sampler disparado por MIDI u OSC
*/

s.boot;

// In windows escape with \\
~sample_a_path = "";
a = Buffer.read(s, ~sample_a_path);
//a.free;

//play synth (trigger)
SynthDef(\playBufMono, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, doneAction:2);  Out.ar(out, vol * player).dup }).add;

//play synth (loop)
SynthDef(\playBufMono, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, loop:1, doneAction:2);  Out.ar(out, vol * player).dup }).add;
x = Synth(\playBufMono, [\bufnum, a]);

//Trigger sound with events
MIDIFunc.noteOn({ |veloc, num, chan, src|
    if(num == 30,{
        	    ("Pad 30").postln;
		        Synth(\playBufMono, [\bufnum, a, \vol, veloc/127]);
	});
});

//Control volume (x synth predefinido)
MIDIIn.control = {arg src, chan, num, val;
			if(num == 7,{
		       x.set(\vol, val.linlin(0,127,0,1) ); //volumen 0..1
			});
}
