class RecipeIngredientJoinsController < ApplicationController
  before_action :set_recipe_ingredient_join, only: [:show, :edit, :update, :destroy]

  # GET /recipe_ingredient_joins
  def index
    @recipe_ingredient_joins = RecipeIngredientJoin.all
  end

  # GET /recipe_ingredient_joins/1
  def show
  end

  # GET /recipe_ingredient_joins/new
  def new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  # GET /recipe_ingredient_joins/1/edit
  def edit
  end

  # POST /recipe_ingredient_joins
  def create
    @recipe_ingredient_join = RecipeIngredientJoin.new(recipe_ingredient_join_params)

    if @recipe_ingredient_join.save
      redirect_to @recipe_ingredient_join, notice: 'Recipe ingredient join was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_ingredient_joins/1
  def update
    if @recipe_ingredient_join.update(recipe_ingredient_join_params)
      redirect_to @recipe_ingredient_join, notice: 'Recipe ingredient join was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipe_ingredient_joins/1
  def destroy
    @recipe_ingredient_join.destroy
    redirect_to recipe_ingredient_joins_url, notice: 'Recipe ingredient join was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_ingredient_join
      @recipe_ingredient_join = RecipeIngredientJoin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_ingredient_join_params
      params.require(:recipe_ingredient_join).permit(:recipe_id, :ingredient_id)
    end
end