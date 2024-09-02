require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cliente)
  end

  # Teste para login com informações válidas
  test "login com informacoes validas" do
    post user_session_path, params: { user: { email: @user.email, password: '123456' } }
    assert_response :redirect
    assert_redirected_to root_path
  end

  # Teste para login com senha inválida
  test "login com senha inválida" do
    post user_session_path, params: { user: { email: @user.email, password: 'wrong_password' } }
    assert_response :unprocessable_entity
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
  end

  # Teste para login com email inválido
  test "login com email inválido" do
    post user_session_path, params: { user: { email: 'wrong_email@example.com', password: 'password' } }
    assert_response :unprocessable_entity
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
  end

  # Teste para login com email e senha vazios
  test "login com email e senha vazios" do
    post user_session_path, params: { user: { email: '', password: '' } }
    assert_response :unprocessable_entity
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
  end

  # Teste para redirecionamento após tentativa de acessar a root_path não autenticado
  test "redirecionamento após login quando não autenticado" do
    get root_path
    assert_redirected_to new_user_session_path
  end
end