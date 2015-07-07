class ReviewsController < ApplicationController
  expose(:review)
  expose(:product)
  expose(:users)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    review.user_id = current_user.id if current_user
    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating, :user_id)
    end
end