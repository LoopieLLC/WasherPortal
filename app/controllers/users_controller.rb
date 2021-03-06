class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    #debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end

'''
  def new_washer
    @user = User.new
  end

  def new_driver
    @user = User.new
  end
'''

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "Your account has been created!"

        format.html { redirect_to @user}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_washer
    @user = User.new(user_params)
    @user.role = 1
    respond_to do |format|
      if @user.save
        flash[:success] = "You are now a Loopie washer!"

        format.html { redirect_to login_path}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new_washer }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_driver
    @user = User.new(user_params)
    @user.role = 2
    respond_to do |format|
      if @user.save
        flash[:success] = "You are now a Loopie Driver!"
        format.html { redirect_to login_path}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new_driver }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :role, :zip_code, :role, :start_date, :address_1, :address_2, :city, :state, :insurance_info, :vin, :license_plate, :car_year, :car_make, :car_model, :car_color, :additional_information, :phone, :machine_description)
    end
end
