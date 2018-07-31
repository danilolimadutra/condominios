# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180731004252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "number"
    t.string "floor"
    t.string "block"
    t.string "dweller"
    t.string "fone"
    t.string "email"
    t.bigint "tenant_id"
    t.bigint "condominio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condominio_id"], name: "index_apartments_on_condominio_id"
    t.index ["tenant_id"], name: "index_apartments_on_tenant_id"
  end

  create_table "condominios", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "sindico"
    t.string "telefone"
    t.string "email"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_condominios_on_tenant_id"
  end

  create_table "despesas", force: :cascade do |t|
    t.string "descricao"
    t.date "data"
    t.decimal "valor", precision: 8, scale: 2
    t.string "pagamento"
    t.string "observacao"
    t.string "anexo"
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.bigint "fornecedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tipo_despesa_id"
    t.bigint "condominio_id"
    t.bigint "forma_pagamento_id"
    t.index ["condominio_id"], name: "index_despesas_on_condominio_id"
    t.index ["forma_pagamento_id"], name: "index_despesas_on_forma_pagamento_id"
    t.index ["fornecedor_id"], name: "index_despesas_on_fornecedor_id"
    t.index ["tenant_id"], name: "index_despesas_on_tenant_id"
    t.index ["tipo_despesa_id"], name: "index_despesas_on_tipo_despesa_id"
    t.index ["user_id"], name: "index_despesas_on_user_id"
  end

  create_table "forma_pagamentos", force: :cascade do |t|
    t.string "nome"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_forma_pagamentos_on_tenant_id"
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome"
    t.boolean "pf"
    t.string "documento"
    t.string "contato"
    t.string "telefone"
    t.string "email"
    t.string "site"
    t.string "endereco"
    t.string "observacao"
    t.bigint "tenant_id"
    t.bigint "tipo_fornecedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_fornecedors_on_tenant_id"
    t.index ["tipo_fornecedor_id"], name: "index_fornecedors_on_tipo_fornecedor_id"
  end

  create_table "income_tipes", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_income_tipes_on_tenant_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_members_on_tenant_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "new_incomes", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_new_incomes_on_tenant_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tenants", force: :cascade do |t|
    t.bigint "tenant_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plan"
    t.index ["name"], name: "index_tenants_on_name"
    t.index ["tenant_id"], name: "index_tenants_on_tenant_id"
  end

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "user_id", null: false
    t.index ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id"
  end

  create_table "tipo_despesas", force: :cascade do |t|
    t.string "nome"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tipo_despesas_on_tenant_id"
  end

  create_table "tipo_fornecedors", force: :cascade do |t|
    t.string "nome"
    t.bigint "condominio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tenant_id"
    t.index ["condominio_id"], name: "index_tipo_fornecedors_on_condominio_id"
    t.index ["tenant_id"], name: "index_tipo_fornecedors_on_tenant_id"
  end

  create_table "tipo_receita", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tipo_receita_on_tenant_id"
  end

  create_table "tipo_receitas", force: :cascade do |t|
    t.string "name"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_tipo_receitas_on_tenant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "skip_confirm_change_password", default: false
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "apartments", "condominios"
  add_foreign_key "apartments", "tenants"
  add_foreign_key "condominios", "tenants"
  add_foreign_key "despesas", "condominios"
  add_foreign_key "despesas", "forma_pagamentos"
  add_foreign_key "despesas", "fornecedors"
  add_foreign_key "despesas", "tenants"
  add_foreign_key "despesas", "tipo_despesas"
  add_foreign_key "despesas", "users"
  add_foreign_key "forma_pagamentos", "tenants"
  add_foreign_key "fornecedors", "tenants"
  add_foreign_key "fornecedors", "tipo_fornecedors"
  add_foreign_key "income_tipes", "tenants"
  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "new_incomes", "tenants"
  add_foreign_key "tenants", "tenants"
  add_foreign_key "tipo_despesas", "tenants"
  add_foreign_key "tipo_fornecedors", "condominios"
  add_foreign_key "tipo_fornecedors", "tenants"
  add_foreign_key "tipo_receita", "tenants"
  add_foreign_key "tipo_receitas", "tenants"
end
