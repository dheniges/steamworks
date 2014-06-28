
module Steamworks

  class Bullet < Thing
    BULLET_SPEED = 20

    attr_accessor :x, :y

    def initialize window, ship
      super window

      @bullet = Gosu::Image.from_text @window, '.', Gosu.default_font_name, 32
      @ship = ship
    end

    def button_down id

    end

    def fire
      @x = @ship.x
      @y = @ship.y
    end

    def update
      @x += BULLET_SPEED
      @y += BULLET_SPEED
    end

    def draw
      @bullet.draw @x, @y, 0
    end

  end

end