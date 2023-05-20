# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(AdminUser)
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :read, User
      can :manage, AdminUser
      can :manage, Profile
      can :manage, Doctor
      can :manage, Category
      can :manage, DoctorUser
      cannot :destroy, DoctorUser
      cannot :destroy, Doctor
    elsif user.doctor?
      can :manage, Profile
      can %i[read update], DoctorUser
    elsif user.user?
      can :read, Doctor
      can :manage, Profile
      can %i[read create], DoctorUser
    end
  end
end
