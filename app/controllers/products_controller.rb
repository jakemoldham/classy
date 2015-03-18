class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "your product is updated"
      redirect_to product_path(@product)  # this is the path to the show page
    else
      render 'edit'
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params) 
    if @product.save    
      flash[:success] = "Welcome, You're Home."
      redirect_to product_path(@product)   # this is the path to the show page
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category)
  end

end
