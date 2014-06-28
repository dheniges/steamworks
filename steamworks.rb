
require 'rubygems'
require 'bundler/setup'
require 'require_all'
require 'gosu'

require_all __dir__


module Steamworks

  class GameWindow < ::Gosu::Window

    attr_accessor :register
    
    def initialize width=800, height=600, fullscreen=false
      super
      self.register = Steamworks::Register.new self
      #@ship = Ship.new self
    end

    def button_down id
      close if id.eql? ::Gosu::KbEscape

      #@ship.button_down id
    end

    def update
      #@ship.update
    end

    def draw
      #@ship.draw
    end

  end

end

Steamworks::GameWindow.new.show
