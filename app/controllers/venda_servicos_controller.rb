class VendaServicosController < ApplicationController
  before_action :set_venda_servico, only: %i[ show edit update destroy ]

  # GET /venda_servicos or /venda_servicos.json
  def index
    if current_user.admin?
      @venda_servicos = VendaServico.includes(:cliente, :veiculo, :servico).all
    else
      @venda_servicos = VendaServico.includes(:cliente, :veiculo, :servico).where(cliente_id: current_user.cliente_id)
    end
  end

  # GET /venda_servicos/1 or /venda_servicos/1.json
  def show
  end

  # GET /venda_servicos/new
  def new
    @venda_servico = VendaServico.new
  end

  # GET /venda_servicos/1/edit
  def edit
  end

  # POST /venda_servicos or /venda_servicos.json
  def create
    @venda_servico = VendaServico.new(venda_servico_params)
    handle_save(@venda_servico.save, :new, "Venda cadastrada com sucesso.")
  end

  # PATCH/PUT /venda_servicos/1 or /venda_servicos/1.json
  def update
    handle_save(@venda_servico.update(venda_servico_params), :edit, "Venda editada com sucesso.")
  end

  # DELETE /venda_servicos/1 or /venda_servicos/1.json
  def destroy
    @venda_servico.destroy!
    respond_to do |format|
      format.html { redirect_to venda_servicos_url, notice: "Venda excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venda_servico
    @venda_servico = VendaServico.find_by(id: params[:id])
    if @venda_servico.nil?
      redirect_to venda_servicos_path, notice: "Venda não encontrada."
    end
  end

  # Only allow a list of trusted parameters through.
  def venda_servico_params
    params.require(:venda_servico).permit(:servico_id, :veiculo_id, :cliente_id)
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to venda_servico_url(@venda_servico), notice: notice_message }
        format.json { render :show, status: :ok, location: @venda_servico }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @venda_servico.errors, status: :unprocessable_entity }
      end
    end
  end
end
