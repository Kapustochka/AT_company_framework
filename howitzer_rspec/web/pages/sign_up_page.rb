class SignUpPage < Howitzer::Web::Page
  path '/account/registration.html'
  validate :title, /\AРегистрация.*\z/

  element :register_content, :xpath, ->(name) { %{//*[text()="#{name}"]} }
  element :job_checkbox, :xpath, '//label[@for="job"]'
  element :news_checkbox, '#get-unews + label'
  element :registration_form, '#form-reg-user'
  element :email_input, '#LoginForm_email'
  element :password_input, '#LoginForm_password'
  element :password_conformation_input, '#LoginForm_password_repeat'
  element :sign_up_btn, :xpath, '//*[@id="form-reg-user"]//button'

  def fill_form(email: nil, password: nil)
    job_checkbox_element.click
    within_registration_form_element do
      email_input_element.set(email) unless email.nil?
      password_input_element.set(password) unless password.nil?
      password_conformation_input_element.set(password) unless password.nil?
    end
  end

  def submit_form
    sign_up_btn_element.click
  end
end
