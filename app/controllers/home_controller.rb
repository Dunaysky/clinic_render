# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_profile.related_to_type == 'User'
      redirect_to doctors_path
    else
      redirect_to doctor_users_path
    end
  end
end
