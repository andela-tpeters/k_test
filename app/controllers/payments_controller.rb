class PaymentsController < ApplicationController
  protect_from_forgery except: [:hook]
  
  def hook
    params.permit!
    status = params[:payment_status]
    create_payment if status == "Completed"
  end

  def create_payment
    Payment.create(booking: Booking.find(params[:invoice]),
        status: params[:payment_status],
        transaction_ref: params[:txn_id],
        payment_date: Time.now)
  end
end
