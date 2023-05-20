# frozen_string_literal: true

ActiveAdmin.register DoctorUser, as: 'Appointments' do
  permit_params :doctor_id,
                :recommendation,
                :status

  scope :all, default: true
  scope 'Avtive', :active_appointment
  scope 'Completed', :completed_appointment

  form do |f|
    f.semantic_errors(*f.object.errors)

    inputs 'Appointment Details' do
      input :doctor
      input :recommendation
      input :status
    end

    actions
  end
end
