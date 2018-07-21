class Despesa < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :fornecedor
  belongs_to :tipo_despesa
  belongs_to :condomionio
  belongs_to :forma_pagamento
  validates :descricao, presence: true
  validates :data, presence: true
  validates :valor, presence: true
  validates :fornecedor, presence: true
  validates :tipo_despesa, presence: true
  validates :forma_pagamento, presence: true
  mount_uploader :anexo, FileUploader
  validate :anexo_size
  #FIXME: Sempre que ativada a validação do condomionio o cadastro de desepsa quebra
  #validates :condomionio, presence: true

  def anexo_size
    if anexo.size > 2.megabytes
      errors.add(:picture, "Deve ser menor do que 2MB")
    end
  end
end
