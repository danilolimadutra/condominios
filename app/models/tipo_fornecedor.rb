class TipoFornecedor < ApplicationRecord
  has_many :fornecedors
  validates :nome, presence: true, length: { minimum: 2 }

end
