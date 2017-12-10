require_relative "lib/song"
require_relative "lib/pattern"

puts "Welcome to SM-808!\n" \
     "  This is a synthesizer that will play the Four on the Floor rhythm (HiHat, Snare Drum, Base Drum (Kick))\n" \
     "  given your input of tempo (defaults to 128 bpm) and number of repetitions.\n" \
     "\n" \
     "  The patterns used are 16 steps, and subdivided into 16th notes.\n"

print "Tempo, bpm (default 128): "
tempo = gets.chomp.to_i

print "Repetitions (default: 3): "
repeats = gets.chomp.to_i

opts = {
  bpm: tempo,
  repeats: repeats
}.delete_if { |_, v| v.nil? || v.zero? }

song = Song.new(opts)

# 16 Steps (Sub Divide pattern as 16th notes)
song.patterns << Pattern.new(pattern: "x...x...x...x...", display: "BD")
song.patterns << Pattern.new(pattern: "....x.......x...", display: "SD")
song.patterns << Pattern.new(pattern: "..x...x...x...x.", display: "HH")

song.play
