require "application_system_test_case"

class AdministradorsTest < ApplicationSystemTestCase
  setup do
    @administrador = administradors(:one)
  end

  test "visiting the index" do
    visit administradors_url
    assert_selector "h1", text: "Administradors"
  end

  test "should create administrador" do
    visit administradors_url
    click_on "Novo administrador"

    fill_in "Email", with: @administrador.email
    fill_in "Senha", with: @administrador.senha
    click_on "Create Administrador"

    assert_text "Administrador cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Administrador" do
    visit administrador_url(@administrador)
    click_on "Editar administrador", match: :first

    fill_in "Email", with: @administrador.email
    fill_in "Senha", with: @administrador.senha
    click_on "Update Administrador"

    assert_text "Administrador editado com sucesso"
    click_on "Back"
  end

  test "should destroy Administrador" do
    visit administrador_url(@administrador)
    click_on "Excluir administrador", match: :first

    assert_text "Administrador excluído com sucesso"
  end
end
