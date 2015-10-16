require "font-awesome-rails"
require "foundation-rails"
require "sass"
require "sass-rails"
require "jquery-rails"
require 'codemirror-rails'

module RailsDb
  mattr_accessor :authorization
  @@authorization = proc { true }

  # Custom require relative that work with older rubies also
  def self.require_relative(path)
    full_path = File.expand_path(path, File.dirname(__FILE__))
    Kernel.require(full_path)
  end

  # Allows the user to specify a current authorization method
  def self.require_authorization(&block)
    @@authorization = block
  end
end

require "rails_db/engine"

RailsDb.require_relative("rails/routes")