
module Steamworks

  # The ship class. Ship is represented by an "X"
  # Ship can fire bullets
  class Ship < Thing

    ## CONSTANTS

    MOVE_SPEED = 5

    ## ACCESSORS

    attr_accessor :x, :y

    ## INSTANCE METHODS

    def initialize window
      super

      @ship = ::Gosu::Image.from_text @window, 'X', ::Gosu.default_font_name, 24

      # Start ship in the center of the screen
      self.x = @window.width/2 - @ship.width/2
      self.y = @window.height/2 - @ship.height/2
    end

    def button_down id
      if id.eql? ::Gosu::KbSpace
        bullet = Bullet.new @window, self
        @window.add bullet
      end
    end

    def update
      self.x += MOVE_SPEED if @window.button_down? ::Gosu::KbRight
      self.x -= MOVE_SPEED if @window.button_down? ::Gosu::KbLeft
      self.y += MOVE_SPEED if @window.button_down? ::Gosu::KbDown
      self.y -= MOVE_SPEED if @window.button_down? ::Gosu::KbUp
    end

    def draw
      @ship.draw self.x, self.y, 0
    end

    ## CLASS METHODS

    def self.start window
      ship = self.new window
      window.add ship
    end

  end

end