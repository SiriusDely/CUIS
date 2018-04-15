class CheckingProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checking_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /checking_products
  # GET /checking_products.json
  def index
    @checking_products = CheckingProduct.all
  end

  # GET /checking_products/1
  # GET /checking_products/1.json
  def show
  end

  # GET /checking_products/new
  def new
    @checking_product = CheckingProduct.new
    @credit_unions = CreditUnion.all
  end

  # GET /checking_products/1/edit
  def edit
    @credit_unions = CreditUnion.all
  end

  # POST /checking_products
  # POST /checking_products.json
  def create
    @checking_product = CheckingProduct.new(checking_product_params)

    respond_to do |format|
      if @checking_product.save
        format.html { redirect_to @checking_product, notice: 'Checking product was successfully created.' }
        format.json { render :show, status: :created, location: @checking_product }
      else
        @credit_unions = CreditUnion.all
        format.html { render :new }
        format.json { render json: @checking_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checking_products/1
  # PATCH/PUT /checking_products/1.json
  def update
    respond_to do |format|
      if @checking_product.update(checking_product_params)
        format.html { redirect_to @checking_product, notice: 'Checking product was successfully updated.' }
        format.json { render :show, status: :ok, location: @checking_product }
      else
        format.html { render :edit }
        format.json { render json: @checking_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checking_products/1
  # DELETE /checking_products/1.json
  def destroy
    @checking_product.destroy
    respond_to do |format|
      format.html { redirect_to checking_products_url, notice: 'Checking product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checking_product
      @checking_product = CheckingProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checking_product_params
      params.require(:checking_product).permit(:full_name, :short_name, :interest_rate, :credit_union_id)
    end
end
