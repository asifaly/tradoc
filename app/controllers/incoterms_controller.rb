class IncotermsController < ApplicationController
  before_action :set_incoterm, only: [:show, :edit, :update, :destroy]

  # GET /incoterms
  def index
    @pagy, @incoterms = pagy(Incoterm.all)
  end

  # GET /incoterms/1
  def show
  end

  # GET /incoterms/new
  def new
    @incoterm = Incoterm.new
  end

  # GET /incoterms/1/edit
  def edit
  end

  # POST /incoterms
  def create
    @incoterm = Incoterm.new(incoterm_params)

    if @incoterm.save
      redirect_to @incoterm, notice: 'Incoterm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /incoterms/1
  def update
    if @incoterm.update(incoterm_params)
      redirect_to @incoterm, notice: 'Incoterm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /incoterms/1
  def destroy
    @incoterm.destroy
    redirect_to incoterms_url, notice: 'Incoterm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incoterm
      @incoterm = Incoterm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def incoterm_params
      params.require(:incoterm).permit(:code, :description)
    end
end
