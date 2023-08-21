require "rails_helper"
RSpec.feature "Signing users out" do

  before do
   @john = User.create!(email: "john@example.com",
                        password: "password")
   visit '/'
   click_link "Log in"
   fill_in "Email", with: @john.email
   fill_in "Password",  with: @john.password
   click_button "Log in"
 end

 scenario do
   visit "/"
   expect(page).not_to have_link("Sign up")
   expect(page).not_to have_link("Log in")
 end
end
