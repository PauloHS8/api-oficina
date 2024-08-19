RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# spec/features/admin_login_spec.rb
require 'rails_helper'

RSpec.describe 'Admin Login', type: :feature do
  let(:admin) { create(:admin) }

  it 'permite que o administrador faça login com credenciais válidas' do
    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end
end
