require './config/environment'

use Rack::MethodOverride 
use ArtPostsController
use SellersController
run ApplicationController
