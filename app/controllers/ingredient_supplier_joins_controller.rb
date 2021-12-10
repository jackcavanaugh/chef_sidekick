class IngredientSupplierJoinsController < ApplicationController
  before_action :set_ingredient_supplier_join, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_supplier_joins
  def index
    @ingredient_supplier_joins = IngredientSupplierJoin.all
  end

  # GET /ingredient_supplier_joins/1
  def show
  end

  # GET /ingredient_supplier_joins/new
  def new
    @ingredient_supplier_join = IngredientSupplierJoin.new
  end

  # GET /ingredient_supplier_joins/1/edit
  def edit
  end

  # POST /ingredient_supplier_joins
  def create
    @ingredient_supplier_join = IngredientSupplierJoin.new(ingredient_supplier_join_params)

    if @ingredient_supplier_join.save
      redirect_to @ingredient_supplier_join, notice: 'Ingredient supplier join was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredient_supplier_joins/1
  def update
    if @ingredient_supplier_join.update(ingredient_supplier_join_params)
      redirect_to @ingredient_supplier_join, notice: 'Ingredient supplier join was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredient_supplier_joins/1
  def destroy
    @ingredient_supplier_join.destroy
    redirect_to ingredient_supplier_joins_url, notice: 'Ingredient supplier join was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_supplier_join
      @ingredient_supplier_join = IngredientSupplierJoin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_supplier_join_params
      params.require(:ingredient_supplier_join).permit(:ingredient_id, :supplier_id, :preferred_supplier, :ingredient_cost, :average_lead_time_in_days, :ingredient_inventory)
    end
end
