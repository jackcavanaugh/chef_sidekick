class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(distinct: true).includes(
      :recipe_ingredient_joins, :ingredient_supplier_joins
    ).page(params[:page]).per(10)
  end

  def show
    @ingredient_supplier_join = IngredientSupplierJoin.new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit; end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: "Ingredient was successfully created."
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: "Ingredient was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url,
                notice: "Ingredient was successfully destroyed."
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_name,
                                       :ingredient_description)
  end
end
