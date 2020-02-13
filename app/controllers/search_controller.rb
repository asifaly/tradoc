class SearchController < ApplicationController
  def index
    @letter_of_credit = LetterOfCredit.search(params[:query]).limit(10)
    render layout: false
  end
end