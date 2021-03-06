class Admin::OrdersController < Admin::Base
    before_action :authenticate_admin!

def index
    @orders = Order.all.page(params[:page]).per(16)
    @order = Order.new
end
def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @payment_num = params[:payment_method].to_i
    case @payment_num
    when 0
        @payment = '銀行振込'
    when 1
        @payment = 'クレジットカード'
    when 2
        @payment = '代引き'
    end
    # @delivery_status = params[:delivery_status].to_i
    # case @delivery_status
    # when 0
    #     @delivery_status = '受付'
    # when 1
    #     @delivery_status = '商品準備中'
    # when 2
    #     @delivery_status = '出荷済'
    # end
end

def update
    @order = Order.find(params[:id])
    @order.delivery_status = params[:order][:delivery_status]
    @order.save
    flash[:delivery_status] = "配送ステータスを変更しました。"
    redirect_to admin_order_path(@order)
end
end
