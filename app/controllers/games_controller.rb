class GamesController < ApplicationController
  
  def new
  end

  def play
  	@category = params[:category].capitalize
  	@questions = Category.find_by(name: params[:category]).questions.order('RANDOM()').limit(params[:number_of_questions])
  end

end