module InputOutput

  def clear_the_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end

  def get_input message
    print message
    gets.chomp
  end

end
