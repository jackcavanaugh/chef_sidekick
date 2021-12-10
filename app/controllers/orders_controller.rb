class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true).includes(:recipe).page(params[:page]).per(10)
  end

  def show; end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new(order_params)

    if @order.save
      message = "Order was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @order, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    message = "Order was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to orders_url, notice: message
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:recipe_id, :customer_comments)
  end
end
