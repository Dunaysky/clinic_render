# frozen_string_literal: true

class Category < ApplicationRecord
  has_many  :doctors, dependent: :destroy
  validates :name, uniqueness: true
end
