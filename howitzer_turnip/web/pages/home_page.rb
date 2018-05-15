class HomePage < Howitzer::Web::Page
  path '/'
  validate :url, %r{trud.ua/?}

  element :sign_up_btn , :xpath, '//a[@href="/account/registration.html"]'
  element :cabinet_span , :xpath, '//span/span[text()="Личный кабинет"]'
  element :registration_span , :xpath, '//span/span[text()="Регистрация"]'

  def authenticated?
    has_cabinet_span_element?
  end

  def not_authenticated?
    has_registration_span_element?
  end

end
