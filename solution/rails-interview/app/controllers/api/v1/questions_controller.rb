module Api::V1
  class QuestionsController < ApiController
    def index
      @questions = Question.public_questions
      @questions = @questions.search(params[:query]) if params[:query].present?
      @questions = @questions.includes(:user, answers: [:user])

      if @questions.empty?
        render_no_content
      else
        render :index
      end
    end
  end
end