# frozen_string_literal: true

class User < ApplicationRecord
  has_many :doctor_users, dependent: :nullify
  has_many :doctors, through: :doctor_users
  has_one  :profile, as: :related_to, dependent: :destroy

  def display_name
    profile ? "#{profile.first_name} #{profile.last_name}" : 'User'
  end
end
