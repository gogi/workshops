class ProductsController < ApplicationController
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user_id = current_user.id

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if current_user.id == product.user_id
      if self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
        render action: 'edit'
      end
    else
      redirect_to category_product_url(category, product), notice: "You are not allowed to update product #{product.title}."
    end
  end

  # DELETE /products/1
  def destroy
    if current_user.id == product.user_id
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    else
      redirect_to category_product_url(category, product), notice: "You are not allowed to destroy product #{product.title}."
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, :user_id)
  end
end
