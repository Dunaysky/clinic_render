# frozen_string_literal: true

FactoryBot.define do
  factory :doctor_user do
    doctor
    user
    status { 0 }
  end
end
