# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor do
  context 'has a valid factory' do
    it { expect(create(:doctor)).to be_valid }
  end
end
