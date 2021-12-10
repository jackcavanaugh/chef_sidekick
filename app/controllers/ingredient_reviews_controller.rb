class IngredientReviewsController < ApplicationController
  before_action :set_ingredient_review, only: %i[show edit update destroy]

  def index
    @q = IngredientReview.ransack(params[:q])
    @ingredient_reviews = @q.result(distinct: true).includes(
      :ingredient_reviewers, :ingredient_supplier_join
    ).page(params[:page]).per(10)
  end

  def show; end

  def new
    @ingredient_review = IngredientReview.new
  end

  def edit; end

  def create
    @ingredient_review = IngredientReview.new(ingredient_review_params)

    if @ingredient_review.save
      message = "IngredientReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ingredient_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @ingredient_review.update(ingredient_review_params)
      redirect_to @ingredient_review,
                  notice: "Ingredient review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ingredient_review.destroy
    message = "IngredientReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ingredient_reviews_url, notice: message
    end
  end

  private

  def set_ingredient_review
    @ingredient_review = IngredientReview.find(params[:id])
  end

  def ingredient_review_params
    params.require(:ingredient_review).permit(:ingredient_reviewer,
                                              :ingredient_supplier_join_id, :ingredient_supplier_rating, :ingredient_supplier_review_description)
  end
end
