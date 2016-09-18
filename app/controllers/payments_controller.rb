class PaymentsController < ApplicationController
  protect_from_forgery except: [:hook]
  
  def hook
    params.permit!
    status = params[:payment_status]
    if status == "Completed"
      Payment.create(booking: Booking.find(params[:invoice]),
        status: params[:payment_status],
        transaction_ref: params[:txn_id],
        payment_date: Time.now)
    end
  end
end
