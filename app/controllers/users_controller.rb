class UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update]
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @users = User.find(params[:id])
  end

  # GET /users/new
  def new
    @users = User.new
    @url = users_path(@users)
  end

  def new_no_login
    @users = User.new
    @url = users_path(@users)
  end

  # GET /userss/1/edit
  def edit
    @users = User.find(params[:id])
    @url = user_path(@users)
  end

  # POST /users or /users.json
  def create
    @user = User.new()
    @user.email = params['user']['email']
    @user.user_type = params['user']['user_type']
    @user.password = params['user']['password']
    @user.password_confirmation = params['user']['password_confirmation']

    if params['user']['password_confirmation'] == params['user']['password']
      respond_to do |format|
        if @user.save!
          format.html { redirect_to @user, notice: "User was successfully created." }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity, alert: "Failed to create User" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_path, alert: "Password not match" }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    user_params = {
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    }

    if params['user']['password_confirmation'] == params['user']['password']
      respond_to do |format|
        if @users.update(user_params)
          format.html { redirect_to @users, notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @users }
        else
          format.html { render :edit, status: :unprocessable_entity, alert: "Failed to edit User" }
          format.json { render json: @users.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to user_path(@users["id"]), alert: "Password not match" }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_users
    @users = User.find(params[:id])
  end
end
