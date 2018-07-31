class Apartment < ApplicationRecord
  belongs_to :tenant
  belongs_to :condominio
  validates :condominio, presence: true
  validates :tenant, presence: true
  validates :number, presence: true
end
