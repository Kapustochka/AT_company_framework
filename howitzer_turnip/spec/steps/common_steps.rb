module Turnip
  # In this module should be combined common turnip steps
  module Steps
    # PUT GLOBAL STEPS HERE
  end
end

# This module combines turnip steps for example.feature
module SignUpSteps
  attr_accessor :user

  step 'there is a monster' do
    self.monster = 1
  end

  #############################################################
  #                      PREREQUISITES                        #
  #############################################################

  step 'sign up page of web application' do
    SignUpPage.open
  end

  step 'home page of web application' do
    HomePage.open
  end

  ####################################
  #              ACTIONS             #
  ####################################

  # When /I click (.+?) menu item on (.+) page/ do |text, page|
  #   page.on { sign_up_btn_element.click}
  # end

  step 'I click sign up menu item on home page' do
    HomePage.on { sign_up_btn_element.click}
  end

  step 'I fill form on sign up page with new data' do
    self.user = build(:user)
    SignUpPage.on { fill_form(
      email: out(:@user).email,
      password: out(:@user).password,
      ) }
  end

  step 'I submit sign up form on sign up page' do
    SignUpPage.on { submit_form }
  end

  # When /I confirm sing up from (.+) email/ do |email|
  #   email.as_email_class.find_by_recipient(@user.email).confirm_my_account
  # end

  step 'I confirm sing up from confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(@user.email).confirm_my_account
  end

  ####################################
  #              CHECKS              #
  ####################################

  step 'I should be redirected to sign up page' do
    expect(SignUpPage).to be_displayed
    # SignUpPage.on {is_expected.to be_displayed}
  end

  step 'I should be logged in the system' do
    HomePage.on { is_expected.to be_authenticated }
  end

  step 'I should not be logged in the system' do
    HomePage.on { is_expected.to be_not_authenticated }
  end

  step 'I should see info on sign up page that account was successfully confirmed' do
    SignUpPage.on {is_expected.to have_register_content_element}
  end


  step 'I should receive confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(@user.email)
  end

end

RSpec.configure { |c| c.include SignUpSteps, sign_up_steps: true }
