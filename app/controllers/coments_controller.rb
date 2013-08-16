class ComentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Post.find(params[:post_id]).comments.create(params[:comment])
    redirect_to post_path(@post)
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
