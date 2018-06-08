class Fornecedor < ApplicationRecord
  belongs_to :tenant
  belongs_to :tipo_fornecedor
  validates :nome, presence: true, length: { minimum: 2 }
  validates :tipo_fornecedor, presence: true
end
