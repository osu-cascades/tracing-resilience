class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:guest, :admin]

  validates_acceptance_of :terms_of_service
  validates_presence_of :role, :first_name, :last_name, :organization, :city, :state, :zip

  def to_s
    "#{first_name} #{last_name}"
  end

end
