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

  get '/signup' do
    if !seller_logged_in? || !buyer_logged_in?
      erb :signup 
    else
      redirect '/art_posts'
    end
  end

  helpers do 
    
    def current_seller 
     @current_seller ||= Seller.find_by_id(session[:seller_id])
    end
    
    def current_buyer 
      @current_buyer ||= Buyer.find_by_id(session[:buyer_id])
    end

    def seller_logged_in?
      !!session[:seller_id]
    end

    def buyer_logged_in?
      !!session[:buyer_id]
    end

  end

end
