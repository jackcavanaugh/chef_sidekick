class BusinessAccountsController < ApplicationController
  before_action :set_business_account, only: %i[show edit update destroy]

  def index
    @business_accounts = BusinessAccount.page(params[:page]).per(10)
  end

  def show
    @menu = Menu.new
    @ingredient_review = IngredientReview.new
    @supplier_review = SupplierReview.new
    @recipe = Recipe.new
  end

  def new
    @business_account = BusinessAccount.new
  end

  def edit; end

  def create
    @business_account = BusinessAccount.new(business_account_params)

    if @business_account.save
      redirect_to @business_account,
                  notice: "Business account was successfully created."
    else
      render :new
    end
  end

  def update
    if @business_account.update(business_account_params)
      redirect_to @business_account,
                  notice: "Business account was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @business_account.destroy
    redirect_to business_accounts_url,
                notice: "Business account was successfully destroyed."
  end

  private

  def set_business_account
    @business_account = BusinessAccount.find(params[:id])
  end

  def business_account_params
    params.require(:business_account).permit(:business_name)
  end
end
