class ShareProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_share_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /share_products
  # GET /share_products.json
  def index
    @share_products = ShareProduct.all
  end

  # GET /share_products/1
  # GET /share_products/1.json
  def show
  end

  # GET /share_products/new
  def new
    @share_product = ShareProduct.new
    @credit_unions = CreditUnion.all
  end

  # GET /share_products/1/edit
  def edit
    @credit_unions = CreditUnion.all
  end

  # POST /share_products
  # POST /share_products.json
  def create
    @share_product = ShareProduct.new(share_product_params)

    respond_to do |format|
      if @share_product.save
        format.html { redirect_to @share_product, notice: 'Share product was successfully created.' }
        format.json { render :show, status: :created, location: @share_product }
      else
        @credit_unions = CreditUnion.all
        format.html { render :new }
        format.json { render json: @share_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_products/1
  # PATCH/PUT /share_products/1.json
  def update
    respond_to do |format|
      if @share_product.update(share_product_params)
        format.html { redirect_to @share_product, notice: 'Share product was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_product }
      else
        format.html { render :edit }
        format.json { render json: @share_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_products/1
  # DELETE /share_products/1.json
  def destroy
    @share_product.destroy
    respond_to do |format|
      format.html { redirect_to share_products_url, notice: 'Share product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_product
      @share_product = ShareProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_product_params
      params.require(:share_product).permit(:full_name, :short_name, :primary_deposit, :credit_union_id)
    end
end
