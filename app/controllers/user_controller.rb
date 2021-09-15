class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @users = User.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @users = User.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    # @users = User.new(member_params)
    #
    # respond_to do |format|
    #   if @member.save
    #     format.html { redirect_to @member, notice: "Member was successfully created." }
    #     format.json { render :show, status: :created, location: @member }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @member.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    # respond_to do |format|
    #   if @member.update(member_params)
    #     format.html { redirect_to @member, notice: "Member was successfully updated." }
    #     format.json { render :show, status: :ok, location: @member }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @member.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    # @member.destroy
    # respond_to do |format|
    #   format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
