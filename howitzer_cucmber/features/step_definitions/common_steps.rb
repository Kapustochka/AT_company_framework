#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /(.+) page of web application/ do |page|
  page.open
end

####################################
#              ACTIONS             #
####################################

When /I click (.+?) menu item on (.+) page/ do |text, page|
  page.on { sign_up_btn_element.click}
end

When 'I fill form on sign up page with new data' do
  @user = build(:user)
  SignUpPage.on { fill_form(
    email: out(:@user).email,
    password: out(:@user).password,
    ) }
end

When 'I submit sign up form on sign up page' do
  SignUpPage.on { submit_form }
end

When /I confirm sing up from (.+) email/ do |email|
  email.as_email_class.find_by_recipient(@user.email).confirm_my_account
end

####################################
#              CHECKS              #
####################################

Then /I should be redirected to (.+) page/ do |page|
  expect(page).to be_displayed
end

Then 'I should be logged in the system' do
  HomePage.on { is_expected.to be_authenticated }
end

Then 'I should not be logged in the system' do
  HomePage.on { is_expected.to be_not_authenticated }
end

Then /I should see following text on (.+) page:/ do |page, text1|
  page.on {is_expected.to have_register_content_element}
end


Then /I should receive (.+) email/ do |email|
  email.as_email_class.find_by_recipient(@user.email)
end
