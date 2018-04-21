class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:guest, :admin]

  attr_accessor :terms_of_service
  # BUG: validates_acceptance_of always fails even when terms of service param value is '1'
  # validates_acceptance_of :terms_of_service, accept: true
  validates_presence_of :role, :first_name, :last_name, :organization, :city, :state, :zip

  def to_s
    "#{first_name} #{last_name}"
  end

end
