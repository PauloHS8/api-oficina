class PecasController < AdminController
  before_action :set_peca, only: %i[ show edit update destroy ]

  # GET /pecas or /pecas.json
  def index
    @pecas = Peca.all
  end

  # GET /pecas/1 or /pecas/1.json
  def show
  end

  # GET /pecas/new
  def new
    @peca = Peca.new
  end

  # GET /pecas/1/edit
  def edit
  end

  # POST /pecas or /pecas.json
  def create
    @peca = Peca.new(peca_params)
    handle_save(@peca.save, :new, "Peça cadastrada com sucesso.")
  end

  # PATCH/PUT /pecas/1 or /pecas/1.json
  def update
    handle_save(@peca.update(peca_params), :edit, "Peça atualizada com sucesso.")
  end

  # DELETE /pecas/1 or /pecas/1.json
  def destroy
    @peca.destroy!

    respond_to do |format|
      format.html { redirect_to pecas_url, notice: "Peça excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_peca
    @peca = Peca.find_by(id: params[:id])
    if @peca.nil?
      redirect_to pecas_path, notice: "Peça não encontrada."
    end
  end

  # Only allow a list of trusted parameters through.
  def peca_params
    params.require(:peca).permit(:codigo, :nome, :preco, :tipo, :fabricante, :data_validade)
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to peca_url(@peca), notice: notice_message }
        format.json { render :show, status: :ok, location: @peca }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end
end
