class BusinessAccountsController < ApplicationController
  before_action :set_business_account, only: %i[show edit update destroy]

  # GET /business_accounts
  def index
    @business_accounts = BusinessAccount.page(params[:page]).per(10)
  end

  # GET /business_accounts/1
  def show
    @menu = Menu.new
    @ingredient_review = IngredientReview.new
    @supplier_review = SupplierReview.new
    @recipe = Recipe.new
  end

  # GET /business_accounts/new
  def new
    @business_account = BusinessAccount.new
  end

  # GET /business_accounts/1/edit
  def edit; end

  # POST /business_accounts
  def create
    @business_account = BusinessAccount.new(business_account_params)

    if @business_account.save
      redirect_to @business_account,
                  notice: "Business account was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /business_accounts/1
  def update
    if @business_account.update(business_account_params)
      redirect_to @business_account,
                  notice: "Business account was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /business_accounts/1
  def destroy
    @business_account.destroy
    redirect_to business_accounts_url,
                notice: "Business account was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_business_account
    @business_account = BusinessAccount.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def business_account_params
    params.require(:business_account).permit(:business_name)
  end
end
