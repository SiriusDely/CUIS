class SavingStatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saving_statement, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /saving_statements
  # GET /saving_statements.json
  def index
    @saving_statements = SavingStatement.all
  end

  # GET /saving_statements/1
  # GET /saving_statements/1.json
  def show
  end

  # GET /saving_statements/new
  def new
    @saving_statement = SavingStatement.new
    @saving_accounts = SavingAccount.all
  end

  # GET /saving_statements/1/edit
  def edit
    @saving_accounts = SavingAccount.all
  end

  # POST /saving_statements
  # POST /saving_statements.json
  def create
    @saving_statement = SavingStatement.new(saving_statement_params)

    respond_to do |format|
      if @saving_statement.save
        format.html { redirect_to @saving_statement, notice: 'Saving statement was successfully created.' }
        format.json { render :show, status: :created, location: @saving_statement }
      else
        @saving_accounts = SavingAccount.all
        format.html { render :new }
        format.json { render json: @saving_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saving_statements/1
  # PATCH/PUT /saving_statements/1.json
  def update
    respond_to do |format|
      if @saving_statement.update(saving_statement_params)
        format.html { redirect_to @saving_statement, notice: 'Saving statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving_statement }
      else
        format.html { render :edit }
        format.json { render json: @saving_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saving_statements/1
  # DELETE /saving_statements/1.json
  def destroy
    @saving_statement.destroy
    respond_to do |format|
      format.html { redirect_to saving_statements_url, notice: 'Saving statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving_statement
      @saving_statement = SavingStatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_statement_params
      params.require(:saving_statement).permit(:amount, :type_mask, :note, :saving_account_id, :is_debit)
    end
end
