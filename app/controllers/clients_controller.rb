class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # TODO: better way to handle current_team.clients
  def index
    @pagy, @clients = pagy(current_team.clients)
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    @client.user = current_user
    @client.team = current_team

    if @client.save
      @save_success = true
      flash.now[:notice] = I18n.t('flash.letter_of_credits.create_success')
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    if @client.destroy
      @destroy_success = true
      flash.now[:notice] = I18n.t('flash.clients.delete_success')
      redirect_to action: :index, status: 303
    else
      flash.now[:alert] = I18n.t('flash.clients.delete_failure')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:name, :user_id, :team_id)
  end
end
