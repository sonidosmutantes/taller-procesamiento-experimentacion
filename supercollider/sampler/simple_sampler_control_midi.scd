/*
* Ejemplo simple de sampler disparado por MIDI
*/

s.boot;

~sample_path = ""; // Ejemplo: "/Users/.../Documents/samples/archivo.wav"
a = Buffer.read(s, ~sample_path);

//play synth (loop)
SynthDef(\playBufMonoLoop, {| out = 0, bufnum = 0, vol=1, rate = 1 |  var scaledRate, player;
scaledRate = rate * BufRateScale.kr(bufnum);  player = PlayBuf.ar(1, bufnum,scaledRate, loop:1, doneAction:2);  Out.ar(out, vol * player).dup }).add;

y = Synth(\mutantefreeze, [\bufnum, a, \out, 0, \vol, 1]);

y.set(\vol, 1);
y.set(\pan, 1);

//Control volume (x synth predefinido)
MIDIIn.control = {arg src, chan, num, val;

	       //[chan,num,val].postln; //Imprime valores

			if(num == 7,{
		       y.set(\vol, val.linlin(0,127,0,5) ); //volumen mapeado de 0..127 a 0..1
			});
}

MIDIIn.connectAll;

/*
//Mostrar MIDI input (controls)
MIDIIn.control = {arg src, chan, num, val;
	[chan,num,val].postln;
};

//Mostrar nota + velocity
MIDIFunc.noteOn({ |veloc, num, chan, src|
	( "New note received " + num + " with vel "+veloc ).postln;
});
*/