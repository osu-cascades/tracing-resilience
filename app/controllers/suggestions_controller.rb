class SuggestionsController < ApplicationController

  before_action :authenticate_user!

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.register and verify_recaptcha
      SuggestionMailer.suggestion(current_user, suggestion_params).deliver
      redirect_to root_path, notice: 'Thank you, your suggestion has been sent.'
    else
      flash[:recaptcha_error]
      render :new
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :category, :reference, :description)
  end

end
