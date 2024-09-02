require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cliente) # Ajuste conforme necessário
  end

  # Teste 1: Logout com Sucesso
  test "logout com sucesso" do
    post user_session_path, params: { user: { email: @user.email, password: '123456' } }
    assert_response :redirect
    follow_redirect!

    delete destroy_user_session_path
    assert_redirected_to root_path

    follow_redirect!
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
    assert_template 'devise/sessions/new'
  end

  test "logout sem login anterior" do
    delete destroy_user_session_path
    assert_redirected_to root_path

    follow_redirect!
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
    assert_template 'devise/sessions/new'
  end

  test "logout após redirecionamento" do
    # Faça login
    post user_session_path, params: { user: { email: @user.email, password: '123456' } }
    assert_response :redirect
    follow_redirect!

    # Simule uma navegação para uma página protegida
    get '/atendimentos' # Substitua com uma rota real que requer autenticação
    assert_response :success

    # Faça logout
    delete destroy_user_session_path
    assert_redirected_to root_path

    follow_redirect!
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
    assert_template 'devise/sessions/new'
  end

  test "logout e tentativa de acesso a página protegida" do
    # Faça login
    post user_session_path, params: { user: { email: @user.email, password: '123456' } }
    assert_response :redirect
    follow_redirect!

    # Faça logout
    delete destroy_user_session_path
    assert_redirected_to root_path

    follow_redirect!
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
    assert_template 'devise/sessions/new'

    # Tente acessar uma página protegida
    get '/atendimentos' # Substitua com uma rota real que requer autenticação
    assert_redirected_to new_user_session_path
  end

  test "logout e verificação de cookies de sessão" do
    # Faça login
    post user_session_path, params: { user: { email: @user.email, password: '123456' } }
    assert_response :redirect
    follow_redirect!

    # Faça logout
    delete destroy_user_session_path
    assert_redirected_to root_path

    follow_redirect!
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_response :success
    assert_template 'devise/sessions/new'

    # Verifique se não há cookies de sessão
    assert_nil cookies[:_your_app_session], "O cookie de sessão não deve estar presente após o logout"
    end

  end