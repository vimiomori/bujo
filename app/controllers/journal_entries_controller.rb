class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :destroy]

  def index
    @journal_entries = @user.journal_entries.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def edit
  end
  
  def new
    @journal_entry = @user.journal_entries.build
  end

  def create
    @journal_entry = @user.journal_entries.build(journal_entry_params)
    if @journal_entry.save
      redirect_to user_journal_entry_path(@user, @journal_entry)
    else
      render 'new'
    end
  end

  def update 
    if @journal_entry.update(journal_entry_params)
      flash[:notice] = "Journal entry updated!"
      redirect_to show_journal_entry_path(@journal_entry)
    else
      render 'edit'
    end
  end

  def destroy
    @journal_entry.destroy
    flash[:notice] = "Journal entry deleted!"
    redirect_to user_journal_entries_path(@user)
  end

  private
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def journal_entry_params
      params.require(:journal_entry).permit(:title, :content, :date, :time, :user_id)
    end

end