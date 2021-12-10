class MenusController < ApplicationController
  before_action :current_business_account_must_be_menu_menu_creators, only: [:edit, :update, :destroy] 

  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  def index
    @q = current_business_account.menus.ransack(params[:q])
    @menus = @q.result(:distinct => true).includes(:menu_creators, :recipe_menu_joins).page(params[:page]).per(10)
  end

  # GET /menus/1
  def show
    @recipe_menu_join = RecipeMenuJoin.new
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      message = 'Menu was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @menu, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /menus/1
  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /menus/1
  def destroy
    @menu.destroy
    message = "Menu was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to menus_url, notice: message
    end
  end


  private

  def current_business_account_must_be_menu_menu_creators
    set_menu
    unless current_business_account == @menu.menu_creators
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:menu_name, :menu_creator, :menu_description)
    end
end
