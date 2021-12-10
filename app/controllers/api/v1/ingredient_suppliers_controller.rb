class Api::V1::IngredientSuppliersController < Api::V1::GraphitiController
  def index
    ingredient_suppliers = IngredientSupplierResource.all(params)
    respond_with(ingredient_suppliers)
  end

  def show
    ingredient_supplier = IngredientSupplierResource.find(params)
    respond_with(ingredient_supplier)
  end

  def create
    ingredient_supplier = IngredientSupplierResource.build(params)

    if ingredient_supplier.save
      render jsonapi: ingredient_supplier, status: 201
    else
      render jsonapi_errors: ingredient_supplier
    end
  end

  def update
    ingredient_supplier = IngredientSupplierResource.find(params)

    if ingredient_supplier.update_attributes
      render jsonapi: ingredient_supplier
    else
      render jsonapi_errors: ingredient_supplier
    end
  end

  def destroy
    ingredient_supplier = IngredientSupplierResource.find(params)

    if ingredient_supplier.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: ingredient_supplier
    end
  end
end
