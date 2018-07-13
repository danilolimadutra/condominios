class DespesasController < ApplicationController
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]
  before_action :set_condominio, only: [:index]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_local_tenant, only: [:index]
  before_action :verify_local_tenant

  # GET /despesas
  # GET /despesas.json
  def index
    @despesas = @condominio.despesas
  end

  # GET /despesas/1
  # GET /despesas/1.json
  def show
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
  end

  # GET /despesas/1/edit
  def edit
  end

  # POST /despesas
  # POST /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)
    @despesa.user_id = current_user.id
    @despesa.valor = format_valor

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to condominio_despesas_path(condominio_id: @despesa.condominio_id), notice: 'Despesa was successfully created.' }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html { render :new }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update

    #format_number
    params_update = despesa_params
    params_update[:valor] = format_valor

    respond_to do |format|
      if @despesa.update(params_update)
        format.html { redirect_to condominio_despesas_path(condominio_id: @despesa.condominio_id), notice: 'Despesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @despesa }
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    @despesa.destroy
    respond_to do |format|
      format.html { redirect_to condominio_despesas_path(condominio_id: @despesa.condominio_id), notice: 'Despesa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    def set_condominio
      @condominio = Condominio.find(params[:condominio_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def despesa_params
      params.require(:despesa).permit(:descricao, :data, :valor, :observacao, :anexo, :tenant_id, :user_id, :fornecedor_id, :tipo_despesa_id, :condominio_id, :forma_pagamento_id)
    end

    def set_local_tenant
      @tenant = @condominio.tenant
    end

    def verify_local_tenant
      if params[:tenant_id]
        unless params[:tenant_id] == Tenant.current_tenant_id.to_s
          redirect_to :root, flash: { error: 'Você não possui permissão'}
        end
      else
        unless @tenant.id.to_s == Tenant.current_tenant_id.to_s
          redirect_to :root, flash: { error: 'Você não possui permissão'}
        end
      end
    end

    def format_valor
      despesa_params[:valor].gsub(/[.,]/, '.' => '', ',' => '.')
    end
end
