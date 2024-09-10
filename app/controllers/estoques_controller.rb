class EstoquesController < AdminController
  before_action :set_estoque, only: %i[show edit update destroy]
  before_action :load_pecas, only: %i[new create edit update]

  # GET /estoques or /estoques.json
  def index
    @estoques = Estoque.all
  end

  # GET /estoques/1 or /estoques/1.json
  def show
  end

  # GET /estoques/new
  def new
    @estoque = Estoque.new
  end

  # GET /estoques/1/edit
  def edit
  end

  # POST /estoques or /estoques.json
  def create
    @estoque = Estoque.new(estoque_params)
    handle_save(@estoque.save, :new, "Estoque cadastrado com sucesso.")
  end

  # PATCH/PUT /estoques/1 or /estoques/1.json
  def update
    handle_save(@estoque.update(estoque_params), :edit, "Estoque editado com sucesso.")
  end

  # DELETE /estoques/1 or /estoques/1.json
  def destroy
    @estoque.destroy

    respond_to do |format|
      format.html { redirect_to estoques_url, notice: "Estoque excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estoque
    @estoque = Estoque.find_by(id: params[:id])
    if @estoque.nil?
      redirect_to estoques_path, notice: "Estoque não encontrado."
    end
  end

  # Only allow a list of trusted parameters through.
  def estoque_params
    params.require(:estoque).permit(:codigo, :quantidade, :peca_id)
  end

  def load_pecas
    @pecas = Peca.all
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to estoque_url(@estoque), notice: notice_message }
        format.json { render :show, status: :ok, location: @estoque }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end
end
