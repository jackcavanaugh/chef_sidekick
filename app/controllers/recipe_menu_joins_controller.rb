class RecipeMenuJoinsController < ApplicationController
  before_action :set_recipe_menu_join, only: %i[show edit update destroy]

  def index
    @q = RecipeMenuJoin.ransack(params[:q])
    @recipe_menu_joins = @q.result(distinct: true).includes(:recipe,
                                                            :menu).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recipe_menu_join = RecipeMenuJoin.new
  end

  def edit; end

  def create
    @recipe_menu_join = RecipeMenuJoin.new(recipe_menu_join_params)

    if @recipe_menu_join.save
      message = "RecipeMenuJoin was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe_menu_join, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe_menu_join.update(recipe_menu_join_params)
      redirect_to @recipe_menu_join,
                  notice: "Recipe menu join was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_menu_join.destroy
    message = "RecipeMenuJoin was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipe_menu_joins_url, notice: message
    end
  end

  private

  def set_recipe_menu_join
    @recipe_menu_join = RecipeMenuJoin.find(params[:id])
  end

  def recipe_menu_join_params
    params.require(:recipe_menu_join).permit(:menu_id, :recipe_id)
  end
end
