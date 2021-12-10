class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(:distinct => true).includes(:recipe_ingredient_joins, :ingredient_supplier_joins).page(params[:page]).per(10)
  end

  # GET /ingredients/1
  def show
    @ingredient_supplier_join = IngredientSupplierJoin.new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: 'Ingredient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:ingredient_name, :ingredient_description)
    end
end
