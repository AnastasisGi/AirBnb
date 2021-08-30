# frozen_string_literal: true

require 'rack'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
# require_relative 'models/user'

require_relative 'models/user'
require_relative 'models/space'

require_relative 'controllers/app_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/spaces_controller'
