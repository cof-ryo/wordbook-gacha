class Word < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :mean, presence: true
end
