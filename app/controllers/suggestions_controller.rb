class SuggestionsController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def suggestion
    if request.post?
      SuggestionMailer.suggestion(current_user, suggestion_params).deliver
      redirect_to root_path
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :category, :reference, :description)
  end

end
