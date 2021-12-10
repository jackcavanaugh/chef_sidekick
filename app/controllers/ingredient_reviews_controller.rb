class IngredientReviewsController < ApplicationController
  before_action :set_ingredient_review, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_reviews
  def index
    @ingredient_reviews = IngredientReview.all
  end

  # GET /ingredient_reviews/1
  def show
  end

  # GET /ingredient_reviews/new
  def new
    @ingredient_review = IngredientReview.new
  end

  # GET /ingredient_reviews/1/edit
  def edit
  end

  # POST /ingredient_reviews
  def create
    @ingredient_review = IngredientReview.new(ingredient_review_params)

    if @ingredient_review.save
      redirect_to @ingredient_review, notice: 'Ingredient review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredient_reviews/1
  def update
    if @ingredient_review.update(ingredient_review_params)
      redirect_to @ingredient_review, notice: 'Ingredient review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredient_reviews/1
  def destroy
    @ingredient_review.destroy
    redirect_to ingredient_reviews_url, notice: 'Ingredient review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_review
      @ingredient_review = IngredientReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_review_params
      params.require(:ingredient_review).permit(:ingredient_reviewer, :ingredient_supplier_join_id, :ingredient_supplier_rating, :ingredient_supplier_review_description)
    end
end