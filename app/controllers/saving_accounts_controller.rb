class SavingAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saving_account, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /saving_accounts
  # GET /saving_accounts.json
  def index
    @saving_accounts = SavingAccount.all
  end

  # GET /saving_accounts/1
  # GET /saving_accounts/1.json
  def show
  end

  # GET /saving_accounts/new
  def new
    @saving_account = SavingAccount.new
    @saving_products = SavingProduct.all
    @members = Member.all
  end

  # GET /saving_accounts/1/edit
  def edit
    @saving_products = SavingProduct.all
    @members = Member.all
  end

  # POST /saving_accounts
  # POST /saving_accounts.json
  def create
    @saving_account = SavingAccount.new(saving_account_params)

    respond_to do |format|
      if @saving_account.save
        format.html { redirect_to @saving_account, notice: 'Saving account was successfully created.' }
        format.json { render :show, status: :created, location: @saving_account }
      else
        @saving_products = SavingProduct.all
        @members = Member.all
        format.html { render :new }
        format.json { render json: @saving_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saving_accounts/1
  # PATCH/PUT /saving_accounts/1.json
  def update
    respond_to do |format|
      if @saving_account.update(saving_account_params)
        format.html { redirect_to @saving_account, notice: 'Saving account was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving_account }
      else
        format.html { render :edit }
        format.json { render json: @saving_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saving_accounts/1
  # DELETE /saving_accounts/1.json
  def destroy
    @saving_account.destroy
    respond_to do |format|
      format.html { redirect_to saving_accounts_url, notice: 'Saving account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving_account
      @saving_account = SavingAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_account_params
      params.require(:saving_account).permit(:number, :interest_rate, :saving_product_id, :member_id)
    end
end
