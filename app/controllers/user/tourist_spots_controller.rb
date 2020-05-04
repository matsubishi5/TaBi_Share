class User::TouristSpotsController < ApplicationController
	before_action :set_tourist_spot, only: [:show, :edit, :update, :destroy]

  def new
    @tourist_spot = TouristSpot.new
  end

  def create
    tourist_spot = TouristSpot.new(tourist_spot_params)
    tourist_spot.user_id = current_user.id
		if tourist_spot.save
			redirect_to user_tourist_spot_path(tourist_spot)
    else
			render "new"
		end
  end

  def index
    if params[:sort] == "1"
      @tourist_spots = TouristSpot.recommended_order #おすすめ順
    elsif params[:sort] == "2"
      @tourist_spots = TouristSpot.new_order #新着順
    elsif params[:sort] == "3"
      @tourist_spots = TouristSpot.reviews_order #レビュー数順
    elsif params[:sort] == "4"
      @tourist_spots = TouristSpot.score.order #点数順
    else
      @tourist_spots = TouristSpot.all
    end
      gon.tourist_spots = TouristSpot.all
  end

  def show
  end

  def edit
  end

  def update
		if @tourist_spot.update(tourist_spot_params)
			redirect_to user_tourist_spot_path(@tourist_spot)
    else
			render "edit"
		end
  end

	def destroy
		@tourist_spot.destroy
		redirect_to user_tourist_spots_path
  end

  # キーワード検索
  def keyword_search
    @tourist_spots = TouristSpot.keyword_search(params[:search])
  end

  # ジャンル検索
  def genre_search
    @tourist_spots = TouristSpot.genre_search(params[:search])
  end

  # 利用シーン検索
  def scene_search
    @tourist_spots = TouristSpot.scene_search(params[:search])
  end

  private

    def set_tourist_spot
      @tourist_spot = TouristSpot.find(params[:id])
    end

    def tourist_spot_params
			params.require(:tourist_spot).permit(
        :genre_id,
        :scene_id,
        :name,
        :postcode,
        :prefecture_code,
        :address_city,
        :address_street,
        :address_building,
        :latitude,
        :longitude,
        :introduction,
        :access,
        :phone_number,
        :business_hour,
        :is_parking,
        {images: []}
      )
    end
end
