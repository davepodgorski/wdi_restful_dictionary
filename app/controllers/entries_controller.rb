class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def show
    @entry = Entry.fine(params[:id])
  end

  def new
    @entry = Entry.ew
  end

  def create
      @entry = Entry.new
      @entry.word = params[:entry][:word]
      @entry.definition = params[:entry][:definition]
      @entry.language = params[:entry][:language]



        if @entry.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
          redirect_to_entries_path
        else
      # otherwise render new.html.erb
          render :new
        end
      end

      def edit
        @entry = Entry.find(params[:id])
      end

  def update
    @entry = Entry.find(params[:id])

    @entry.word = params[:entry][:word]
    @entry.definition = params[:entry][:definition]
    @entry.language = params[:entry][:language]

    if @entry.save
    redirect_to entries_path
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

end
