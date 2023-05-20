# frozen_string_literal: true

require 'rails_helper'

describe 'Login as Doctor and leave recommentation to User flow:' do
  let!(:doctor) { create(:doctor) }
  let!(:doctor_profile) { create(:profile, related_to: doctor) }
  let!(:user) { create(:user) }

  before do
    create(:profile, related_to: user)
    create(:doctor_user, doctor_id: doctor.id, user_id: user.id)
  end

  it 'Doctor logs in and leaves recommendation to User' do
    visit '/profiles/sign_in'

    find_by_id('profile_phone_number').fill_in with: doctor_profile.phone_number
    find_by_id('profile_password').fill_in with: doctor_profile.password

    click_button 'Log in'

    expect(page).to(have_content('Signed in successfully.'))

    find_by_id('recommendation').fill_in with: 'Doctor test recommendation'

    click_button 'Send'

    expect(page).to(have_content('Recommendation sent successfully.'))
  end
end
