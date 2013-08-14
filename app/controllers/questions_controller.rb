class QuestionsController < ApplicationController

	def index
	end

	def new
	end

	def create
		if current_user.admin?
			category = Category.find_by(name: params[:category])
			question = category.questions.create(content: params[:question])
			question.answers.create(content: params[:answer1], correct: 1)
			question.answers.create(content: params[:answer2], correct: 0)
			question.answers.create(content: params[:answer3], correct: 0)
			question.answers.create(content: params[:answer4], correct: 0)
			answers = [params[:answer1], params[:answer2], params[:answer3], params[:answer4]]
			ContactMailer.submit_question(current_user.email, params[:category], params[:question], answers).deliver
			flash[:success] = "The question has been added!  Thank you!"
			redirect_to current_user
		else
			ContactMailer.submit_question(current_user.email, params[:category], params[:question], params[:answer]).deliver
			flash[:success] = "Thank you for contributing to TriviaDojo with your knowledge!"
			redirect_to current_user
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
