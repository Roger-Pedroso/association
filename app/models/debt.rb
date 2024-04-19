class Debt < ApplicationRecord
  belongs_to :person

  validates :amount, presence: true

  after_create :update_person_balance
  after_destroy :update_person_balance

  private

  def update_person_balance
    person.update_balance!
  end

end
