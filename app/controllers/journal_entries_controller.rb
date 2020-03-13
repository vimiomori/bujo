class JournalEntriesController < ApplicationController

  def index
    @journal_entries = JournalEntry.all
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
  end

  def edit
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

  def update 
    @journal_entry = JournalEntry.find(params[:id])
    if @journal_entry.update(journal_entry_params)
      flash[:notice] = "Journal entry updated!"
      redirect_to @journal_entry
    else
      render 'edit'
    end
  end

  def destroy
    @journal_entry = JournalEntry.find(params[:id])
    @journal_entry.destroy
    flash[:notice] = "Journal entry deleted!"
    redirect_to journal_entries_path
  end

  private
    def journal_entry_params
      params.require(:journal_entry).permit!
    end

end