class ShareStatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_share_statement, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /share_statements
  # GET /share_statements.json
  def index
    @share_statements = ShareStatement.all
  end

  # GET /share_statements/1
  # GET /share_statements/1.json
  def show
  end

  # GET /share_statements/new
  def new
    @share_statement = ShareStatement.new
    @share_accounts = ShareAccount.all
  end

  # GET /share_statements/1/edit
  def edit
    @share_accounts = ShareAccount.all
  end

  # POST /share_statements
  # POST /share_statements.json
  def create
    @share_statement = ShareStatement.new(share_statement_params)

    respond_to do |format|
      if @share_statement.save
        format.html { redirect_to @share_statement, notice: 'Share statement was successfully created.' }
        format.json { render :show, status: :created, location: @share_statement }
      else
        @share_accounts = ShareAccount.all
        format.html { render :new }
        format.json { render json: @share_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_statements/1
  # PATCH/PUT /share_statements/1.json
  def update
    respond_to do |format|
      if @share_statement.update(share_statement_params)
        format.html { redirect_to @share_statement, notice: 'Share statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_statement }
      else
        format.html { render :edit }
        format.json { render json: @share_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_statements/1
  # DELETE /share_statements/1.json
  def destroy
    @share_statement.destroy
    respond_to do |format|
      format.html { redirect_to share_statements_url, notice: 'Share statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_statement
      @share_statement = ShareStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_statement_params
      params.require(:share_statement).permit(:share_account_id, :is_debit, :amount, :balance_type_mask, :type_mask, :note)
    end
end
