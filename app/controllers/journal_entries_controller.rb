class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  def index
    user_id = params[:id]
    if user_id.present?
      @journal_entries = @journal_entries.where(user_id: user_id) 
    else  # TODO: Get current user somehow
      @journal_entries = JournalEntry.all
    end
  end

  def show
  end

  def edit
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
    if @journal_entry.update(journal_entry_params)
      flash[:notice] = "Journal entry updated!"
      redirect_to @journal_entry
    else
      render 'edit'
    end
  end

  def destroy
    @journal_entry.destroy
    flash[:notice] = "Journal entry deleted!"
    redirect_to journal_entries_path
  end

  private
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    def journal_entry_params
      params.require(:journal_entry).permit!
    end

end