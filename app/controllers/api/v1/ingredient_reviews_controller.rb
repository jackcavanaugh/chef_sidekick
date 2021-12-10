class Api::V1::IngredientReviewsController < Api::V1::GraphitiController
  def index
    ingredient_reviews = IngredientReviewResource.all(params)
    respond_with(ingredient_reviews)
  end

  def show
    ingredient_review = IngredientReviewResource.find(params)
    respond_with(ingredient_review)
  end

  def create
    ingredient_review = IngredientReviewResource.build(params)

    if ingredient_review.save
      render jsonapi: ingredient_review, status: :created
    else
      render jsonapi_errors: ingredient_review
    end
  end

  def update
    ingredient_review = IngredientReviewResource.find(params)

    if ingredient_review.update_attributes
      render jsonapi: ingredient_review
    else
      render jsonapi_errors: ingredient_review
    end
  end

  def destroy
    ingredient_review = IngredientReviewResource.find(params)

    if ingredient_review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: ingredient_review
    end
  end
end
