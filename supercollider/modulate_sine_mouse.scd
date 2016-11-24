// modulate a sine frequency and a noise amplitude with another sine
// whose frequency depends on the horizontal mouse pointer position
{
        var x = SinOsc.ar(MouseX.kr(1, 100));
        SinOsc.ar(300 * x + 800, 0, 0.1)
        +
        PinkNoise.ar(0.1 * x + 0.1)
}.play;

// ctrl + . para pararlo ( cmd + . en MacOS)


// cascade of 16 sine waves, each with a random pitch between A220 and A880…

{16.do({{SinOsc.ar(Rand(220,880), 0 ,0.05)}.play; 0.1.wait;})}.fork;


// ver más en: https://github.com/supercollider/supercollider/tree/master/examples/demonstrations
