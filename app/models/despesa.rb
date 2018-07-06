class Despesa < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :fornecedor
  belongs_to :tipo_despesa
  belongs_to :condomionio
  validates :descricao, presence: true
  validates :data, presence: true
  validates :valor, presence: true
  validates :pagamento, presence: true
  validates :fornecedor, presence: true
  validates :tipo_despesa, presence: true
  #FIXME: Sempre que ativada a validação do condomionio o cadastro de desepsa quebra
  #validates :condomionio, presence: true
end
