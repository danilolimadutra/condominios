class CondominiosController < ApplicationController
  before_action :set_condominio, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  # GET /condominios
  # GET /condominios.json
  def index
    @condominios = Condominio.all
  end

  # GET /condominios/1
  # GET /condominios/1.json
  def show
  end

  # GET /condominios/new
  def new
    @condominio = Condominio.new
  end

  # GET /condominios/1/edit
  def edit
  end

  # POST /condominios
  # POST /condominios.json
  def create
    @condominio = Condominio.new(condominio_params)

    respond_to do |format|
      if @condominio.save
        format.html { redirect_to root_url, notice: 'Condominio foi criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /condominios/1
  # PATCH/PUT /condominios/1.json
  def update
    respond_to do |format|
      if @condominio.update(condominio_params)
        format.html { redirect_to root_url, notice: 'Condominio foi atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /condominios/1
  # DELETE /condominios/1.json
  def destroy
    @condominio.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Condominio foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominio
      @condominio = Condominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominio_params
      params.require(:condominio).permit(:nome, :endereco, :sindico, :telefone, :email, :tenant_id)
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
