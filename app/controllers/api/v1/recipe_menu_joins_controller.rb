class Api::V1::RecipeMenuJoinsController < Api::V1::GraphitiController
  def index
    recipe_menu_joins = RecipeMenuJoinResource.all(params)
    respond_with(recipe_menu_joins)
  end

  def show
    recipe_menu_join = RecipeMenuJoinResource.find(params)
    respond_with(recipe_menu_join)
  end

  def create
    recipe_menu_join = RecipeMenuJoinResource.build(params)

    if recipe_menu_join.save
      render jsonapi: recipe_menu_join, status: 201
    else
      render jsonapi_errors: recipe_menu_join
    end
  end

  def update
    recipe_menu_join = RecipeMenuJoinResource.find(params)

    if recipe_menu_join.update_attributes
      render jsonapi: recipe_menu_join
    else
      render jsonapi_errors: recipe_menu_join
    end
  end

  def destroy
    recipe_menu_join = RecipeMenuJoinResource.find(params)

    if recipe_menu_join.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: recipe_menu_join
    end
  end
end
