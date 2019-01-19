class SuggestionMailer < ApplicationMailer

  default from: 'no-reply@tracesco.org'
  SUGGESTION_RECIPIENT_EMAIL = ENV['SUGGESTION_RECIPIENT_EMAIL']

  def suggestion(user, suggestion_params)
    @user = user
    @suggestion = suggestion_params
    mail(to: SUGGESTION_RECIPIENT_EMAIL,
      subject: 'TRACES Resilience Measure Suggestion'
    )
  end

end
