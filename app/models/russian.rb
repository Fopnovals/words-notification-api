# frozen_string_literal: true

class Russian < ApplicationRecord
  has_and_belongs_to_many :englishes
  has_and_belongs_to_many :collections
  before_save { self.name = name.downcase }
  validates :name, presence: true
end
