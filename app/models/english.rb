class English < ApplicationRecord
  has_and_belongs_to_many :russians
  before_save { self.name = name.downcase }
  validates :name, presence: true
end
