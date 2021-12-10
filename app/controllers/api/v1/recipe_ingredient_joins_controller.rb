class Api::V1::RecipeIngredientJoinsController < Api::V1::GraphitiController
  def index
    recipe_ingredient_joins = RecipeIngredientJoinResource.all(params)
    respond_with(recipe_ingredient_joins)
  end

  def show
    recipe_ingredient_join = RecipeIngredientJoinResource.find(params)
    respond_with(recipe_ingredient_join)
  end

  def create
    recipe_ingredient_join = RecipeIngredientJoinResource.build(params)

    if recipe_ingredient_join.save
      render jsonapi: recipe_ingredient_join, status: :created
    else
      render jsonapi_errors: recipe_ingredient_join
    end
  end

  def update
    recipe_ingredient_join = RecipeIngredientJoinResource.find(params)

    if recipe_ingredient_join.update_attributes
      render jsonapi: recipe_ingredient_join
    else
      render jsonapi_errors: recipe_ingredient_join
    end
  end

  def destroy
    recipe_ingredient_join = RecipeIngredientJoinResource.find(params)

    if recipe_ingredient_join.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: recipe_ingredient_join
    end
  end
end
