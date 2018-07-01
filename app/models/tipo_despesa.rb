class TipoDespesa < ApplicationRecord
  belongs_to :tenant
  validates :nome, presence: true, length: { minimum: 2 }
end
