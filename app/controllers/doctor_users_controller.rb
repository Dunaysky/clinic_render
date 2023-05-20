# frozen_string_literal: true

class DoctorUsersController < ApplicationController
  before_action :load_appointment, only: %i[update]

  def index
    @active_appointments = doctor_users.active
    @completed_appointments = doctor_users.completed
  end

  def create
    appointment = DoctorUser.new(create_appointment_params)
    if appointment.save
      redirect_to root_path,
                  flash: { notice: 'Appointment was successfully created.' }
    else
      redirect_to root_path,
                  flash: { alert: appointment.errors.full_messages.to_sentence }
    end
  end

  def update
    if @appointment.update(update_appointment_params)
      redirect_to root_path,
                  flash: { notice: 'Recommendation sent successfully.' }
    else
      redirect_to root_path,
                  flash: { alert: @appointment.errors.full_messages.to_sentence }
    end
  end

  private

  def create_appointment_params
    params.permit(:doctor_id, :user_id)
  end

  def update_appointment_params
    params.permit(:recommendation)
  end

  def doctor_users
    @doctor_users ||= current_profile.related_to.doctor_users
  end

  def load_appointment
    @appointment = DoctorUser.find(params[:id])
  end
end
