# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  context 'has a valid factory' do
    it { expect(create(:user)).to be_valid }
  end
end
