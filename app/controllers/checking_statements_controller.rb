# frozen_string_literal: true

class CheckingStatementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checking_statement, only: %i[show edit update destroy]

  load_and_authorize_resource

  # GET /checking_statements
  # GET /checking_statements.json
  def index
    @checking_statements = CheckingStatement.all
  end

  # GET /checking_statements/1
  # GET /checking_statements/1.json
  def show; end

  # GET /checking_statements/new
  def new
    @checking_statement = CheckingStatement.new
    @checking_accounts = CheckingAccount.all
  end

  # GET /checking_statements/1/edit
  def edit
    @checking_accounts = CheckingAccount.all
  end

  # POST /checking_statements
  # POST /checking_statements.json
  def create
    @checking_statement = CheckingStatement.new(checking_statement_params)

    respond_to do |format|
      if @checking_statement.save
        format.html { redirect_to @checking_statement, notice: 'Checking statement was successfully created.' }
        format.json { render :show, status: :created, location: @checking_statement }
      else
        @checking_accounts = CheckingAccount.all
        format.html { render :new }
        format.json { render json: @checking_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checking_statements/1
  # PATCH/PUT /checking_statements/1.json
  def update
    respond_to do |format|
      if @checking_statement.update(checking_statement_params)
        format.html { redirect_to @checking_statement, notice: 'Checking statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @checking_statement }
      else
        format.html { render :edit }
        format.json { render json: @checking_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checking_statements/1
  # DELETE /checking_statements/1.json
  def destroy
    @checking_statement.destroy
    respond_to do |format|
      format.html { redirect_to checking_statements_url, notice: 'Checking statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_checking_statement
    @checking_statement = CheckingStatement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def checking_statement_params
    params.require(:checking_statement).permit(:amount, :statement_type, :note, :checking_account_id, :is_debit)
  end
end
