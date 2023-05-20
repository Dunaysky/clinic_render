# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :name

  filter :name

  index do
    id_column
    column :name
    column :created_at
    column :updated_at

    actions dropdown: true
  end

  form do |f|
    f.semantic_errors(*f.object.errors)

    inputs 'Category Details' do
      input :name
    end

    actions
  end

  show do
    attributes_table title: 'Category Details' do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
  end
end
