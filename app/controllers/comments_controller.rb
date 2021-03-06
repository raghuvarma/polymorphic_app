class CommentsController < ApplicationController
  before_filter :load_commenmtable
  def index
    #@commentable = Article.find(params[:article_id])
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end
  
  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable, notice: "Comment Created."
    else
      render :new
    end
  end
  
private
   def load_commenmtable
     resource, id= request.path.split('/')[1,2] #photos/1
     @commentable = resource.singularize.classify.constantize.find(id) #Photo.find(1)
   end  
  
end










