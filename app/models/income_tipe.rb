class IncomeTipe < ApplicationRecord
  belongs_to :tenant
  validates :name, presence: true, length: { minimum: 2 }
end
