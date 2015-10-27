class CritiquesController < ApplicationController
  before_action :set_critique, only: [:show, :edit, :update, :destroy]
  before_action :set_review, only: [:index]

  # GET /critiques
  # GET /critiques.json
  def index
    @critiques = @review.critiques
  end

  # GET /critiques/1
  # GET /critiques/1.json
  def show
  end

  # GET /critiques/new
  def new
    @critique = Critique.new
  end

  # GET /critiques/1/edit
  def edit
  end

  # POST /critiques
  # POST /critiques.json
  def create
    @review = Review.find(params[:critique][:review_id])
    @critique = Critique.new(critique_params)

    respond_to do |format|
      if @critique.save
        format.html { redirect_to review_path(@review)}
        format.json { render :show, status: :created, location: @critique }
      else
        format.html { render :new }
        format.json { render json: @critique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /critiques/1
  # PATCH/PUT /critiques/1.json
  def update
    respond_to do |format|
      if @critique.update(critique_params)
        format.html { redirect_to @critique, notice: 'Critique was successfully updated.' }
        format.json { render :show, status: :ok, location: @critique }
      else
        format.html { render :edit }
        format.json { render json: @critique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critiques/1
  # DELETE /critiques/1.json
  def destroy
    @critique.destroy
    respond_to do |format|
      format.html { redirect_to critiques_url, notice: 'Critique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critique
      @critique = Critique.find(params[:id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def critique_params
      params.require(:critique).permit(:user_id, :review_id, :keypoint_id, :title, :body)
    end
end
