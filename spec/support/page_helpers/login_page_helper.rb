class LoginPageHelper
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def login user
    click_link 'Login'
    within("#login_form") do
      fill_in 'session_email', :with => user[:email]
      fill_in 'session_password', :with => user[:password]
    end
    click_button 'Login'
    self
  end
end
