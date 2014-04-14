class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		Post.create(post_params)
		redirect_to posts_path
	end

	def show
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes!(post_params)
		flash[:notice] = "The image #{@post.title} was successfully updated"
		redirect_to posts_path
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "The image '#{@post.title}' was deleted."
		redirect_to posts_path
	end

	private 

	def post_params
		params.require(:post).permit(:title, :description, :image)
	end

end
