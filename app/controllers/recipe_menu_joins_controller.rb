class RecipeMenuJoinsController < ApplicationController
  before_action :set_recipe_menu_join, only: [:show, :edit, :update, :destroy]

  # GET /recipe_menu_joins
  def index
    @recipe_menu_joins = RecipeMenuJoin.all
  end

  # GET /recipe_menu_joins/1
  def show
  end

  # GET /recipe_menu_joins/new
  def new
    @recipe_menu_join = RecipeMenuJoin.new
  end

  # GET /recipe_menu_joins/1/edit
  def edit
  end

  # POST /recipe_menu_joins
  def create
    @recipe_menu_join = RecipeMenuJoin.new(recipe_menu_join_params)

    if @recipe_menu_join.save
      message = 'RecipeMenuJoin was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @recipe_menu_join, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_menu_joins/1
  def update
    if @recipe_menu_join.update(recipe_menu_join_params)
      redirect_to @recipe_menu_join, notice: 'Recipe menu join was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipe_menu_joins/1
  def destroy
    @recipe_menu_join.destroy
    message = "RecipeMenuJoin was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to recipe_menu_joins_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_menu_join
      @recipe_menu_join = RecipeMenuJoin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_menu_join_params
      params.require(:recipe_menu_join).permit(:menu_id, :recipe_id)
    end
end
