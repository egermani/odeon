class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    session[:acting] = true
    session[:cinema] = true
    session[:writing] = true
    session[:score] = true
    session[:sfx] = true
    session[:movie_id] = @movie.id
    @reviews = @movie.reviews
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    case params[:sort_type]
    when "acting"
      session[:acting] = !session[:acting]
    when "cinema"
      session[:cinema] = !session[:cinema]
    when "score"
      session[:score] = !session[:score]
    when "writing"
      session[:writing] = !session[:writing]
    when "sfx"
      session[:sfx] = !session[:sfx]
    end
    @movie = Movie.find(session[:movie_id])
    @reviews = @movie.sort_state({acting: session[:acting], cinema: session[:cinema], score: session[:score], writing: session[:writing], sfx: session[:sfx]})
    render 'show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :synopsis, :release_date, :director)
    end
end
