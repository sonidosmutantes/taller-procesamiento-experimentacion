/*
* Ejemplo simple de sampler disparado por MIDI u OSC
*/

s.boot;

// In windows escape with \\
~sample_path = ""; // Ejemplo: "/Users/.../Documents/samples/archivo.wav"
a = Buffer.read(s, ~sample_path);
//a.free;

//play synth (trigger)
SynthDef(\playBufMono, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, doneAction:2);  Out.ar(out, vol * player).dup }).add;

//play synth (loop)
SynthDef(\playBufMonoLoop, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, loop:1, doneAction:2);  Out.ar(out, vol * player).dup }).add;

x = Synth(\playBufMono, [\bufnum, a]);

y = Synth(\playBufMonoLoop, [\bufnum, a]);
y.free;

//Control volume (x synth predefinido)
MIDIIn.control = {arg src, chan, num, val;

	       //[chan,num,val].postln;

			if(num == 7,{
		       z.set(\vol, val.linlin(0,127,0,5) ); //volumen 0..1
			});
}


MIDIFunc.noteOn({ |veloc, num, chan, src|
    if(num == 48,{
			("Pad 44").postln;
	        z.get(\point, { arg value;
				if( value >0,{ //on (0 off,  >0 on)
			 		z.set(\point, 0);
					("Bank1 / A / freeze OFF").postln;
	    		}, {
					 z.set(\point, 1);
					("Bank1 / A / freeze ON").postln;
			    });
			});
	});
});
∫
MIDIIn.connectAll;

z = Synth(\mutantefreeze, [\bufnum, a, \out, 0, \vol, 1]);

z.set(\vol, 0);

z.set(\point, 1);
z.set(\point, 0);

z.set(\pan, 1);

//x.free;