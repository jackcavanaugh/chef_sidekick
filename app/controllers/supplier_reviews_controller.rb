class SupplierReviewsController < ApplicationController
  before_action :set_supplier_review, only: %i[show edit update destroy]

  def index
    @q = SupplierReview.ransack(params[:q])
    @supplier_reviews = @q.result(distinct: true).includes(:chef_reviewer,
                                                           :supplier).page(params[:page]).per(10)
  end

  def show; end

  def new
    @supplier_review = SupplierReview.new
  end

  def edit; end

  def create
    @supplier_review = SupplierReview.new(supplier_review_params)

    if @supplier_review.save
      message = "SupplierReview was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @supplier_review, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @supplier_review.update(supplier_review_params)
      redirect_to @supplier_review,
                  notice: "Supplier review was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @supplier_review.destroy
    message = "SupplierReview was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to supplier_reviews_url, notice: message
    end
  end

  private

  def set_supplier_review
    @supplier_review = SupplierReview.find(params[:id])
  end

  def supplier_review_params
    params.require(:supplier_review).permit(:reviewer, :supplier_id,
                                            :review_title, :review_rating, :review_content)
  end
end
