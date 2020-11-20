class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found 
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "elena", password: "balance", only: :show
  layout 'user_layout'

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def search
    #byebug
    if params[:search].blank?  
      @users = User.all
    render(:index, alert: "Empty field!") and return  
  else 
      @parameter = params[:search].downcase  
    @users = User.all.where("lower(first_name) LIKE :search", search: "%#{@parameter}%")
    render(:index) and return
  
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
    #@user = User.new(user_params)

   # respond_to do |format|
   #   if @user.save
   #     format.html { redirect_to @user, notice: 'User was successfully created.' }
   #     format.json { render :show, status: :created, location: @user }
   #   else
   #     format.html { render :new }
   #     format.json { render json: @user.errors, status: :unprocessable_entity }
   #   end
   # end
	
	@user = User.new(user_params)
    if @user.save
      flash.notice = "The user record was created successfully."
      redirect_to @user
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render :new  
    end
  end
	

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
    #  if @user.update(user_params)
    #    format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @user }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end
	
	if @user.update(user_params)
      flash.notice = "The user record was updated successfully."
      redirect_to @user
    else
      flash.now.alert = @user.errors.full_messages.to_sentence
      render :edit
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

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email)
    end
	
	def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to users_path
	end
end
