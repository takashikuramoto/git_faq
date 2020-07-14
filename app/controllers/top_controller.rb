class TopController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all.order("updated_at DESC").page(params[:page]).per(5)
    @feed_contents = FeedContent.all.order("updated_at DESC").page(params[:page]).per(5)
    @feed_contents_resource = @feed_contents.map(&:content)
    
    
  end
  
  def search
    @questions = Question.where('text LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end
end