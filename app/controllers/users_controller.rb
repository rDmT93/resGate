class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @f = Follower.find_by_user_id_and_fw_id(session[:user_id], @user.id)
    if !@f.nil?
      @is_follow = true
    else
      @is_follow = false
    end
    @following = @user.fws.order("name asc")
    @followers = @user.inverse_fws.order("name asc")
  end

  def follow
    @f = Follower.create({:user_id => session[:user_id], :fw_id => params[:f_user_id]})
    @f.save
  end

  def unfollow
    @f = Follower.find_by_user_id_and_fw_id(session[:user_id], params[:f_user_id])
    @f.destroy
  end

  # GET /users/1/edit
  def edit
    set_user
    if @user.id != session[:user_id]
      render :forbidden
    else
      render :edit
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
      params.require(:user).permit(:name, :gender, :avatar, :degree, :position, :institution, :department)
    end
end
