# frozen_string_literal: true

module Profiles
  class RegistrationsController < Devise::RegistrationsController
    before_action :create_related_to, only: [:create]

    protected

    def create_related_to
      params['profile'].merge!({
                                 related_to_type: 'User',
                                 related_to_id: User.create.id
                               })
    end
  end
end
