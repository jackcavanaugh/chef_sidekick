class SupplierReviewsController < ApplicationController
  before_action :set_supplier_review, only: [:show, :edit, :update, :destroy]

  # GET /supplier_reviews
  def index
    @supplier_reviews = SupplierReview.all
  end

  # GET /supplier_reviews/1
  def show
  end

  # GET /supplier_reviews/new
  def new
    @supplier_review = SupplierReview.new
  end

  # GET /supplier_reviews/1/edit
  def edit
  end

  # POST /supplier_reviews
  def create
    @supplier_review = SupplierReview.new(supplier_review_params)

    if @supplier_review.save
      redirect_to @supplier_review, notice: 'Supplier review was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /supplier_reviews/1
  def update
    if @supplier_review.update(supplier_review_params)
      redirect_to @supplier_review, notice: 'Supplier review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /supplier_reviews/1
  def destroy
    @supplier_review.destroy
    redirect_to supplier_reviews_url, notice: 'Supplier review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_review
      @supplier_review = SupplierReview.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_review_params
      params.require(:supplier_review).permit(:reviewer, :supplier_id, :review_title, :review_rating, :review_content)
    end
end
