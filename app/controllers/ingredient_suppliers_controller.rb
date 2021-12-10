class IngredientSuppliersController < ApplicationController
  before_action :set_ingredient_supplier,
                only: %i[show edit update destroy]

  def index
    @q = IngredientSupplier.ransack(params[:q])
    @ingredient_suppliers = @q.result(distinct: true).includes(
      :ingredient_supplier_joins, :supplier_reviews
    ).page(params[:page]).per(10)
  end

  def show
    @supplier_review = SupplierReview.new
    @ingredient_supplier_join = IngredientSupplierJoin.new
  end

  def new
    @ingredient_supplier = IngredientSupplier.new
  end

  def edit; end

  def create
    @ingredient_supplier = IngredientSupplier.new(ingredient_supplier_params)

    if @ingredient_supplier.save
      redirect_to @ingredient_supplier,
                  notice: "Ingredient supplier was successfully created."
    else
      render :new
    end
  end

  def update
    if @ingredient_supplier.update(ingredient_supplier_params)
      redirect_to @ingredient_supplier,
                  notice: "Ingredient supplier was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ingredient_supplier.destroy
    redirect_to ingredient_suppliers_url,
                notice: "Ingredient supplier was successfully destroyed."
  end

  private

  def set_ingredient_supplier
    @ingredient_supplier = IngredientSupplier.find(params[:id])
  end

  def ingredient_supplier_params
    params.require(:ingredient_supplier).permit(:supplier_name,
                                                :supplier_description, :supplier_location)
  end
end
