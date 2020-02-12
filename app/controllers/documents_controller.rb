class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: %i[show edit update destroy]

  # GET /documents
  # # TODO: better way to handle current_team.documents
  def index
    @pagy, @documents = pagy(current_team.documents)
  end

  # GET /documents/1
  def show;
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /documents
  def create
    @document = Document.new(document_params)
    @document.user = current_user
    @document.team = current_team

    if @document.save
      @save_success = true
      flash.now[:notice] = I18n.t('flash.documents.create_success')
    else
      flash.now[:notice] = I18n.t('flash.documents.create_failure')
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      flash[:notice] = I18n.t('flash.documents.update_success')
      redirect_to @document
    else
      flash[:alert] = I18n.t('flash.documents.update_failure')
      render :edit
    end
  end

  # DELETE /documents/1
  def destroy
    if @document.destroy
      @destroy_success = true
      flash.now[:notice] = I18n.t('flash.documents.delete_success')
      redirect_to action: :index, status: 303
    else
      flash.now[:alert] = I18n.t('flash.documents.delete_failure')
    end
  end

  def delete_file_attachment
    session[:return_to] ||= request.referer
    @file = ActiveStorage::Blob.find_signed(params[:id])
    @file.attachments.first.purge
    redirect_to session.delete(:return_to), notice: "#{@file.filename} successfully deleted"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def document_params
    params.require(:document).permit(:letter_of_credit_id, :issue_date, :shipment_date, :incoterm_id, :currency_id, :exw_amount, :fob_amount, :freight_amount, :total_amount, :place_of_receipt, :port_of_loading, :port_of_discharge, :final_destination, :goods_description, :issuing_bank, :user_id, :team_id)
  end
end
