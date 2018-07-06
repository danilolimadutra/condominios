class Condominio < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :nome
  has_many :tipo_fornecedors, dependent: :destroy
  has_many :despesas, dependent: :destroy
  validate :free_plan_can_only_have_one_condominio

  def free_plan_can_only_have_one_condominio
    if self.new_record? && (tenant.condominios.count > 2) && (tenant.plan == 'free')
      errors.add(:base, "Planos gratuitos só podem ter um único condomínio.")
    end
  end

  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
      tenant.condominios
  end
end
