class AnswersController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

	def index
		@answers = Answers.all
	end

	def create
		@answer = Answer.new(answer_params)
		@answer.user_id == current_user.id
		if @answer.save
			flash[:success] = 'La respuesta ha sido registrada con éxito.'
	  end
	    redirect_to question_path(params[:question_id])
	end

	def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = 'La respuesta ha sido actualizada con éxito.'
    end
      redirect_to question_path(params[:question_id])
  end

  def destroy
    @answer = Answer.find_by(question_id: params[:question_id], id: params[:id])
    if @answer.destroy
      flash[:success] = 'La respuesta ha sido eliminada con éxito.'
    end
      redirect_to question_path(params[:question_id])
  end

  private
    def answer_params
      params.require(:answer)
        .permit(:answer_body)
        .merge(user_id: current_user.id, question_id: params[:question_id])
    end




end