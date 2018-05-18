require 'rails_helper'

RSpec.describe MeasuresController do

  it { should use_before_action(:authenticate_user!) }
  it { should use_before_action(:require_admin) }

end
