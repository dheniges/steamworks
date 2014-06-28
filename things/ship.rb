
module Steamworks

  class Ship < Thing

    MOVE_SPEED = 5

    attr_accessor :x, :y

    def initialize window
      super

      @ship = ::Gosu::Image.from_text @window, 'X', ::Gosu.default_font_name, 24

      @bullet = Bullet.new @window, self

      self.x = @window.width/2 - @ship.width/2
      self.y = @window.height/2 - @ship.height/2
    end

    def button_down id
      if id.eql? ::Gosu::KbSpace
        @fire = true
        @bullet.fire
      end
    end

    def update
      self.x += MOVE_SPEED if @window.button_down? ::Gosu::KbRight
      self.x -= MOVE_SPEED if @window.button_down? ::Gosu::KbLeft
      self.y += MOVE_SPEED if @window.button_down? ::Gosu::KbDown
      self.y -= MOVE_SPEED if @window.button_down? ::Gosu::KbUp

      @bullet.update if @fire
    end

    def draw
      @ship.draw self.x, self.y, 0

      if @fire
        @bullet.draw
      end
    end

  end

end