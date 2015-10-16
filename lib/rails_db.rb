require "font-awesome-rails"
require "foundation-rails"
require "sass"
require "sass-rails"
require "jquery-rails"
require 'codemirror-rails'

module RailsDb
  # Custom require relative that work with older rubies also
  def self.require_relative(path)
    full_path = File.expand_path(path, File.dirname(__FILE__))
    Kernel.require(full_path)
  end
end

require "rails_db/engine"

RailsDb.require_relative("rails/routes")