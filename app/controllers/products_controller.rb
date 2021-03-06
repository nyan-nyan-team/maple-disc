class ProductsController < ApplicationController
    
    PER = 12
    
def index
    @product = Product.new
    if params[:q]
        @products = @q.result.page(params[:page]).per(PER)
    else
        @products = Product.page(params[:page]).per(PER)

    end 
end

def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
end

end
