
module Steamworks

  class Register

    attr_accessor :items, :game_window
    
    def initialize window
      self.game_window = window

      klasses = Thing.bootstrap_classes
    end

    def register(item)
      self.items << item
    end

    def button_down id
      items.each{|i| i.button_down id}
    end

    def update
      items.each{|i| i.update}
    end

    def draw
      items.each{|i| i.draw}
    end

  end

end