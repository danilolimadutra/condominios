class FornecedorsController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
  end

  # GET /fornecedors/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedors/1/edit
  def edit
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to tenant_fornecedor_path(@fornecedor, tenant_id: @tenant.id), notice: 'Fornecedor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /fornecedors/1
  # PATCH/PUT /fornecedors/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to tenant_fornecedor_path(@fornecedor, tenant_id: @tenant.id), notice: 'Fornecedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to tenant_fornecedors_path(tenant_id: @tenant.id), notice: 'Fornecedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :pf, :documento, :contato, :telefone, :email, :site, :endereco, :observacao, :tenant_id, :tipo_fornecedor_id, :tenant_id)
    end
end
