
module Steamworks 
  
  # Base class for stuff
  class Thing

    def initialize window
      @window = window
      auto_register = true
    end

    def update
    end

    def button_down id
    end

    def draw
    end

    def self.bootstrap
      # Painful, but only on initial application load
      descendents = ObjectSpace.each_object(Class).select { |klass| klass < self }

      descendents.each do |klass|
        klass.register
      end
    end
  end

end