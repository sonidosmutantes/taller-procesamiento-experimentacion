s.boot; //start server

// In windows escape with \\
~sample_a_path = "";
~sample_b_path = "";
a = Buffer.read(s, ~sample_a_path);
b = Buffer.read(s, ~sample_b_path);
//a.free;

//play synth
SynthDef(\playBufMono, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, doneAction:2);  Out.ar(out, vol * player).dup }).add;

//Trigger sound with events
MIDIFunc.noteOn({ |veloc, num, chan, src|
    if(num == 30,{
        	    ("Pad 30").postln;
		        Synth(\playBufMono, [\bufnum, a, \vol, veloc/127]);
	});
    if(num == 46,{
        	    ("Pad 46").postln;
		        Synth(\playBufMono, [\bufnum, b, \vol, veloc/127]);
	});

});

//Control volume (x synth predefinido)
MIDIIn.control = {arg src, chan, num, val;
			if(num == 7,{
		       x.set(\vol, val/127); //volumen 0..1
	  	       //(val/127).postln;
			});
}

// s.quit; //stops server

//playing
r = Synth(\playBufMono, [\bufnum, c.bufnum, \rate, 1]); //buffer c
r = Synth(\mutantefreeze, [\bufnum, c.bufnum, \rate, 1]); //
r.free;
