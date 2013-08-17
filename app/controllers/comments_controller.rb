class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    #@comment = Post.find(params[:post_id]).comments.create(comment_params)
    @comment = Post.find(params[:post_id]).comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :template => "posts/show"
    end

  end

  def destroy
    @comment = Comment.find(params[:id]);
    @comment.destroy
    render json: { post: @comment }
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end

end
