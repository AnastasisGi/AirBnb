# frozen_string_literal: true
ENV['RACK_ENV']='test'
require 'capybara/rspec'
require './app/app'
require_relative './support/database_cleaner'
require 'factory_bot.rb'
require_relative './factory/user_factory.rb'
require 'support/factory_bot'
Capybara.app = AirBnb
