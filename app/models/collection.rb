# frozen_string_literal: true

class Collection < ApplicationRecord
  has_and_belongs_to_many :russians
  has_and_belongs_to_many :englishes
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :creator_id, presence: true
end
