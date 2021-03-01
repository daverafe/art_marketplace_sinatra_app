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
        if logged_in? 
            erb :'art_posts/new'
        else
            flash[:error] = "Sorry you have to be logged in to do that"
            redirect '/'
        end
    end

    post '/art_posts' do
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
        redirect_if_not_authorized
        erb :'art_posts/edit'
    end

    patch '/art_posts/:id' do 
        get_art_post
        redirect_if_not_authorized
        @art_post.update(title: params[:title], description: params[:description], price: params[:price].to_i)
        redirect "/art_posts/#{@art_post.id}"
    end

    delete '/art_posts/:id' do
        get_art_post
        redirect_if_not_authorized
        @art_post.destroy
        redirect "/art_posts"
    end

private

    def get_art_post
        @art_post = ArtPost.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @art_post.seller != current_user
            flash[:error] = "You do not have permission to make changes"
            redirect '/art_posts'
        end
    end
end