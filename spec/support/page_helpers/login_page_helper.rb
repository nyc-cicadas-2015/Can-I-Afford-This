class LoginPageHelper
  include Capybara::DSL

  def visit_page
    visit root_path
    self
  end

  def login user
    within('#new_user') do
      fill_in 'user_email', :with => user[:email]
      fill_in 'user_password', :with => user[:password]
    end
    click_button 'Login'
    self
  end
end
