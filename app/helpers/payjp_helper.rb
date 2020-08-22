module PayjpHelper
  def set_token_error_in_flash(error)

    case error
    when "invalid_number"
      flash[:notice] = "カード番号が正しくありません"
    when "invalid_cvc"
      flash[:notice] = "cvcが一致しません"
    when "invalid_expiration_date"
      flash[:notice] = "有効期限の値に誤りがあります"
    when "invalid_expiry_month"
      flash[:notice] = "有効期限(月)が一致しません"
    when "invalid_expiry_year"
      flash[:notice] = "有効期限(年)が一致しません"
    when "expired_card"
      flash[:notice] = "有効期限切れのカードです"
    when "card_declined"
      flash[:notice] = "カード会社によって無効化されたカードです"
    when "processing_error"
      flash[:notice] = "決済ネットワークエラーが発生しました。何度操作してもうまく行かない場合は連絡してください"
    else
      flash[:notice] = "例外エラーが発生しました。事務局に通報してください"
    end
  end

end
