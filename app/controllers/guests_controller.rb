class GuestsController < ApplicationController
  before_action :set_guest, only: %i[ show edit update destroy ]
  before_action :checkRoom, only: %i[ create update ]

  # GET /guests or /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1 or /guests/1.json
  def show
    @assignments = @guest.assignments
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests or /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        if !@guest.roomNum.blank?
          @room = Room.find_by(room_num: @guest.roomNum)
          assignment = Assignment.create ( {guest: @guest, room: @room} )  # saved
        end
        format.html { redirect_to @guest, notice: "Guest was successfully created." }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
        
      end
    end
  end




  # PATCH/PUT /guests/1 or /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        # @guest.assignments.each do |assignment|
        #   assignment.destroy
        # end

        if !@guest.roomNum.blank?
          @room = Room.find_by(room_num: @guest.roomNum)
          assignment = Assignment.create ( {guest: @guest, room: @room} )  # saved
        end
        format.html { redirect_to @guest, notice: "Guest was successfully updated." }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1 or /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: "Guest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def checkRoom
    # @room = Room.find_by(room_num: params[:roomNum])
    # redirect_to guests_path, notice: "No this room." if @room.nil?
    if !Room.exists?(room_num: params[:guest][:roomNum])
        if @guest.nil?
          redirect_to guests_path, notice: "No this room."
        else
          redirect_to @guest, notice: "No this room."
        end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :email, :roomNum)
    end
end
