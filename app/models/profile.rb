# frozen_string_literal: true

class Profile < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :related_to, polymorphic: true

  validates :phone_number, uniqueness: true, presence: true
  validates :first_name, presence: true
  validate :verify_phone_number

  scope :related_to_user, -> { where(related_to_type: 'User') }
  scope :related_to_doctor, -> { where(related_to_type: 'Doctor') }

  def email_changed?
    false
  end

  def doctor?
    related_to_type == 'Doctor'
  end

  def user?
    related_to_type == 'User'
  end

  alias will_save_change_to_email? email_changed?
  alias email_required? email_changed?

  def verify_phone_number
    return if /^(\+)?\d+$/.match?(phone_number)

    errors.add(:base,
               'Phone number must consist exclusively of numbers and the + sign at the beginning')
  end
end
