class SellersController < ApplicationController
    get '/signup' do 
        if !logged_in? 
            erb :'sellers/signup'
        else
            redirect '/art_posts'
        end
    end

    post '/signup' do 
        seller = Seller.new(params)
        seller.save 
        if seller.save 
            session[:seller_id] = seller.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        else
            flash[:error] = "Incorrect signup input. Please try again."
            redirect '/signup'
        end
    end

    get '/login' do
        if !logged_in? 
            erb :'sellers/login'
        else
            redirect '/art_posts'
        end
    end

    post '/login' do 
        seller = Seller.find_by_username(params[:username])
        if seller && seller.authenticate(params[:password])
            session[:seller_id] = seller.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        flash[:message] = "Logged out" 
        redirect '/'
    end
end