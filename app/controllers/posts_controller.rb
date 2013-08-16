# coding: utf-8

class PostsController < ApplicationController
	def index
		@posts = Post.all(:order => "created_at DESC")
	end

	def show
		@post = Post.find(params[:id]);
	end

	def new
		@post = Post.new;
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path, notice:  '作成されました!'
		else
			render action: 'new'
		end
	end

	def edit
		@post = Post.find(params[:id]);
	end

        def update
		@post = Post.find(params[:id]);
		if @post.update_attributes(post_params)
			redirect_to posts_path, notice:  '更新されました!'
		else
			render action: 'edit'
		end
        end

	def destroy
		@post = Post.find(params[:id]);
		@post.destroy
		render json: { post: @post }
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
