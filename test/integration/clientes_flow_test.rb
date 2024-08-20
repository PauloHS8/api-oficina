require "test_helper"

class ClientesFlowTest < ActionDispatch::IntegrationTest
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get clientes_url
    assert_response :success
    assert_select "h1", "Clientes"
  end

  test "should get new" do
    get new_cliente_url
    assert_response :success
    assert_select "h1", "Novo Cliente"
  end

  test "should get edit" do
    get edit_cliente_url(@cliente)
    assert_response :success
    assert_select "h1", "Editar Cliente"
  end

  test "should show cliente" do
    get cliente_url(@cliente)
    assert_response :success
    assert_select "p", text: /Nome:\s*#{@cliente.nome}/
    assert_select "p", text: /Email:\s*#{@cliente.email}/
    assert_select "p", text: /Telefone:\s*#{@cliente.telefone}/
    assert_select "p", text: /CPF:\s*#{@cliente.cpf}/
    assert_select "p", text: /Endereço:\s*#{@cliente.endereco}/
    assert_select "a", text: "Editar cliente"
    assert_select "button", text: "Excluir cliente"
  end

  test "should destroy cliente" do
    cliente = Cliente.create!(
      nome: "Cliente Teste",
      email: "cliente@test.com",
      telefone: "11987654321",
      cpf: "12345678901",
      endereco: "Rua Teste, 123"
    )

    assert_difference('Cliente.count', -1) do
      delete cliente_url(cliente)
    end

    assert_redirected_to clientes_path
    follow_redirect!
    assert_select "p", "Cliente excluído com sucesso."
  end

end