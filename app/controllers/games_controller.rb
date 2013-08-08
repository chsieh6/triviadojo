class GamesController < ApplicationController
  
  def new
  end

  def play
  	@category = params[:category].capitalize
    cat = Category.find_by(name: params[:category])
    @category_id = cat.id
    @count = params[:number_of_questions].to_i
  	@@questions = cat.questions.sample(@count)
    @@answers, @@correct_answers = [], []
    Answer.where(question_id: @@questions.map(&:id)).each do |a|
      @@answers << a
      @@correct_answers << a.id if a.correct == 1
    end
    @@answers.shuffle!
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

  def submit_score
    @score = Score.new(score_params)
    if @score.save
      data = ''
      respond_to do |format|
        format.json { render json: data }
      end
    end
  end

  private

    def score_params
      params.permit(:number_correct, :number_attempted, :user_id, :category_id)
    end
end