# frozen_string_literal: true

ActiveAdmin.register Profile do
  permit_params :first_name,
                :last_name,
                :phone_number,
                :category,
                :related_to_type,
                :related_to_id,
                :password

  before_create do |resource|
    resource.related_to_type = 'Doctor'
  end

  scope :all, default: true
  scope 'Users', :related_to_user
  scope 'Doctors', :related_to_doctor

  filter :first_name
  filter :last_name
  filter :phone_number
  filter :related_to_type
  filter :created_at
  filter :updated_at

  index do
    id_column
    column :first_name
    column :last_name
    column :phone_number
    column :related_to_type
    column :related_to
    column :created_at
    column :updated_at

    actions dropdown: true
  end

  form do |f|
    f.semantic_errors(*f.object.errors)

    inputs 'Profile Details' do
      input :first_name
      input :last_name
      input :phone_number
      input :password
      input :confirm_password
      input :related_to, label: 'Doctor', as: :select, collection: Doctor.without_profile,
                         hint: 'You can only select doctors without profile'
    end

    actions
  end

  show do
    attributes_table title: 'Profile Details' do
      row :id
      row :first_name
      row :last_name
      row :phone_number
      row :related_to_type
      row :related_to
      row :created_at
      row :updated_at
    end
  end
end
