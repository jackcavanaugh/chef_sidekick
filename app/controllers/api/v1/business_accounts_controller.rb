class Api::V1::BusinessAccountsController < Api::V1::GraphitiController
  def index
    business_accounts = BusinessAccountResource.all(params)
    respond_with(business_accounts)
  end

  def show
    business_account = BusinessAccountResource.find(params)
    respond_with(business_account)
  end

  def create
    business_account = BusinessAccountResource.build(params)

    if business_account.save
      render jsonapi: business_account, status: 201
    else
      render jsonapi_errors: business_account
    end
  end

  def update
    business_account = BusinessAccountResource.find(params)

    if business_account.update_attributes
      render jsonapi: business_account
    else
      render jsonapi_errors: business_account
    end
  end

  def destroy
    business_account = BusinessAccountResource.find(params)

    if business_account.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: business_account
    end
  end
end
