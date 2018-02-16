class CreditUnionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_credit_union, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /credit_unions
  # GET /credit_unions.json
  def index
    @credit_unions = CreditUnion.all
  end

  # GET /credit_unions/1
  # GET /credit_unions/1.json
  def show
  end

  # GET /credit_unions/new
  def new
    @credit_union = CreditUnion.new
  end

  # GET /credit_unions/1/edit
  def edit
  end

  # POST /credit_unions
  # POST /credit_unions.json
  def create
    @credit_union = CreditUnion.new(credit_union_params)

    respond_to do |format|
      if @credit_union.save
        format.html { redirect_to @credit_union, notice: 'Credit union was successfully created.' }
        format.json { render :show, status: :created, location: @credit_union }
      else
        format.html { render :new }
        format.json { render json: @credit_union.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_unions/1
  # PATCH/PUT /credit_unions/1.json
  def update
    respond_to do |format|
      if @credit_union.update(credit_union_params)
        format.html { redirect_to @credit_union, notice: 'Credit union was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_union }
      else
        format.html { render :edit }
        format.json { render json: @credit_union.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_unions/1
  # DELETE /credit_unions/1.json
  def destroy
    @credit_union.destroy
    respond_to do |format|
      format.html { redirect_to credit_unions_url, notice: 'Credit union was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_union
      @credit_union = CreditUnion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_union_params
      params.require(:credit_union).permit(:full_name, :short_name)
    end
end
