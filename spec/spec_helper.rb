# frozen_string_literal: true
ENV['RACK_ENV']='test'
require 'capybara/rspec'
require './app/app'
require_relative './support/database_cleaner'
require 'support/factory_bot'
require_relative './factory/user_factory.rb'
require_relative './support/login_in.rb'
require 'betterlorem'

Capybara.app = AirBnb
