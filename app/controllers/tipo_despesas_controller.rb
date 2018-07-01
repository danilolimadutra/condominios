class TipoDespesasController < ApplicationController
  before_action :set_tipo_despesa, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  # GET /tipo_despesas
  # GET /tipo_despesas.json
  def index
    @tipo_despesas = TipoDespesa.all
  end

  # GET /tipo_despesas/1
  # GET /tipo_despesas/1.json
  def show
  end

  # GET /tipo_despesas/new
  def new
    @tipo_despesa = TipoDespesa.new
  end

  # GET /tipo_despesas/1/edit
  def edit
  end

  # POST /tipo_despesas
  # POST /tipo_despesas.json
  def create
    @tipo_despesa = TipoDespesa.new(tipo_despesa_params)

    respond_to do |format|
      if @tipo_despesa.save
        format.html { redirect_to tenant_tipo_despesas_path(tenant_id: @tenant.id), notice: 'Tipo despesa was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_despesa }
      else
        format.html { render :new }
        format.json { render json: @tipo_despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_despesas/1
  # PATCH/PUT /tipo_despesas/1.json
  def update
    respond_to do |format|
      if @tipo_despesa.update(tipo_despesa_params)
        format.html { redirect_to tenant_tipo_despesas_path(tenant_id: @tenant.id), notice: 'Tipo despesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_despesa }
      else
        format.html { render :edit }
        format.json { render json: @tipo_despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_despesas/1
  # DELETE /tipo_despesas/1.json
  def destroy
    @tipo_despesa.destroy
    respond_to do |format|
      format.html { redirect_to tenant_tipo_despesas_path(tenant_id: @tenant.id), notice: 'Tipo despesa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_despesa
      @tipo_despesa = TipoDespesa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_despesa_params
      params.require(:tipo_despesa).permit(:nome, :tenant_id)
    end
end
