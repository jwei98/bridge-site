class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:index,:create,:search,:edit,:show,:destroy]

  # GET /users
  # GET /users.json
  def index
    if current_user.admin?
      @title = "All Users"
      @users = User.all
    else
      @title = "Please sign in as an administrator to view this page."
    end
  end
  
  
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    checkDuplicates(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def checkDuplicates
    unless [params[:firstChoice], params[:secondChoice], params[:thirdChoice], params[:fourthChoice]].uniq.count == 1
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      if @user.admin?
        params.require(:user).permit(:email, :admin)
      else
        params.require(:user).permit(:email, :firstChoice, :secondChoice, :thirdChoice, :fourthChoice, :admin)
      end
    end

end
