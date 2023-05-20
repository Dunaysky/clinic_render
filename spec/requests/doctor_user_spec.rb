# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DoctorUser' do
  let!(:user) { create(:user) }
  let!(:doctor) { create(:doctor) }
  let!(:profile) { create(:profile) }

  before do
    sign_in profile
  end

  describe 'POST /doctor_users' do
    let(:doctor_user_params) do
      {
        doctor_id: doctor.id,
        user_id: user.id
      }
    end
    let(:invalid_params) do
      {
        user_id: user.id,
        doctor_id: -1
      }
    end

    context 'when create doctor_users without errors' do
      it 'creates doctor_users record' do
        expect do
          post '/doctor_users', params: doctor_user_params
        end.to change(DoctorUser, :count).by(1)
      end

      it 'returns informative message' do
        post '/doctor_users', params: doctor_user_params

        expect(flash[:notice]).to match(/Appointment was successfully created./)
      end
    end

    context 'when create doctor_users with errors' do
      it 'Do not create doctor_users without doctor' do
        expect do
          post '/doctor_users', params: invalid_params
        end.not_to change(DoctorUser, :count)
      end
    end
  end
end
