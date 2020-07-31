module PayjpHelper
  def set_token_error_in_flash(error)
    if error == "invalid_number"
      flash[:notice] = "カード番号が一致しません"
    elsif error == "invalid_cvc"
      flash[:notice] = "cvcが一致しません"
    elsif error == "invalid_expiration_date"
      flash[:notice] = "有効期限の値に誤りがあります"
    elsif error == "invalid_expiry_month"
      flash[:notice] = "有効期限(月)が一致しません"
    elsif error == "invalid_expiry_year"
      flash[:notice] = "有効期限(年)が一致しません"
    elsif error == "expired_card"
      flash[:notice] = "有効期限切れのカードです"
    elsif error == "card_declined"
      flash[:notice] = "カード会社によって無効化されたカードです"
    elsif error == "processing_error"
      flash[:notice] = "決済ネットワークエラーが発生しました。何度操作してもうまく行かない場合は連絡してください"
    else
      flash[:notice] = "例外エラーが発生しました。事務局に通報してください"
    end
  end
end
