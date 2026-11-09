class NewsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_news, only: %i[ show update destroy ]

  # GET /news
  def index
    @news = News.all

    render json: @news
  end

  # GET /news/1
  def show
    render json: @news
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      render json: @news, status: :created, location: @news
    else
      render json: @news.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /news/1
  def update
    if @news.update(news_params)
      render json: @news
    else
      render json: @news.errors, status: :unprocessable_content
    end
  end

  # DELETE /news/1
  def destroy
    @news.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.expect(news: [ :title, :body, :client_id ])
    end
end
