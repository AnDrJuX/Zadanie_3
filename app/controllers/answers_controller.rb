class AnswersController < ApplicationController
  before_action :load_question #, only: [:new, :create]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      # if @question.answers << Answer.new(answer_params)
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
