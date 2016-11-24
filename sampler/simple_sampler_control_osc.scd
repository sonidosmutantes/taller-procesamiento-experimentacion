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

y.set(\vol, 1); //modifica volumen
y.set(\pan, 1);  //modifica balance/pan

//control volumen
~maxvol = 7
OSCdef.new(
	\vol1A,
	{
		arg msg;
		y.set(\vol, msg[1].linlin(0,1,0,~maxvol));
	},
	'/vol7',
);

//control panning/balance
OSCdef.new(
	\pan1A,
	{
		arg msg;
		y.set(\pan, msg[1].linlin(0,1,-1,1));
	},
	'/pan6', //bug en Control App (en lugar de /pan7 manda pan6)
);


NetAddr.langPort; //osc port 57120 ó 57121
//ver todos los mensajes
OSCFunc.trace
OSCFunc.trace(false); // Turn posting off