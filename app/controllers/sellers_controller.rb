class SellersController < ApplicationController
    get '/sellers/signup' do 
        if !seller_logged_in? 
            erb :'sellers/signup'
        else
            redirect '/art_posts'
        end
    end

    post '/sellers/signup' do 
        seller = Seller.new(params)
        seller.save 
        if seller.save 
            session[:seller_id] = seller.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        elsif Seller.find_by_email(params[:email])
            flash[:message] = "Account already exists! Please Login"
            redirect '/sellers/login'
        else
            flash[:error] = "Incorrect signup input. Please try again."
            redirect '/sellers/signup'
        end
    end

    get '/sellers/login' do
        if !seller_logged_in? 
            erb :'sellers/login'
        else
            redirect '/art_posts'
        end
    end

    post '/sellers/login' do 
        seller = Seller.find_by_username(params[:username])
        if seller && seller.authenticate(params[:password])
            session[:seller_id] = seller.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/sellers/login'
        end
    end

    get '/sellers/logout' do
        session.clear
        flash[:message] = "Logged out" 
        redirect '/'
    end
end