class DashboardsController < ApplicationController
  def show
    @requests_seller = Request.where(seller_id: current_user.id).order(created_at: :desc)
    @requests_buyer = Request.where(buyer_id: current_user.id).order(created_at: :desc)
  end

  def destroy
    @request.destroy
  end
end
