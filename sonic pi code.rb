in_thread do
  loop do
    sample :ambi_glass_hum
    sleep 0.6
  end
end

in_thread do
  loop do
    sample :perc_snap2
    play 20
    sleep 1.5
  end
end

in_thread do
  loop do
    sample :bd_klub
    play 45
    sleep 0.4
  end
end

in_thread do
  loop do
    sample :bd_zome
    sleep 0.9
  end
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :drum_bass_soft, amp: 4, rate: 1
  end
  sleep 4
end

in_thread do
  loop do
    sample :guit_e_slide
    sleep 1
  end
end

live_loop :travelling do
  use_synth :pluck
  play 40
  sleep 0.3
  notes = scale(:e4, :minor_pentatonic, num_octaves: 1)
  use_random_seed 280
  tick_reset_all
  with_fx :echo, phase: 0.125, mix: 0.3, reps: 20 do
    sleep 0.2
    play notes.choose, attack: 0, release: 0.1, pan: (range -1, 1, step: 0.125).tick, amp: rrand(2, 2.5)
  end
end

live_loop :comet, auto_cue: false do
  if one_in 5
    sample :loop_safari
  end
  sleep 5
end
