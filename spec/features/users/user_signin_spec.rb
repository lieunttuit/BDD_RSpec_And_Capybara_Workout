# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User sign in' do
  before do
    @user = User.create(email: 'user@test.com', password: 'password')
  end

  scenario 'with valid credentials' do
    visit('/')

    click_link('Log in')
    fill_in "Email",	with: @user.email
    fill_in "Password",	with: @user.password
    click_button "Log in"

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with in-valid credentials' do
    visit('/')

    click_link('Log in')
    fill_in "Email",	with: ''
    fill_in "Password",	with: ''
    click_button "Log in"

    expect(page).to have_content('Invalid Email or password')
  end
end
