# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  context 'has a valid factory' do
    it { expect(create(:category)).to be_valid }
  end
end
