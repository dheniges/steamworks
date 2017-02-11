
module Steamworks 
  
  # Base class for any "thing" in the game.
  # A Thing is anything that responds to the core game loop
  # 
  # This acts a bit like an abstract class or interface
  class Thing

    ## INSTANCE METHODS

    # Standard initialize. Expose game window to everyone
    def initialize window
      @window = window
    end

    # Game loop update method
    def update
    end

    # Game loop button press method
    def button_down id
    end

    # Game loop draw method
    def draw
    end

    ## CLASS METHODS

    # Things can perform any startup activity.
    # Start is only invoked once, when the game starts.
    # Things may want to register instances of themselves 
    # in the game loop at this point.
    def self.start window
    end

    def self.bootstrap window
      # Grab all descendents of Thing
      # Painful, but only on initial application load
      # Probably better to just load the things directory and
      # track classes that way, but this is fun
      descendents = ObjectSpace.each_object(Class).select { |klass| klass < self }

      descendents.each{|thing_child| thing_child.start(window)}
    end
  end

end