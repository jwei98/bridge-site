class ElectivesController < ApplicationController
  before_action :set_elective, only: [:show, :edit, :update, :destroy]

  # GET /electives
  # GET /electives.json
  def index
    @electives = Elective.all
  end

  # GET /electives/1
  # GET /electives/1.json
  def show
  end

  # GET /electives/new
  def new
    @elective = Elective.new
  end

  # GET /electives/1/edit
  def edit
  end

  # POST /electives
  # POST /electives.json
  def create
    @elective = Elective.new(elective_params)

    respond_to do |format|
      if @elective.save
        format.html { redirect_to @elective, notice: 'Elective was successfully created.' }
        format.json { render :show, status: :created, location: @elective }
      else
        format.html { render :new }
        format.json { render json: @elective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electives/1
  # PATCH/PUT /electives/1.json
  def update
    respond_to do |format|
      if @elective.update(elective_params)
        format.html { redirect_to @elective, notice: 'Elective was successfully updated.' }
        format.json { render :show, status: :ok, location: @elective }
      else
        format.html { render :edit }
        format.json { render json: @elective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electives/1
  # DELETE /electives/1.json
  def destroy
    @elective.destroy
    respond_to do |format|
      format.html { redirect_to electives_url, notice: 'Elective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elective
      @elective = Elective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elective_params
      params.require(:elective).permit(:title, :description, :capacity)
    end
end
