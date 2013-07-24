class GamesController < ApplicationController
  
  def new
  end

  def play
  	@category = params[:category].capitalize
  	@questions = Category.find_by(name: params[:category]).questions.order('RANDOM()').limit(params[:number_of_questions])
  end

  def check_answer
  	@correct_answer = Answer.find(params[:answer]).correct
  	respond_to do |format|
      format.json { render json: @correct_answer }
    end
  end

end