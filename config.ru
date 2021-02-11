# frozen_string_literal: true

require './config/environment'

run ApplicationController
use HomeController
use PostController
use CategoryController
use AuthController
