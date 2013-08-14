class StaticPagesController < ApplicationController

	def home
	end

	def about
	end

	def contact
	end

	def submit
		ContactMailer.feedback_email(params[:name], params[:email], params[:type], params[:message]).deliver
		flash[:success] = "Thank you for submitting, we will get back to you promptly."
		render 'contact'
	end

end
