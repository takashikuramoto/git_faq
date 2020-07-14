class QuestionsController < ApplicationController
  def create
    Question.create(create_params)
    redirect_to :root and return
  end

 
  
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    
  end
  
  def search
    @question = Question.where('text LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id)
  end
end