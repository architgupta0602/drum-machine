(
s.waitForBoot {
	// SynthDefs for drums
	SynthDef(\kick, { |amp = 1|
		Out.ar(0, SinOsc.ar(60, 0, EnvGen.kr(Env.perc(0.01, 0.2), doneAction: 2) * amp) ! 2);
	}).add;

	SynthDef(\snare, { |amp = 1|
		Out.ar(0, WhiteNoise.ar(EnvGen.kr(Env.perc(0.005, 0.2), doneAction: 2) * amp) ! 2);
	}).add;

	SynthDef(\hihat, { |amp = 1|
		Out.ar(0, HPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.001, 0.1), doneAction: 2) * amp), 8000) ! 2);
	}).add;

	// Patterns and controls
	~kickPattern = Array.fill(16, { 0 });
	~snarePattern = Array.fill(16, { 0 });
	~hihatPattern = Array.fill(16, { 0 });
	~tempo = 120;

	~playPattern = { |pattern, synthName, volume|
		Routine {
			loop {
				pattern.do { |step|
					if (step == 1) { Synth(synthName, [\amp, volume]) };
					(60 / ~tempo / 4).wait;
				};
			}
		};
	};

	// Create Routines for each drum
	~kickRoutine = ~playPattern.value(~kickPattern, \kick, 1);
	~snareRoutine = ~playPattern.value(~snarePattern, \snare, 0.2);
	~hihatRoutine = ~playPattern.value(~hihatPattern, \hihat, 0.1);

	// Window GUI
	~window = Window("", Rect(100, 100, 800, 600)).front;
	StaticText(~window, Rect(10, 10, 380, 20)).string_("Drum Machine Project 3");

	Slider(~window, Rect(10, 40, 180, 20))
	.action_({ |slider| ~tempo = slider.value.linlin(0, 1, 60, 180) });

	// Buttons for patterns
	3.do { |i|
		16.do { |j|
			Button(~window, Rect(15 + (j * 34), 160 + (i * 30), 20, 20)) // j -> x axis.. 35px distance. i -> y axis. 30px between instruments.
			.states_([["O", Color.grey], ["O", Color.red]])
			.action_({ |button|
				if (i == 0) { ~kickPattern[j] = button.value };
				if (i == 1) { ~snarePattern[j] = button.value };
				if (i == 2) { ~hihatPattern[j] = button.value };
			});
		};
	};

		// Draw lines between every 4 buttons
	~window.drawFunc_({
		Pen.color = Color.black;
		Pen.width = 4;
		3.do { |i|
			4.do { |j|
				Pen.line(
					Point(10 + (j * 4 * 34 ), 160 + (i * 30)),
					Point(10 + (j * 4 * 34), 160 + (i * 30) + 20)
				);
				Pen.stroke;
			};
		};
	});
	// Start/Stop button
	Button(~window, Rect(10, 250, 100, 30))
	.states_([["Start", Color.green], ["Stop", Color.red]])
	.action_({ |button|
		if (button.value == 0) {
			~kickRoutine.stop;
			~snareRoutine.stop;
			~hihatRoutine.stop;
		} {
			~kickRoutine.reset.play;
			~snareRoutine.reset.play;
			~hihatRoutine.reset.play;
		};
	});
};
)
