MIDIIn.connectAll;

// Monitor
//Mostrar nota + velocity
MIDIFunc.noteOn({ |veloc, num, chan, src|
	( "New note received " + num + " with vel "+veloc ).postln;
});
//Mostrar MIDI input (controls)
MIDIIn.control = {arg src, chan, num, val;
	[chan,num,val].postln;
}

//Mapeo de valores
//w = val.linlin(0,127,0,1)})
//w = val.linlin(0,127,200,300)})
// Mapeo logarítmico
//w = val.linexp(0,127,0,1)})

//Note ON/OFF
//Trigger sound with pads
MIDIFunc.noteOn({ |veloc, num, chan, src|

    if(num == 48,{
	        	("Bank1 / A / Pad 48").postln;
		        x.free;
		        x = Synth(\mutantefreeze, [\bufnum, ~bank1a, \out, ~channel, \fftwidth, ~fftwidth]);*/

/*
	            x.get(\point, { arg value;
				if( value >0,{ //on (0 off,  >0 on)
			 		x.set(\point, 0);
					("Bank1 / A / freeze OFF").postln;
	    		}, {
					 x.set(\point, 1);
					("Bank1 / A / freeze ON").postln;
			    });
*/
	});
};

//Control MSG
~maxvol = 3;
MIDIIn.control = {arg src, chan, num, val;
	//[chan,num,val].postln; //monitor

//First row of knobs
            if(num == 7,{ //VOL W
		        x.set(\vol, val.linlin(0,127,0,~maxvol+4)); //volumen 0..1

			});
			if(num == 10,{ //VOL X
			    y.set(\vol, val.linlin(0,127,0,~maxvol)); // point 0..1
			});
			if(num == 8,{//VOL Y
		        z.set(\vol, val.linlin(0,127,0,~maxvol)); //volumen 0..1
			});
			if(num == 1,{//VOL Z
			   q.set(\vol, val.linlin(0,127,0,1)); // point 0..1
			});


//Second row of knobs
			if(num == 12,{ //VOL W
		        g.set(\vol, val.linlin(0,127,0,~maxvol)); //volumen 0..1
			});
			if(num == 13,{ //VOL X
			   h.set(\vol, val.linlin(0,127,0,~maxvol)); // point 0..1
			});
			if(num == 11,{//VOL Y
		       i.set(\vol, val.linlin(0,127,0,~maxvol)); //volumen 0..1
			});
			if(num == 33,{//VOL Z
			   j.set(\vol, val.linlin(0,127,0,~maxvol)); // point 0..1
			});
};
