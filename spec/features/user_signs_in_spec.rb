require 'spec_helper'

feature "Signing in" do

  let(:user){ User.last } # TODO: use FactoryGirl
  scenario 'user signs in using login/password', js: true do
    visit 'http://localhost:3000/#/sign_in'

    within '.form-group' do
      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password
    end
  end
end