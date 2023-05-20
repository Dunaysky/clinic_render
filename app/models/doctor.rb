# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :category
  has_many   :doctor_users, dependent: :nullify
  has_many   :users, through: :doctor_users
  has_one    :profile, as: :related_to, dependent: :destroy

  scope :without_profile, -> { where.not(id: Doctor.joins(:profile)) }
  scope :with_profile, -> { where(id: Doctor.joins(:profile)) }

  def display_name
    "#{profile ? "#{profile.first_name} #{profile.last_name}" : "Id:#{id}"} | #{category.name}"
  end
end
