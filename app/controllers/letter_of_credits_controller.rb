# frozen_string_literal: true

class LetterOfCreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_letter_of_credit, only: %i[show edit update destroy]

  # GET /letter_of_credits
  # # TODO: better way to handle current_team.letter_of_credits
  def index
    @pagy, @letter_of_credits = pagy(current_team.letter_of_credits)
  end

  # GET /letter_of_credits/1
  def show;
  end

  # GET /letter_of_credits/new
  def new
    @letter_of_credit = LetterOfCredit.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /letter_of_credits/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /letter_of_credits
  def create
    @letter_of_credit = LetterOfCredit.new(letter_of_credit_params)
    @letter_of_credit.user = current_user
    @letter_of_credit.team = current_team

    respond_to do |format|
      if @letter_of_credit.save
        format.js
        format.html {redirect_to letter_of_credits_url, notice: 'Letter of credit was successfully created.'}
      else
        format.html {render :new}
      end
    end

  end

  # PATCH/PUT /letter_of_credits/1
  def update
    if @letter_of_credit.update(letter_of_credit_params)
      redirect_to session.delete(:return_to), notice: 'Letter of credit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /letter_of_credits/1
  def destroy
    @letter_of_credit.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to letter_of_credits_url, notice: 'Letter of credit was successfully destroyed.' }
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
  def set_letter_of_credit
    @letter_of_credit = LetterOfCredit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def letter_of_credit_params
    params.require(:letter_of_credit).permit(:lc_number, :expiry_date, :currency_id, :amount, :client_id, :comment, :user_id, :team_id, files: [])
  end
end
