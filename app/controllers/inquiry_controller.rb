class InquiryController < ApplicationController

  # 問い合わせページ
  def index
    @inquiry = Inquiry.new
    render :index
  end

  # 問い合わせ内容の確認ページ
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      # OK。確認画面を表示
      render :confirm
    else
      # NG。入力画面を再表示
      render :index
    end
  end

  # サンクスページ
  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
    # 問い合わせした方に詳細メールを送信
    InquiryMailer.received_email(@inquiry).deliver
    # 管理者にもメールの詳細を送信
    @admin = Inquiry.new
    @admin.email = ENV["SEND_MAIL"]
    InquiryMailer.received_email(@admin).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

end
