class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index, :new, :create]
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
    @url = registrations_path(@users)
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
          format.html { redirect_to unauthenticated_root_path, notice: "User was successfully created." }
          format.json { render :index, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity, alert: "Failed to create User" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to unauthenticated_root_path, alert: "Password not match" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
