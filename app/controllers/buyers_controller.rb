class BuyersController < ApplicationController
    get '/buyers/signup' do 
        if !buyer_logged_in? 
            erb :'buyers/signup'
        else
            redirect '/art_posts'
        end
    end

    post '/buyers/signup' do 
        buyer = Buyer.new(params)
        buyer.save 
        if buyer.save 
            session[:buyer_id] = buyer.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        else
            flash[:error] = "Incorrect signup input. Please try again."
            redirect '/signup'
        end
    end

    get '/buyers/login' do
        if !buyer_logged_in? 
            erb :'buyers/login'
        else
            redirect '/art_posts'
        end
    end

    post '/buyers/login' do 
        buyer = Buyer.find_by_username(params[:username])
        if buyer && buyer.authenticate(params[:password])
            session[:buyer_id] = buyer.id 
            flash[:message] = "Login Successful!"
            redirect '/art_posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/login'
        end
    end

    get '/buyers/logout' do
        session.clear
        flash[:message] = "Logged out" 
        redirect '/'
    end
end