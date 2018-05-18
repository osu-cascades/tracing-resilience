require 'rails_helper'

RSpec.describe UsersController do

  it { should use_before_action(:authenticate_user!) }
  it { should use_before_action(:require_admin) }
  it { should use_before_action(:require_admin_or_current_user) }

end
