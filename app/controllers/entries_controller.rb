class EntriesController < ApplicationController
  def index
    render :index
  end
  def show
    render :show
  end
  def new
    render :new
  end

  def create
      @entry = Article.new

      @entry.title = params[:article][:title]
      @entry.text = params[:article][:text]


        if @entry.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
          redirect_to_entries_url
        else
      # otherwise render new.html.erb
          render :new
        end
      end

      def edit
        @entry = Article.find(params[:id])
      end

  def update
    @entry = Article.find(params[:id])

    @entry.title = params[:article][:title]
    @entry.text = params[:article][:text]

    if @entry.save
    redirect_to entry_url(params[:id])
    else
      render :edit
    end
  end

end
