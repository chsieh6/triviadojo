class QuestionsController < ApplicationController

	def index
	end

	def new
	end

	def create
		if current_user.admin?
			@category = Category.create(name: params[:category])
			@question = @category.questions.create(content: params[:question])
			@answer = @question.answers.create(content: params[:answer][part1])
			@answer = @question.answers.create(content: params[:answer][part2])
			@answer = @question.answers.create(content: params[:answer][part3])
			@answer = @question.answers.create(content: params[:answer][part4])
			ContactMailer.submit_question(params[:category], params[:question], params[:answer]).deliver
			flash[:success] = "The question has been added!  Thank you!"
			redirect_to @user
		else
			ContactMailer.submit_question(params[:category], params[:question], params[:answer]).deliver
			flash[:success] = "Thank you for contributing to TriviaDojo with your knowledge!"
			redirect_to @user
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
