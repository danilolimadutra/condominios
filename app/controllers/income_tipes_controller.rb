class IncomeTipesController < ApplicationController
  before_action :set_income_tipe, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :verify_tenant

  # GET /income_tipes
  # GET /income_tipes.json
  def index
    @income_tipes = IncomeTipe.all
  end

  # GET /income_tipes/1
  # GET /income_tipes/1.json
  def show
  end

  # GET /income_tipes/new
  def new
    @income_tipe = IncomeTipe.new
  end

  # GET /income_tipes/1/edit
  def edit
  end

  # POST /income_tipes
  # POST /income_tipes.json
  def create
    @income_tipe = IncomeTipe.new(income_tipe_params)

    respond_to do |format|
      if @income_tipe.save
        format.html { redirect_to tenant_income_tipes_path(tenant_id: @tenant.id), notice: 'Income tipe was successfully created.' }
        format.json { render :show, status: :created, location: @income_tipe }
      else
        format.html { render :new }
        format.json { render json: @income_tipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_tipes/1
  # PATCH/PUT /income_tipes/1.json
  def update
    respond_to do |format|
      if @income_tipe.update(income_tipe_params)
        format.html { redirect_to tenant_income_tipes_path(tenant_id: @tenant.id), notice: 'Income tipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_tipe }
      else
        format.html { render :edit }
        format.json { render json: @income_tipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_tipes/1
  # DELETE /income_tipes/1.json
  def destroy
    @income_tipe.destroy
    respond_to do |format|
      format.html { redirect_to tenant_income_tipes_path(tenant_id: @tenant.id), notice: 'Income tipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_tipe
      @income_tipe = IncomeTipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_tipe_params
      params.require(:income_tipe).permit(:name, :tenant_id)
    end
end
