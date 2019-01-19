class SuggestionMailer < ApplicationMailer

  default from: 'no-reply@tracesco.org'

  def suggestion(user, suggestion_params)
    @user = user
    @suggestion = suggestion_params
    mail(to: ENV['SUGGESTION_RECIPIENT_EMAIL'],
      subject: 'TRACES Resilience Measure Suggestion'
    )
  end

end
