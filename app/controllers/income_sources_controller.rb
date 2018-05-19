# frozen_string_literal: true

class IncomeSourcesController < ApplicationController
  before_action :set_income_source, only: %i[show edit update destroy]

  # GET /income_sources
  # GET /income_sources.json
  def index
    @income_sources = IncomeSource.all
  end

  # GET /income_sources/1
  # GET /income_sources/1.json
  def show; end

  # GET /income_sources/new
  def new
    @income_source = IncomeSource.new
  end

  # GET /income_sources/1/edit
  def edit; end

  # POST /income_sources
  # POST /income_sources.json
  def create
    @income_source = IncomeSource.new(income_source_params)

    respond_to do |format|
      if @income_source.save
        format.html { redirect_to @income_source, notice: 'Income source was successfully created.' }
        format.json { render :show, status: :created, location: @income_source }
      else
        format.html { render :new }
        format.json { render json: @income_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_sources/1
  # PATCH/PUT /income_sources/1.json
  def update
    respond_to do |format|
      if @income_source.update(income_source_params)
        format.html { redirect_to @income_source, notice: 'Income source was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_source }
      else
        format.html { render :edit }
        format.json { render json: @income_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_sources/1
  # DELETE /income_sources/1.json
  def destroy
    @income_source.destroy
    respond_to do |format|
      format.html { redirect_to income_sources_url, notice: 'Income source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income_source
    @income_source = IncomeSource.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def income_source_params
    params.require(:income_source).permit(:full_name, :short_name, :credit_union_id)
  end
end
