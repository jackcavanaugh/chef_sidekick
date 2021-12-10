class Api::V1::SupplierReviewsController < Api::V1::GraphitiController
  def index
    supplier_reviews = SupplierReviewResource.all(params)
    respond_with(supplier_reviews)
  end

  def show
    supplier_review = SupplierReviewResource.find(params)
    respond_with(supplier_review)
  end

  def create
    supplier_review = SupplierReviewResource.build(params)

    if supplier_review.save
      render jsonapi: supplier_review, status: :created
    else
      render jsonapi_errors: supplier_review
    end
  end

  def update
    supplier_review = SupplierReviewResource.find(params)

    if supplier_review.update_attributes
      render jsonapi: supplier_review
    else
      render jsonapi_errors: supplier_review
    end
  end

  def destroy
    supplier_review = SupplierReviewResource.find(params)

    if supplier_review.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: supplier_review
    end
  end
end
