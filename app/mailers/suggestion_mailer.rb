class SuggestionMailer < ApplicationMailer

  default from: 'no-reply@tracesco.org'

  def suggestion(user, suggestion_params)
    @user = user
    @suggestion = suggestion_params
    mail(to: ENV['SUGGESTIONS_EMAIL_ADDRESS'],
      subject: 'TRACES Resilience Measure Suggestion'
    )
  end

end
