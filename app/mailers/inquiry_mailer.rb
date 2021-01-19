class InquiryMailer < ApplicationMailer
  
  default from: "example@example.com"
  
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
  end

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to:   'yxxa.abc@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end

end
