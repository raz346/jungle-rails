class ReviewsController < ApplicationController
before_filter :authorize
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if !@review.save
      @review.errors.each {|err|
        puts err
        puts @review.errors[err]
      }
    end
    redirect_to @product

  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to @product
  end
  


  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
  
  
end
