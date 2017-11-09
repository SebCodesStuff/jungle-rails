class UserMailer < ApplicationMailer
default from: 'noreply@jungle.com'

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: "Purchases from Jungle.com: Order #{@order.id}" )
  end
end
