# frozen_string_literal: true

class DoctorsController < ApplicationController
  load_and_authorize_resource

  def index
    doctors
  end

  def show; end

  private

  def doctors
    @doctors = if params[:category].present?
                 Doctor.where(category_id: params[:category]).with_profile
               else
                 Doctor.with_profile
               end
  end
end
