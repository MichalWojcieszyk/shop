class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :author, only: [:edit, :update, :destroy]
  
  expose(:category)
  expose(:product)
  expose(:review) { Review.new }
  expose(:payment) { Payment.new }
  expose_decorated(:reviews, ancestor: :product)
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 10).order(cached_votes_score: :desc)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user_id = current_user.id if current_user
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end  
  end

  def destroy
    product.destroy
    redirect_to products_path, notice: 'Product was successfully destroyed.'
  end

  def upvote
    product.upvote_from current_user
    redirect_to products_path
  end

  def downvote
    product.downvote_from current_user
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id, :user_id)
  end

  # def author
  #   unless product.user == current_user
  #     redirect_to category_product_url(category, product),
  #     flash: { error: 'You are not allowed to edit this product.' }
  #   end
  # end
end

