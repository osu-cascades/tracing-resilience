class SuggestionMailer < ApplicationMailer

  default from: 'tracing-resilience@noreply.com'

  def suggestion(user, suggestion_params)
    @user = user
    @suggestion = suggestion_params
    mail to: 'nathanstruhs@gmail.com', subject: "Tracing Resilience: Suggestion - #{@suggestion.fetch(:title)}"
  end

end
