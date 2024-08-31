require "test_helper"

class VendaServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda_servico = venda_servicos(:one)
  end

  test "should get index" do
    get venda_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_servico_url
    assert_response :success
  end

  test "should create venda_servico" do
    assert_difference("VendaServico.count") do
      post venda_servicos_url, params: { venda_servico: { cliente_id: @venda_servico.cliente_id, servico_id: @venda_servico.servico_id } }
    end

    assert_redirected_to venda_servico_url(VendaServico.last)
  end

  test "should show venda_servico" do
    get venda_servico_url(@venda_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_servico_url(@venda_servico)
    assert_response :success
  end

  test "should update venda_servico" do
    patch venda_servico_url(@venda_servico), params: { venda_servico: { cliente_id: @venda_servico.cliente_id, servico_id: @venda_servico.servico_id } }
    assert_redirected_to venda_servico_url(@venda_servico)
  end

  test "should destroy venda_servico" do
    assert_difference("VendaServico.count", -1) do
      delete venda_servico_url(@venda_servico)
    end

    assert_redirected_to venda_servicos_url
  end
end
