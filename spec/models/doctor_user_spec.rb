# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DoctorUser do
  context 'has a valid factory' do
    it { expect(create(:doctor_user)).to be_valid }
  end
end
