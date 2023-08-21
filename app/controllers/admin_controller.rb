class AdminController < ApplicationController
  def admin
    # Make sure the user is an admin
    # TODO: If no user is signed in this crashes
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @sites = Site.all
    @reservations = Reservation.all
    @users = User.all
  end

  # TODO: Prototype, consider changing the name of these, consider moving these?

  def new
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @user = User.new
  end

  def create
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @user = User.create(user_params)

    if @user.save
      redirect_to :admin
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @user = User.find(params[:id])
  end

  def update
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to :admin
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Make sure user is an admin
    if !current_user.is_admin?
      flash[:alert] = "Must be an admin to view this page."
      redirect_to :root
    end

    @user = User.find(params[:id])
    @user.destroy

    redirect_to :admin
  end

  private
    def user_params
      params.require(:user).permit(:name, :phone, :email, :password)
    end
end
