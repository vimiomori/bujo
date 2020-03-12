class JournalEntriesController < ApplicationController

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end
  
  def new
    @journal_entry = JournalEntry.new
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    if @journal_entry.save
      redirect_to @journal_entry
    else
      render 'new'
    end
  end

  private
    def journal_entry_params
      params.require(:journal_entry).permit!
    end

end