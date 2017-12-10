# Pattern Class
# Takes a given string literal pattern denoted using periods (.) and x/X
#
# Args
#   `pattern` - string, required
#   `display` - string, default: "HIT"
#
# Returns:
#   Array of steps (each char in pattern is a steps), with any X replaced with
#   display value.
#
#   ==== Example
#   [".", ".", ".", "HIT"]
#
# ==== Examples
#   Pattern.new(pattern: "..x...x.", display: "HH")
#   Pattern.new(pattern: ".x.x.x.x", display: "HH")
class Pattern
  def initialize(pattern: nil, display: "HIT")
    raise ArgumentError.new("Pattern must be a string, as periods (.) or xX") if pattern.nil?

    @pattern = pattern
    @display = display
  end

  def pattern
    @pattern.split(//).map do |char|
      char.casecmp?("x") ? @display : nil
    end
  end
end
