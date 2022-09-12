M = {}

M.tidalboot_ghci = [[
:set -XOverloadedStrings
:set prompt ""

import Sound.Tidal.Context

import System.IO (hSetEncoding, stdout, utf8)
hSetEncoding stdout utf8

tidal <- startTidal (superdirtTarget {oLatency = 0.05, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cVerbose = True, cFrameTimespan = 1/20})

:{
let only = (hush >>)
    p = streamReplace tidal
    hush = streamHush tidal
    panic = do hush
               once $ sound "superpanic"
    list = streamList tidal
    mute = streamMute tidal
    unmute = streamUnmute tidal
    unmuteAll = streamUnmuteAll tidal
    unsoloAll = streamUnsoloAll tidal
    solo = streamSolo tidal
    unsolo = streamUnsolo tidal
    once = streamOnce tidal
    first = streamFirst tidal
    asap = once
    nudgeAll = streamNudgeAll tidal
    all = streamAll tidal
    resetCycles = streamResetCycles tidal
    setcps = asap . cps
    getcps = streamGetcps tidal
    getnow = streamGetnow tidal
    xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
    wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
    jump i = transition tidal True (Sound.Tidal.Transition.jump) i
    jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
    jumpMod' i t p = transition tidal True (Sound.Tidal.Transition.jumpMod' t p) i
    mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
    interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
    clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
    d1 = p 1 . (|< orbit 0)
    d2 = p 2 . (|< orbit 1)
    d3 = p 3 . (|< orbit 2)
    d4 = p 4 . (|< orbit 3)
    d5 = p 5 . (|< orbit 4)
    d6 = p 6 . (|< orbit 5)
    d7 = p 7 . (|< orbit 6)
    d8 = p 8 . (|< orbit 7)
    d9 = p 9 . (|< orbit 8)
    d10 = p 10 . (|< orbit 9)
    d11 = p 11 . (|< orbit 10)
    d12 = p 12 . (|< orbit 11)
    d13 = p 13
    d14 = p 14
    d15 = p 15
    d16 = p 16
:}

:{
let getState = streamGet tidal
    setI = streamSetI tidal
    setF = streamSetF tidal
    setS = streamSetS tidal
    setR = streamSetR tidal
    setB = streamSetB tidal
:}

:{
let drumMachine name ps = stack 
                    (map (\ x -> 
                        (# s (name ++| (extractS "s" (x)))) $ x
                        ) ps)
    drumFrom name drum = s (name ++| drum)
    drumM = drumMachine
    drumF = drumFrom
:}

let bpm x = setcps (x/60/4)

:set prompt "tidal> "
:set prompt-cont ""

default (Pattern String, Integer, Double)
]]

M.start_superdirt_scd = [[
(
s.reboot {
    s.options.device = "ASIO";
    s.options.sampleRate = 48000;
    s.options.numBuffers = 1024 * 256;
    s.options.memSize = 8192 * 32;
    s.options.numWireBufs = 80;
    s.options.maxNodes = 1024 * 32;
    s.options.numOutputBusChannels = 2;
    s.options.numInputBusChannels = 2;

    s.waitForBoot {
        ~dirt.stop;
        ~dirt = SuperDirt(2, s);
        ~dirt.loadSoundFiles;

        ~dirt.loadSoundFiles("F:\\Samples\\samples-extra\\*");
        ~dirt.loadSoundFiles("F:\\Samples\\tidalbeckstrom\\*");

        ~drumMachinesDir = PathName.new("F:\\Samples\\tidaldrummachines");
        ~machines = ~drumMachinesDir.folders;
        (
            ~machines.do({
                arg machine;
                var folders = machine.folders;
                folders.do({
                    arg folder;
                    ~dirt.loadSoundFiles(folder.fullPath,namingFunction: { |x| x.basename.replace("-","")});
                });
            });
        );

        s.sync;
        ~dirt.start(57120, 0 ! 12);

        (
            ~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
            ~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
            ~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
            ~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
        );
    };

    s.latency = 0.1;
    s.volume = -12;
};
)
]]

M.start_midi_scd = [[
(
var tidal_midi_in = %s;
var nvim_midi_in = %s;
var tidal_midi_out = %s;

var on, off, cc;
var osc_tidal, osc_nvim;

MIDIClient.init;
MIDIIn.connectAll;

if(tidal_midi_in) { osc_tidal = NetAddr.new("127.0.0.1", 6010) };
if(nvim_midi_in) { osc_nvim = NetAddr.new("127.0.0.1", 9000) };

if(tidal_midi_in && nvim_midi_in) {
    on = MIDIFunc.noteOn({|val, num, chan, src|
        if(chan == 0) {
            osc_nvim.sendMsg("/note", num.asString, val);
        } {
            osc_tidal.sendMsg("/ctrl", num.asString, val/127);
        };
    });

    off = MIDIFunc.noteOff({|val, num, chan, src|
        if(chan != 0) {
            osc_tidal.sendMsg("/ctrl", num.asString, 0);
        };
    });

    cc = MIDIFunc.cc({|val, num, chan, src|
        osc_tidal.sendMsg("/ctrl", num.asString, val/127);
    });
};

if(tidal_midi_in && nvim_midi_in.not) {
    on = MIDIFunc.noteOn({|val, num, chan, src|
        osc_tidal.sendMsg("/ctrl", num.asString, val/127);
    });

    off = MIDIFunc.noteOff({|val, num, chan, src|
        osc_tidal.sendMsg("/ctrl", num.asString, 0);
    });

    cc = MIDIFunc.cc({|val, num, chan, src|
        osc_tidal.sendMsg("/ctrl", num.asString, val/127);
    });
};

if(nvim_midi_in && tidal_midi_in.not) {
    on = MIDIFunc.noteOn({|val, num, chan, src|
        if(chan == 0) {
            osc_nvim.sendMsg("/note", num.asString, val);
        };
    });
};

if(tidal_midi_in || nvim_midi_in) {
    if(~stopMidiToOsc != nil) { ~stopMidiToOsc.value; };
    ~stopMidiToOsc = {
        on.free;
        off.free;
        cc.free;
    };
};

if(tidal_midi_out) {
    ~midiOut1 = MIDIOut.newByName("02. Internal MIDI", "02. Internal MIDI");
    ~dirt.soundLibrary.addMIDI(\midi1, ~midiOut1);

    ~midiOut2 = MIDIOut.newByName("UltraLite mk3 Hybrid", "UltraLite mk3 Hybrid");
    ~dirt.soundLibrary.addMIDI(\midi2, ~midiOut2);

    //~midiOut3 = MIDIOut.newByName("MIDIOUT2 (LPProMK3 MIDI)", "MIDIOUT2 (LPProMK3 MIDI)");
    //~dirt.soundLibrary.addMIDI(\midi3, ~midiOut3);
};
)
]]

return M
