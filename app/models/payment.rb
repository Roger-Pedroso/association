class Payment < ApplicationRecord
  belongs_to :person
  validates :amount, presence: true
  self.per_page = 50
end
