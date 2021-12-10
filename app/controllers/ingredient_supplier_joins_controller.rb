class IngredientSupplierJoinsController < ApplicationController
  before_action :set_ingredient_supplier_join,
                only: %i[show edit update destroy]

  # GET /ingredient_supplier_joins
  def index
    @q = IngredientSupplierJoin.ransack(params[:q])
    @ingredient_supplier_joins = @q.result(distinct: true).includes(
      :supplier, :ingredient, :ingredient_reviews
    ).page(params[:page]).per(10)
  end

  # GET /ingredient_supplier_joins/1
  def show
    @ingredient_review = IngredientReview.new
  end

  # GET /ingredient_supplier_joins/new
  def new
    @ingredient_supplier_join = IngredientSupplierJoin.new
  end

  # GET /ingredient_supplier_joins/1/edit
  def edit; end

  # POST /ingredient_supplier_joins
  def create
    @ingredient_supplier_join = IngredientSupplierJoin.new(ingredient_supplier_join_params)

    if @ingredient_supplier_join.save
      message = "IngredientSupplierJoin was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ingredient_supplier_join, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ingredient_supplier_joins/1
  def update
    if @ingredient_supplier_join.update(ingredient_supplier_join_params)
      redirect_to @ingredient_supplier_join,
                  notice: "Ingredient supplier join was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /ingredient_supplier_joins/1
  def destroy
    @ingredient_supplier_join.destroy
    message = "IngredientSupplierJoin was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ingredient_supplier_joins_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient_supplier_join
    @ingredient_supplier_join = IngredientSupplierJoin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ingredient_supplier_join_params
    params.require(:ingredient_supplier_join).permit(:ingredient_id,
                                                     :supplier_id, :preferred_supplier, :ingredient_cost, :average_lead_time_in_days, :ingredient_inventory)
  end
end
