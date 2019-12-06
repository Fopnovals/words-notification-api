# frozen_string_literal: true

class Russian < ApplicationRecord
  has_and_belongs_to_many :englishes
  before_save { self.name = name.downcase }
  validates :name, presence: true
end
