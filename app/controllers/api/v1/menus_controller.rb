class Api::V1::MenusController < Api::V1::GraphitiController
  def index
    menus = MenuResource.all(params)
    respond_with(menus)
  end

  def show
    menu = MenuResource.find(params)
    respond_with(menu)
  end

  def create
    menu = MenuResource.build(params)

    if menu.save
      render jsonapi: menu, status: :created
    else
      render jsonapi_errors: menu
    end
  end

  def update
    menu = MenuResource.find(params)

    if menu.update_attributes
      render jsonapi: menu
    else
      render jsonapi_errors: menu
    end
  end

  def destroy
    menu = MenuResource.find(params)

    if menu.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: menu
    end
  end
end
