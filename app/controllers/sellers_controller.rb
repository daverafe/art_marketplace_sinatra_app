class SellersController < ApplicationController
    get '/signup' do 
        erb :'sellers/signup'
    end

    post '/signup' do 
        seller = Seller.new(params)
        if seller.email.blank? || seller.username.blank? || seller.password.blank? || Seller.find_by_email(params[:email]) || Seller.find_by_username(params[:username])
            redirect '/signup'
        else
            seller.save
            session[:seller_id] = seller.id 
            redirect '/art_posts'
        end
    end

    get '/login' do 
        erb :'sellers/login'
    end

    post '/login' do 
        seller = Seller.find_by_username(params[:username])
    end

    get '/logout' do
        session.clear 
        redirect '/'
    end
end