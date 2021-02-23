class ArtPostsController < ApplicationController
    get '/art_posts' do
        @art_posts = ArtPost.all 
        erb :'art_posts/index'
    end

    get '/art_posts/new' do 
        erb :'art_posts/new'
    end

    post '/art_posts' do 
        @art_post = ArtPost.create(params)
        redirect "/art_posts/#{@art_post.id}"
    end

    get '/art_posts/:id' do 
        @art_post = ArtPost.find(params[:id])
        erb :'art_posts/show'
    end
end