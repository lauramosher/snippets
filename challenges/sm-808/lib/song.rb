# Song Class
# Builds a song based on input patterns.
# Assumes 4/4 Signature
#
# Args
#   `bpm`         - integer, default: 128
#                   The tempo or beats per minute the song plays
#   `repeats`     - integer, default: 3
#                   How many times the pattern should repeat
#
# ==== Examples
#   Song.new()
#   Song.new(bpm: 60)
#   Song.new(bpm: 128, repeats: 4)
#   Song.new(repeats: 10)
class Song
  def initialize(bpm: 128, repeats: 3)
    @patterns = []
    @tempo = bpm
    @repeats = repeats
  end

  attr_reader :patterns, :tempo, :repeats

  def play
    repeats.times do
      song.each do |beat|
        print beat
        print "\t"

        # NOTE: On the Math
        # 8th note subdivision: ((60/BPM)*4)/8 -> ((60/BPM)*1/2) -> (60/(2*BPM)) -> 30/BPM
        # 16th note subdivision: ((60/BPM)*4)/16 -> ((60/BPM)*1/4) -> (60/(4*BPM)) -> 15/BPM
        sleep 15.0 / tempo
      end
      print "\n"
    end
  end

  private

  def build_song(beat, beats, song = [])
    song << format_beat(beat)

    return song if beats.first.empty?

    build_song(beats.map(&:shift), beats, song)
  end

  def format_beat(beat)
    if beat.compact.empty?
      "—"
    else
      beat.reject(&:nil?).join("+")
    end
  end

  def song
    beats = patterns.map(&:pattern)
    @_song ||= build_song(beats.map(&:shift), beats)
  end
end
