# frozen_string_literal: true

class DoctorUser < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validate :verify_max_number_of_appointments

  enum status: {
    active: 0,
    completed: 1
  }
  scope :active_appointment, -> { where(status: :active) }
  scope :completed_appointment, -> { where(status: :completed) }

  before_update :update_status_when_completed

  def verify_max_number_of_appointments
    return if doctor && doctor.doctor_users.active.count < 10

    @errors.add(:base, 'Doctor has too many active appoinments')
  end

  def update_status_when_completed
    return unless recommendation_changed? && recommendation.present?

    self.status = :completed
  end
end
