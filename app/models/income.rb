class Income < ApplicationRecord
  belongs_to :tenant
  belongs_to :condominio
  belongs_to :income_tipe
  belongs_to :apartment
  belongs_to :forma_pagamento
  
end
