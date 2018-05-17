require 'spec_helper'

RSpec.feature 'Signup' do
  scenario 'user can open sign up page via menu' do
    HomePage.open
    HomePage.on { sign_up_btn_element.click }
    expect(SignUpPage).to be_displayed
  end

  scenario "user can receive message about email's confirmation" do
    SignUpPage.open
    user = build(:user)
    SignUpPage.on {
      fill_form(
        email: user.email,
        password: user.password
      )
    }
    SignUpPage.on { submit_form }
    SignUpPage.on { is_expected.to have_register_content_element('Подтвердите регистрацию') }
    ConfirmationInstructionEmail.find_by_recipient(user.email)
  end

  scenario 'user can sign up with correct credentials' do
    SignUpPage.open
    user = build(:user)
    SignUpPage.on do
      fill_form(
        email: user.email,
        password: user.password
      )
    end
    SignUpPage.on { submit_form }
    ConfirmationInstructionEmail
      .find_by_recipient(user.email)
      .confirm_my_account
    HomePage.on { is_expected.to be_authenticated }
  end
end
