class ConfirmationInstructionEmail < Howitzer::Email
  subject 'Благодарим вас за регистрацию на сайте trud.ua'

  def confirm_my_account
    Capybara.current_session.visit(confirmation_link)
  end

  def confirmation_link
    res = plain_text_body[%r{(https://trud.ua/users/activate/code/.+/mailTrackAction/1.html)}, 1]
    Howitzer::Log.info("Confirmation link :#{res} ") if !res.nil?
    Howitzer::Log.info('Confirmation link was not found') if res.nil?
    res
  end

  # def token
  #   confirmation_link[/confirmation_token=(.+)/, 1]
  # end
end
