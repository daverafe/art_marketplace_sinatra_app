require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash 
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    
    def current_seller 
     @current_seller ||= Seller.find_by_id(session[:seller_id])
    end
    
    def current_buyer 
      @current_buyer ||= Buyer.find_by_id(session[:buyer_id])
    end

    def logged_in?
      !!session[:seller_id]
    end

  end

end
