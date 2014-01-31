class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
  end

  def create
      #@post = Post.find(params[:post_id])
      #@post.comments.build(comment_params)
      @comment = Comment.new(comment_params)

      respond_to do |format|
        if @comment.save
          # current_user.comments << @comment
          format.html { redirect_to posts_path, notice: 'Comment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @comment }
        else
          format.html { render action: 'new' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:author, :author_email, :post_id, :content, (:approved if current_user && current_user.role == "editor"))
    end
end
