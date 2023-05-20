# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile do
  context 'has a valid factory' do
    it { expect(create(:profile)).to be_valid }
  end

  context 'when validate presence' do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:first_name) }
  end

  context 'if phone number is unique and valid' do
    subject { FactoryBot.build(:profile) }

    it { is_expected.to validate_uniqueness_of(:phone_number).ignoring_case_sensitivity }
    it { expect(build(:profile, phone_number: '38050558215')).to be_valid }
    it { expect(build(:profile, phone_number: '+38050invalid')).not_to be_valid }
  end
end
