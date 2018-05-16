class ConfirmationInstructionEmail < Howitzer::Email
  subject 'Благодарим вас за регистрацию на сайте trud.ua'

  def confirm_my_account
    ConfirmationEmailPage.open(validate: false, token: token)
  end

  def confirmation_link
    res = plain_text_body[%r{(https://trud.ua/users/activate/code/.+/mailTrackAction/1.html)}, 1]
    Howitzer::Log.info('Confirmation link was not found') if res.nil?
    res
  end

  def token
    confirmation_link[%r{https://trud.ua/users/activate/code/(.+)/mailTrackAction/1.html}, 1]
  end
end
