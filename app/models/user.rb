class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :terms_of_service
  validates_acceptance_of :terms_of_service, accept: true, on: :create
end
