class ArtPostsController < ApplicationController
    get '/art_posts' do
        @art_posts = ArtPost.all 
        if logged_in? 
            erb :'art_posts/index'
        else
            flash[:error] = "Sorry you have to be logged in to do that"
            redirect '/'
        end
    end

    get '/art_posts/new' do
        if !logged_in?
            flash[:error] = "Sorry you have to be logged in to do that"
            redirect '/'
        elsif current_buyer
            redirect_if_not_authorized_buyer
        else
            erb :'art_posts/new'
        end
    end

    post '/art_posts' do
        redirect_if_not_authorized_buyer
        @art_post = ArtPost.new(params)
        @art_post.seller_id = session[:seller_id]
        @art_post.save 
        redirect "/art_posts/#{@art_post.id}"
    end

    get '/art_posts/:id' do 
        get_art_post
        erb :'art_posts/show'
    end

    get '/art_posts/:id/edit' do 
        get_art_post
        redirect_if_not_authorized_seller
        erb :'art_posts/edit'
    end

    patch '/art_posts/:id' do 
        get_art_post
        redirect_if_not_authorized_seller
        @art_post.update(title: params[:title], img_url: params[:img_url], description: params[:description], price: params[:price].to_i)
        redirect "/art_posts/#{@art_post.id}"
    end

    delete '/art_posts/:id' do
        get_art_post
        redirect_if_not_authorized_seller 
        @art_post.destroy
        redirect "/art_posts"
    end

private

    def get_art_post
        @art_post = ArtPost.find_by_id(params[:id])
    end

    def redirect_if_not_authorized_seller
        if @art_post.seller != current_seller 
            flash[:error] = "You do not have permission to make changes"
            redirect '/art_posts'
        end
    end

    def redirect_if_not_authorized_buyer
        if current_buyer  
            flash[:error] = "You do not have permission to make changes"
            redirect '/art_posts'
        end
    end
end