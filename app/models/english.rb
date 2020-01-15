# frozen_string_literal: true

class English < ApplicationRecord
  has_and_belongs_to_many :russians
  has_and_belongs_to_many :collections
  before_save { self.name = name.downcase }
  validates :name, presence: true
end
