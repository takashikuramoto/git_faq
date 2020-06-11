class TopController < ApplicationController
  def index
    @question = Question.new
    @questions  = Question.all
    
    @feed_contents = FeedContent.all
  end
end