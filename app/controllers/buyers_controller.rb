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

    get '/buyers/cart' do 
        @buyers_art_posts = current_buyer.art_posts
        erb :'buyers/save'
    end

    post '/buyers/cart' do 
        art_post = ArtPost.find_by_id(params[:id])
        art_post.buyer_id = session[:buyer_id]
        art_post.save
        flash[:message] = "Added to cart!"
        redirect '/art_posts' 
    end

    get '/buyers/logout' do
        session.clear
        flash[:message] = "Logged out" 
        redirect '/'
    end
end