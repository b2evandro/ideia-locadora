class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
    @movies = Movie.all
    @users = User.all
  end

  # GET /favorites/1/edit
  def edit
    renderiza :edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: "Favorite was successfully created." }
        format.json { render :show, status: :created, location: @favorite }
      else
        @movies = Movie.all
        @users = User.all
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        puts @favorite.errors.inspect
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: "Favorite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
    @movies = Movie.all
    @users = User.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def favorite_params
    params.fetch(:favorite, {}).permit(:movie_id, :user_id)
  end

  def renderiza(view)
    @favorite = Favorite.find(params[:id])
    @movies = Movie.all
    @users = User.all

    render view
  end
end
