class User::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @reviews = @user.reviews.page(params[:page]).per(10)
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id) # ログインしているユーザーを検索
      @userEntry = Entry.where(user_id: @user.id) # メッセージ相手のユーザーを検索
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then #room_idが一致するユーザー同士を探す
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
  end

	def update
		if @user.update(user_params)
			redirect_to user_user_path(@user)
		else
			render "edit"
		end
  end

  # 論理削除
  def destroy
    @user.is_valid = "退会済"
    @user.save
    reset_session
    redirect_to root_path
  end

  # 自分がフォローしているユーザー一覧
  def following
    @user = User.find(params[:user_id])
    @followings = @user.following_user.where.not(id: current_user.id).page(params[:page]).per(40)
  end

  # 自分をフォローしているユーザー一覧
  def follower
    @user = User.find(params[:user_id])
    @followers = @user.follower_user.where.not(id: current_user.id).page(params[:page]).per(40)
  end

  # ランキング
  def ranking
    if params[:prev].present?
      @month = Date.parse(params[:pre_preview])
    elsif params[:next].present?
      @month = Date.parse(params[:next_preview])
    else
      @month = Time.current.to_date
      # binding.pry
    end

    @users = User.where(created_at: @month.all_month).order(point: "DESC")
  end

	private

		def set_user
			@user = User.find(params[:id])
		end

		def user_params
      params.require(:user).permit(
        :name,
        :sex,
        :email,
        :postcode,
        :prefecture_code,
        :address_city,
        :address_street,
        :address_building,
        :introduction,
        :profile_image,
        :point,
        :rank,
        :is_valid
        )
		end
end
