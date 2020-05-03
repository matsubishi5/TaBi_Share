class User::RoomsController < ApplicationController
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry2_params)
    redirect_to user_room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to user_users_path
    end
  end

  private
    def entry2_params
      params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
    end
end
