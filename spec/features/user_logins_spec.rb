require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
    before(:each) do
        @user = User.create!(
        name: 'ahmed',
        email: 'test@yahoo.com',
        password: '1234567',
        password_confirmation: '1234567'
      )
    end

    scenario "user can fill login info and rediredcted to home page" do
      visit login_path
      fill_in name: 'email', with: 'test@yahoo.com'
      fill_in name: 'password', with: '1234567'
      click_button 'Submit'
      save_screenshot 'test4.png'
      expect(page).to have_content('Products')
    end
    
end
