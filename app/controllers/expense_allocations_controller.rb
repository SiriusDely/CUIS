# frozen_string_literal: true

class ExpenseAllocationsController < ApplicationController
  before_action :set_expense_allocation, only: %i[show edit update destroy]

  # GET /expense_allocations
  # GET /expense_allocations.json
  def index
    @expense_allocations = ExpenseAllocation.all
  end

  # GET /expense_allocations/1
  # GET /expense_allocations/1.json
  def show; end

  # GET /expense_allocations/new
  def new
    @expense_allocation = ExpenseAllocation.new
  end

  # GET /expense_allocations/1/edit
  def edit; end

  # POST /expense_allocations
  # POST /expense_allocations.json
  def create
    @expense_allocation = ExpenseAllocation.new(expense_allocation_params)

    respond_to do |format|
      if @expense_allocation.save
        format.html { redirect_to @expense_allocation, notice: 'Expense allocation was successfully created.' }
        format.json { render :show, status: :created, location: @expense_allocation }
      else
        format.html { render :new }
        format.json { render json: @expense_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_allocations/1
  # PATCH/PUT /expense_allocations/1.json
  def update
    respond_to do |format|
      if @expense_allocation.update(expense_allocation_params)
        format.html { redirect_to @expense_allocation, notice: 'Expense allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_allocation }
      else
        format.html { render :edit }
        format.json { render json: @expense_allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_allocations/1
  # DELETE /expense_allocations/1.json
  def destroy
    @expense_allocation.destroy
    respond_to do |format|
      format.html { redirect_to expense_allocations_url, notice: 'Expense allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense_allocation
    @expense_allocation = ExpenseAllocation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_allocation_params
    params.require(:expense_allocation).permit(:full_name, :short_name, :credit_union_id)
  end
end
