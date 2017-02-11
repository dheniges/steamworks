
module Steamworks

  # The Register tracks all Things in the game.
  # Everything that needs to respond to the game loop
  # should be registered. Things can de-register themselves
  # when they are no longer present.
  class Register

    attr_accessor :items, :game_window
    
    # Takes a Gosu::Window object
    def initialize window
      self.game_window = window
      @items = []
    end

    # Add an item to the game loop
    def add(item)
      self.items << item
    end

    def button_down id
      self.items.each{|i| i.button_down id}
    end

    def update
      self.items.each(&:update)
    end

    def draw
      self.items.each(&:draw)
    end

  end

end