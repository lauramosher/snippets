require_relative "../lib/song"
require_relative "../lib/pattern"
require "test/unit"

class TestSong < Test::Unit::TestCase
  def setup
    @song = Song.new()

    @song.patterns << Pattern.new(pattern: "...x", display: "_kick")
    @song.patterns << Pattern.new(pattern: ".x.x", display: "Snare")
    @song.patterns << Pattern.new(pattern: "..x.", display: "HiHat")
  end

  def test_song_patterns
    assert_equal(3, @song.patterns.length)
    assert_kind_of(Pattern, @song.patterns.first)
  end

  def test_song_tempo
    assert_equal(128, @song.tempo)
    assert_equal(60, Song.new(bpm: 60).tempo)
  end

  def test_song_repeats
    assert_equal(3, @song.repeats)
    assert_equal(10, Song.new(repeats: 10).repeats)
  end

  def test_format_beat
    assert_equal("—", @song.send(:format_beat, [nil]))
    assert_equal("HH", @song.send(:format_beat, ["HH"]))
    assert_equal("HH", @song.send(:format_beat, ["HH", nil]))
    assert_equal("SD+BD", @song.send(:format_beat, ["SD", "BD", nil]))
  end

  def test_song
    assert_equal(["—", "Snare", "HiHat", "_kick+Snare"], @song.send(:song))
  end
end
