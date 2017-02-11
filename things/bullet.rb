
module Steamworks

  # Bullet class
  # Bullet represented by a period "."
  # 
  # Currently only fires in one direction
  class Bullet < Thing

    ## CONSTANTS 
    
    BULLET_SPEED = 20

    ## ACCESSORS

    attr_accessor :x, :y

    ## INSTANCE METHODS

    # Requires a window and an object that fired the bullet.
    # fired_from_obj must implement an x/y positioning!
    def initialize window, fired_from_obj
      super window

      # Ensure fired_from_obj defines x/y
      if [:x, :y].find{|i| !fired_from_obj.class.method_defined?(i)}
        raise "#{fired_from_obj.class} does not implement x/y!!!"
      end

      @bullet = Gosu::Image.from_text @window, '.', Gosu.default_font_name, 32
      @x = fired_from_obj.x
      @y = fired_from_obj.y
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