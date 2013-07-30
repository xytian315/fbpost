class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
   if current_user
    @id = current_user.id
    @posts = Post.where(user_id: @id) 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end

  def create
    @post = current_user.posts.create!(params[:post])
    respond_to do |format|
      if @post.save
        format.html {redirect_to root_url, notice: "Congratulations! Your content was successfully posting on facebook!" }
        current_user.facebook.put_wall_post(@post.content)

      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
