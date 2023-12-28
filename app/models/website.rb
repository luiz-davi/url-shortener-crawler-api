class Website < ApplicationRecord
  validates :link, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
