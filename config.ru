require './config/environment'

use Rack::MethodOverride 
use ArtPostsController
use SellersController
use BuyersController
run ApplicationController
