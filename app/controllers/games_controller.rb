class GamesController < ApplicationController
  
  def new
  end

  def play
  	@category = params[:category].capitalize
    @count = params[:number_of_questions].to_i
  	@@questions = Category.find_by(name: params[:category]).questions.sample(@count)
    @@answers, @@correct_answers = [], []
    Answer.where(question_id: @@questions.map(&:id)).each do |a|
      @@answers << a
      @@correct_answers << a.id if a.correct == 1
    end
  end

  def get_question
    question = @@questions[params[:index].to_i]
    data = { question: question }
    data[:answers] = @@answers.select { |a| a.question_id == question.id }
    respond_to do |format|
      format.json { render json: data }
    end
  end

  def check_answer
    answer = params[:answer].to_i
    data = @@correct_answers.include?(answer)
  	respond_to do |format|
      format.json { render json: data }
    end
  end
end