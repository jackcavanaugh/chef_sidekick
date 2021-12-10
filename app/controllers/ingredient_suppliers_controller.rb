class IngredientSuppliersController < ApplicationController
  before_action :set_ingredient_supplier,
                only: %i[show edit update destroy]

  # GET /ingredient_suppliers
  def index
    @q = IngredientSupplier.ransack(params[:q])
    @ingredient_suppliers = @q.result(distinct: true).includes(
      :ingredient_supplier_joins, :supplier_reviews
    ).page(params[:page]).per(10)
  end

  # GET /ingredient_suppliers/1
  def show
    @supplier_review = SupplierReview.new
    @ingredient_supplier_join = IngredientSupplierJoin.new
  end

  # GET /ingredient_suppliers/new
  def new
    @ingredient_supplier = IngredientSupplier.new
  end

  # GET /ingredient_suppliers/1/edit
  def edit; end

  # POST /ingredient_suppliers
  def create
    @ingredient_supplier = IngredientSupplier.new(ingredient_supplier_params)

    if @ingredient_supplier.save
      redirect_to @ingredient_supplier,
                  notice: "Ingredient supplier was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /ingredient_suppliers/1
  def update
    if @ingredient_supplier.update(ingredient_supplier_params)
      redirect_to @ingredient_supplier,
                  notice: "Ingredient supplier was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /ingredient_suppliers/1
  def destroy
    @ingredient_supplier.destroy
    redirect_to ingredient_suppliers_url,
                notice: "Ingredient supplier was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient_supplier
    @ingredient_supplier = IngredientSupplier.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def ingredient_supplier_params
    params.require(:ingredient_supplier).permit(:supplier_name,
                                                :supplier_description, :supplier_location)
  end
end
