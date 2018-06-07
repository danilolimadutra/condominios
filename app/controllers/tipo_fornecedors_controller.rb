class TipoFornecedorsController < ApplicationController
  before_action :set_tipo_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  # GET /tipo_fornecedors
  # GET /tipo_fornecedors.json
  def index
    @tipo_fornecedors = TipoFornecedor.all
  end

  # GET /tipo_fornecedors/1
  # GET /tipo_fornecedors/1.json
  def show
  end

  # GET /tipo_fornecedors/new
  def new
    @tipo_fornecedor = TipoFornecedor.new
  end

  # GET /tipo_fornecedors/1/edit
  def edit
  end

  # POST /tipo_fornecedors
  # POST /tipo_fornecedors.json
  def create
    @tipo_fornecedor = TipoFornecedor.new(tipo_fornecedor_params)

    respond_to do |format|
      if @tipo_fornecedor.save
        #format.html { redirect_to @tipo_fornecedor, notice: 'Tipo de fornecedor foi criado com sucesso.' }
        format.html { redirect_to tenant_tipo_fornecedors_path(tenant_id: @tenant.id), notice: 'Tipo de fornecedor foi criado com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @tipo_fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_fornecedors/1
  # PATCH/PUT /tipo_fornecedors/1.json
  def update
    respond_to do |format|
      if @tipo_fornecedor.update(tipo_fornecedor_params)
        format.html { redirect_to tenant_tipo_fornecedors_path(tenant_id: @tenant.id), notice: 'Tipo fornecedor was successfully updated.' }

      else
        format.html { render :edit }
        format.json { render json: @tipo_fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_fornecedors/1
  # DELETE /tipo_fornecedors/1.json
  def destroy
    @tipo_fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to tenant_tipo_fornecedors_path(tenant_id: @tenant.id), notice: 'Tipo fornecedor was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_fornecedor
      @tipo_fornecedor = TipoFornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_fornecedor_params
      params.require(:tipo_fornecedor).permit(:nome, :condominio_id, :tenant_id)
    end

    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end

    def verify_tenant
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
        redirect_to :root, flash: { error: 'Você não possui permissão'}
      end
    end
end
