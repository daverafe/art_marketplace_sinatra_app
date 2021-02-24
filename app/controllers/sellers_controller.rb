class SellersController < ApplicationController
    get '/signup' do 
        erb :'sellers/signup'
    end

    post '/signup' do 
        seller = Seller.new(params)
        seller.save 
        if seller.save 
            session[:seller_id] = seller.id 
            redirect '/art_posts'
        else
            redirect '/signup'
        end
    end

    get '/login' do 
        erb :'sellers/login'
    end

    post '/login' do 
        seller = Seller.find_by_username(params[:username])
        if seller && seller.authenticate(params[:password])
            session[:seller_id] = seller.id 
            redirect '/art_posts'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear 
        redirect '/'
    end
end