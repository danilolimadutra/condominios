class Despesa < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :fornecedor
  belongs_to :tipo_despesa
  validates :descricao, presence: true
  validates :data, presence: true
  validates :valor, presence: true
  validates :pagamento, presence: true
  validates :anexo, presence: true
  validates :fornecedor, presence: true
end
