class SuggestionsController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def new; end

  def create
    if verify_recaptcha
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
