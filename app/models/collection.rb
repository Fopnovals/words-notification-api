# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :englishes
  has_many :russians
  belongs_to :user
  validates :name, presence: true
end
