/*
* Ejemplo simple de sampler disparado por MIDI u OSC
*/

s.boot;

// In windows escape with \\
~sample_path = ""; // Ejemplo: "/Users/.../Documents/samples/archivo.wav"
a = Buffer.read(s, ~sample_path);

//freeze effect
SynthDef(\mutantefreeze, { arg out=0, bufnum=0, point=0, vol=1, fftwidth=4096, pan=0, startPos=0;
    var in, chain, sig;
    in = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum),loop: 1);
	chain = FFT(LocalBuf(4096), in);
    chain = PV_MagFreeze(chain, point);

	//with PAN
	sig = Splay.ar(vol * IFFT(chain).dup);
	sig = Balance2.ar(sig[0], sig[1], pan);
	Out.ar(out, sig);
}).add;

z = Synth(\mutantefreeze, [\bufnum, a, \out, 0, \vol, 1]);

//z.set(\vol, 0); //modifica el volumen
z.set(\point, 1); //freeze on
z.set(\point, 0); //freeze off

z.set(\pan, 1); //modificar el PAN (0 o 1, izquierda o derecha)


MIDIIn.control = {arg src, chan, num, val;

	       //[chan,num,val].postln;

			if(num == 7,{
		       z.set(\vol, val.linlin(0,127,0,5) ); //volumen 0..1
			});
}


MIDIFunc.noteOn({ |veloc, num, chan, src|
    if(num == 48,{
			("Pad 48").postln;
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


MIDIIn.connectAll;
