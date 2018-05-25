require 'rails_helper'

RSpec.describe SuggestionsController do

  it { should use_before_action(:authenticate_user!) }

end
