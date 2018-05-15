class SignUpPage < Howitzer::Web::Page
  path '/account/registration.html'
  validate :title, /\AРегистрация.*\z/

  element :job_checkbox, :xpath, '//label[@for="job"]'
  element :news_checkbox, '#get-unews + label'
  element :email_input,  '#form-reg-user #LoginForm_email'
  element :password_input,  '#form-reg-user #LoginForm_password'
  element :password_conformation_input, '#form-reg-user #LoginForm_password_repeat'
  element :sign_up_btn, :xpath, '//*[@id="form-reg-user"]//button'

  def fill_form( email: nil, password: nil)
    job_checkbox_element.click
    email_input_element.set(email) unless email.nil?
    password_input_element.set(password) unless password.nil?
    password_conformation_input_element.set(password) unless password.nil?
    self
  end

  def submit_form
    sign_up_btn_element.click
  end

  def sign_up_as(user_name, email, password)
    Howitzer::Log.info "Sign up with: User name=#{user_name}, Email=#{email}, Password=#{password}"
    fill_form(user_name: user_name, email: email, password: password, password_confirmation: password)
    submit_form
    HomePage.given
  end
end
