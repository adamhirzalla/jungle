require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
   # SETUP
   before :each do
    @user = User.create!(
    first_name: 'John', 
    last_name: 'Doe', 
    email: 'johndoe@example.com', 
    password: 'password', 
    password_confirmation: 'password'
    )
  end

  scenario "Can login with a registered user" do
    # ACT
    visit login_path
    
    expect(page).to have_css '.users-login'

    within('form') do 
      fill_in 'login[email]', with: 'johndoe@example.com'
      fill_in 'login[password]', with: 'password'
      click_button('Login')
    end
    
    within('#navbar') { expect(page).to have_css('.navbar-right span', text: 'John') }
    
    # # DEBUG / VERIFY
    save_screenshot
  end

end
