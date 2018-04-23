class Admin::UsersController < Admin::ApplicationController

  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "该用户资料更新成功."
      redirect_to admin_users_url
    else
      flash[:danger] = "用户资料更新失败,请重新尝试."
      redirect_to admin_user_url(@user)
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = '用户删除成功.'
    if(params[:f_a])
      redirect_back(fallback_location: admin_dashboards_url)
    else
      redirect_to admin_users_url
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
