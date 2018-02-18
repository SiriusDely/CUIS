class SavingProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saving_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /saving_products
  # GET /saving_products.json
  def index
    @saving_products = SavingProduct.all
  end

  # GET /saving_products/1
  # GET /saving_products/1.json
  def show
  end

  # GET /saving_products/new
  def new
    @saving_product = SavingProduct.new
    @credit_unions = CreditUnion.all
  end

  # GET /saving_products/1/edit
  def edit
    @credit_unions = CreditUnion.all
  end

  # POST /saving_products
  # POST /saving_products.json
  def create
    @saving_product = SavingProduct.new(saving_product_params)

    respond_to do |format|
      if @saving_product.save
        format.html { redirect_to @saving_product, notice: 'Saving product was successfully created.' }
        format.json { render :show, status: :created, location: @saving_product }
      else
        @credit_unions = CreditUnion.all
        format.html { render :new }
        format.json { render json: @saving_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saving_products/1
  # PATCH/PUT /saving_products/1.json
  def update
    respond_to do |format|
      if @saving_product.update(saving_product_params)
        format.html { redirect_to @saving_product, notice: 'Saving product was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving_product }
      else
        format.html { render :edit }
        format.json { render json: @saving_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saving_products/1
  # DELETE /saving_products/1.json
  def destroy
    @saving_product.destroy
    respond_to do |format|
      format.html { redirect_to saving_products_url, notice: 'Saving product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving_product
      @saving_product = SavingProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_product_params
      params.require(:saving_product).permit(:full_name, :short_name, :interest_rate, :credit_union_id)
    end
end
