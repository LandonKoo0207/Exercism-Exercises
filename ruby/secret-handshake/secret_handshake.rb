class SecretHandshake
  def initialize(input)
    @input = input
  end

  def commands
    commands = []
    if @input.is_a? Integer
      @input = @input.to_s(2)
      @input.reverse.each_char.with_index do |digit, index|
        if index < 4 && digit == '1'
          commands << ['wink', 'double blink', 'close your eyes', 'jump'][index]
        else
          commands = commands.reverse
        end
      end
    end
    commands
  end
end