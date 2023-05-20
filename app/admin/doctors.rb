# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :category_id
end
