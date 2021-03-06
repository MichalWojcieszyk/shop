module Features
  module SessionHelpers
    def sign_up_with(email, password, firstname, lastname)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      fill_in 'Firstname', with: firstname
      fill_in 'Lastname', with: lastname
      within(".form-actions") do
        click_on 'Sign up'
      end
    end

    def sign_in
      user = create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    def logout
      click_button 'Logout'
    end
  end
end