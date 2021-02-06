require_relative 'config/environment'

run ApplicationController
use HomeController
use PostController
use AuthController
use CategoryController