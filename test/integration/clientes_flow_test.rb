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
    assert_select "#cliente#{ @cliente.id }"
  end


  test "should destroy  cliente" do
    assert_difference('Cliente.count', -1) do
      delete cliente_url(@cliente)
    end

    assert_redirected_to clientes_path
    follow_redirect!
    assert_select "p", "Cliente excluído com sucesso."
  end
end