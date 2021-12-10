class Api::V1::IngredientSupplierJoinsController < Api::V1::GraphitiController
  def index
    ingredient_supplier_joins = IngredientSupplierJoinResource.all(params)
    respond_with(ingredient_supplier_joins)
  end

  def show
    ingredient_supplier_join = IngredientSupplierJoinResource.find(params)
    respond_with(ingredient_supplier_join)
  end

  def create
    ingredient_supplier_join = IngredientSupplierJoinResource.build(params)

    if ingredient_supplier_join.save
      render jsonapi: ingredient_supplier_join, status: :created
    else
      render jsonapi_errors: ingredient_supplier_join
    end
  end

  def update
    ingredient_supplier_join = IngredientSupplierJoinResource.find(params)

    if ingredient_supplier_join.update_attributes
      render jsonapi: ingredient_supplier_join
    else
      render jsonapi_errors: ingredient_supplier_join
    end
  end

  def destroy
    ingredient_supplier_join = IngredientSupplierJoinResource.find(params)

    if ingredient_supplier_join.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: ingredient_supplier_join
    end
  end
end
