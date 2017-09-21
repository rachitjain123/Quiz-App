class QuizController < ApplicationController
	before_action :admin_user,   only: [:new, :create, :add_question, :create_question]
	before_action :logged_in_user, only: [:index, :show]

	def new
		@quiz = QuizSet.new
	end

	def create
		@quiz = QuizSet.new(sur_params)
		if @quiz.save
			flash[:success] = "Quiz created!"
			redirect_to :controller => "quiz", :action => "add_question", :id => @quiz.id
		else
			render 'new'
		end
	end

	def add_question
		@quiz= QuizSet.find(params[:id])
	end

	def create_question
		temp = Que.new()
		temp.category = params[:question][:category]
		temp.desc = params[:question][:desc]
		temp.a = params[:question][:a]
		temp.b = params[:question][:b]
		temp.c = params[:question][:c]
		temp.d = params[:question][:d]
		temp.QuizSet_id = params[:question][:id]
		if(params[:question][:over] == '0')
			if temp.save()
				flash[:success] = "Question added!"
				redirect_to :controller => "quiz", :action => "add_question", :id => params[:question][:id]
			else
				render 'new'
			end

		elsif(params[:question][:over] == '1')
			if temp.save()
				flash[:success] = "Question added!"
				
			end
			

			redirect_to root_url
		end
	end
	def index
		@quizes = QuizSet.paginate(page: params[:page])
	end


	def show
		@questions = Que.where(QuizSet_id: params[:id])
		@quiz= QuizSet.find(params[:id])
		if(State.find_by(user_id:session[:user_id],quiz_set_id:@quiz.id))

		@gh = State.find_by(user_id:session[:user_id],quiz_set_id:@quiz.id).solv
		@gh.split(",").map(&:to_i)
		end

	end


	def save
		quiz_id = params[:quiz_id]
		params[:response].each do |value, resp|

			if(resp[:category]!="mcq_m")
				temp = Resp.new()
				temp.Que_id = resp[:id]
				temp.response = resp[:response]
				temp.User_id = resp[:user]

				rt = State.find_by(user_id:temp.User_id,quiz_set_id:quiz_id)
				if(rt)
					x = rt.solv
					rt.solv = x + "," + temp.Que_id.to_s
					rt.save()
				else
					temp2 = State.new(user_id:temp.User_id,quiz_set_id:quiz_id,solv:temp.Que_id)
					temp2.save()
				end
				temp.save()
				
				flash[:success] = "Quiz Answered!"

			else
				if(resp[:response1]) 
					temp = Resp.new()
					temp.Que_id = resp[:id]
					temp.User_id = resp[:user]
					temp.response = "1" + resp[:response1]

					rt = State.find_by(user_id:temp.User_id,quiz_set_id:quiz_id)
					if(rt)
						x = rt.solv
						rt.solv = x + "," + temp.Que_id.to_s
						rt.save()
					else
						temp2 = State.new(user_id:temp.User_id,quiz_set_id:quiz_id,solv:temp.Que_id)
						temp2.save()
					end
					temp.save()
				end
				if(resp[:response2]) 
					temp = Resp.new()
					temp.Que_id = resp[:id]
					temp.User_id = resp[:user]
					temp.response = "2" + resp[:response2]
					rt = State.find_by(user_id:temp.User_id,quiz_set_id:quiz_id)
					if(rt)
						x = rt.solv
						rt.solv = x + "," + temp.Que_id.to_s
						rt.save()
					else
						temp2 = State.new(user_id:temp.User_id,quiz_set_id:quiz_id,solv:temp.Que_id)
						temp2.save()
					end
					temp.save()
				end
				if(resp[:response3]) 
					temp = Resp.new()
					temp.Que_id = resp[:id]
					temp.User_id = resp[:user]
					temp.response = "3" + resp[:response3]
					rt = State.find_by(user_id:temp.User_id,quiz_set_id:quiz_id)
					if(rt)
						x = rt.solv
						rt.solv = x + "," + temp.Que_id.to_s
						rt.save()
					else
						temp2 = State.new(user_id:temp.User_id,quiz_set_id:quiz_id,solv:temp.Que_id)
						temp2.save()
					end
					temp.save()
				end
				if(resp[:response4]) 
					temp = Resp.new()
					temp.Que_id = resp[:id]
					temp.User_id = resp[:user]
					temp.response = "4" + resp[:response4]
					rt = State.find_by(user_id:temp.User_id,quiz_set_id:quiz_id)
					if(rt)
						x = rt.solv
						rt.solv = x + "," + temp.Que_id.to_s
						rt.save()
					else
						temp2 = State.new(user_id:temp.User_id,quiz_set_id:quiz_id,solv:temp.Que_id)
						temp2.save()
					end
					temp.save()
				end
				flash[:success] = "Quiz Answered!"

			end
		end
		#redirect_to :controller => "static_pages", :action => "home"

	end

	def display_responses
		@responses = Resp.all
	end

	def edit
		@quiz = QuizSet.find(params[:id])
	end

	def view_the_leaderboard
		@quiz = QuizSet.find(params[:id])
		@responses = Resp.all
	end

	def view_the_genre1_leaderboard
		@responses = Resp.all
	end

	def view_the_genre2_leaderboard
		@responses = Resp.all
	end

	def display_the_leaderboard
		@quizzes = QuizSet.all
	end


	def update
		@quiz = QuizSet.find(params[:id])
		if @quiz.update_attributes(sur_params)
			flash[:success] = "Quiz updated"
			redirect_to 'index'
		else
			render 'edit'
		end
	end

	def destroy
		QuizSet.find(params[:id]).destroy
		flash[:success] = "Quiz deleted"
		redirect_to root_url
	end

	private

	def sur_params
		params.require(:quiz_set).permit(:name)
	end

	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end
end
