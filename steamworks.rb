
require 'rubygems'
require 'bundler/setup'
require 'require_all'
require 'gosu'

require_all __dir__

# Game namespace
module Steamworks

  # Base game class, the GameWindow, which inherits from Gosu
  # Starts the game and handles the main game loop by passing off events to the Register instance
  class GameWindow < ::Gosu::Window

    attr_accessor :register
    
    def initialize width=800, height=600, fullscreen=false
      super
      @register = Steamworks::Register.new self
      Thing.bootstrap self
    end

    def add item
      @register.add item
    end

    # TODO: implement in register
    def remove item
    end

    ## GAME LOOP METHODS
    #
    # These are all passed through to the register
    # to trigger for all in-game Things
    def button_down id
      close if id.eql? ::Gosu::KbEscape

      @register.button_down id
    end

    def update
      @register.update
    end

    def draw
      @register.draw
    end

  end

end

# Start the game!
game_window = Steamworks::GameWindow.new
game_window.show
