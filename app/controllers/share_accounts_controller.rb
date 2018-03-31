class ShareAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_share_account, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /share_accounts
  # GET /share_accounts.json
  def index
    @share_accounts = ShareAccount.all
  end

  # GET /share_accounts/1
  # GET /share_accounts/1.json
  def show
  end

  # GET /share_accounts/new
  def new
    @share_account = ShareAccount.new
    @share_products = ShareProduct.all
    @members = Member.all
  end

  # GET /share_accounts/1/edit
  def edit
    @share_products = ShareProduct.all
    @members = Member.all
  end

  # POST /share_accounts
  # POST /share_accounts.json
  def create
    @share_account = ShareAccount.new(share_account_params)

    respond_to do |format|
      if @share_account.save
        format.html { redirect_to @share_account, notice: 'Share account was successfully created.' }
        format.json { render :show, status: :created, location: @share_account }
      else
        @share_products = ShareProduct.all
        @members = Member.all
        format.html { render :new }
        format.json { render json: @share_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_accounts/1
  # PATCH/PUT /share_accounts/1.json
  def update
    respond_to do |format|
      if @share_account.update(share_account_params)
        format.html { redirect_to @share_account, notice: 'Share account was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_account }
      else
        format.html { render :edit }
        format.json { render json: @share_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_accounts/1
  # DELETE /share_accounts/1.json
  def destroy
    @share_account.destroy
    respond_to do |format|
      format.html { redirect_to share_accounts_url, notice: 'Share account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_account
      @share_account = ShareAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_account_params
      params.require(:share_account).permit(:number, :primary_balance, :compulsory_balance, :voluntary_balance, :total_balance, :share_product_id, :member_id)
    end
end
