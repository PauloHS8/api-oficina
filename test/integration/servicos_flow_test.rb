require "test_helper"
include ActionView::Helpers::NumberHelper


class ServicosFlowTest < ActionDispatch::IntegrationTest
  setup do
    @servico = servicos(:one)
  end

  test "should get new servico" do
    get new_servico_url
    assert_response :success

    assert_select "h1", "Novo serviço"
    assert_select "form" do
      assert_select "input[name='servico[codigo]']"
      assert_select "input[name='servico[nome]']"
      assert_select "textarea[name='servico[descricao]']"
      assert_select "input[name='servico[preco]']"
    end
  end

  test "should create servico" do
    assert_difference('Servico.count') do
      post servicos_url, params: { servico: { codigo: "S1234", nome: "Novo Serviço", descricao: "Descrição do Serviço", preco: 150.00 } }
    end

    assert_redirected_to servico_url(Servico.last)
    follow_redirect!
    assert_select "p", text: /Codigo:\s*S1234/  # Ajustado para "Codigo"
  end


  test "should get edit servico" do
    get edit_servico_url(@servico)
    assert_response :success

    assert_select "h1", "Editar servico"  # Ajustado para "Editar servico"
    assert_select "form" do
      assert_select "input[name='servico[codigo]']"
      assert_select "input[name='servico[nome]']"
      assert_select "textarea[name='servico[descricao]']"
      assert_select "input[name='servico[preco]']"
    end
  end

  test "should update servico" do
    patch servico_url(@servico), params: { servico: { codigo: "S5678", nome: "Serviço Atualizado", descricao: "Descrição Atualizada", preco: 200.00 } }
    assert_redirected_to servico_url(@servico)
    follow_redirect!
    assert_select "p", text: /Codigo:\s*S5678/  # Ajustado para "Codigo"
  end

  test "should destroy servico" do
    assert_difference('Servico.count', -1) do
      delete servico_url(@servico)
    end

    assert_redirected_to servicos_url
  end
end
