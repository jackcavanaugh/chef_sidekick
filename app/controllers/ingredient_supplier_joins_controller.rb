class IngredientSupplierJoinsController < ApplicationController
  before_action :set_ingredient_supplier_join,
                only: %i[show edit update destroy]

  def index
    @q = IngredientSupplierJoin.ransack(params[:q])
    @ingredient_supplier_joins = @q.result(distinct: true).includes(
      :supplier, :ingredient, :ingredient_reviews
    ).page(params[:page]).per(10)
  end

  def show
    @ingredient_review = IngredientReview.new
  end

  def new
    @ingredient_supplier_join = IngredientSupplierJoin.new
  end

  def edit; end

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

  def update
    if @ingredient_supplier_join.update(ingredient_supplier_join_params)
      redirect_to @ingredient_supplier_join,
                  notice: "Ingredient supplier join was successfully updated."
    else
      render :edit
    end
  end

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

  def set_ingredient_supplier_join
    @ingredient_supplier_join = IngredientSupplierJoin.find(params[:id])
  end

  def ingredient_supplier_join_params
    params.require(:ingredient_supplier_join).permit(:ingredient_id,
                                                     :supplier_id, :preferred_supplier, :ingredient_cost, :average_lead_time_in_days, :ingredient_inventory)
  end
end
