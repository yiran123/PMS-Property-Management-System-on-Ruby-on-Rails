class Guests::AssignmentsController < ApplicationController
	before_action :set_assignment, only: [:show, :edit, :update, :destroy]
	before_action :set_guest, only: [:show, :new, :create, :edit, :update, :destroy]
	# before_action :set_room, only: [:show, :new, :create, :edit, :update, :destroy]

	def show
	end

	def new
		@assignment = Assignment.new
		@assignment.guest_id = @guest.id
	end

	def edit
	end

	def create
		@assignment = Assignment.new(assignment_params)
		@assignment.guest_id = @guest.id
		@assignment.room_id = @assignment.room_number


		respond_to do |format|
			if @assignment.save
				format.html { redirect_to guest_url(@assignment.guest_id), notice: "Assigned!" }
				format.json { render :show, status: :created, location: @assignment }
			else
				format.html { render :new }
				format.json { render json: @assignment.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @assignment.update(assignment_params)
				@assignment.room_id = Room.find_by(room_num: params[:room_number])
				format.html { redirect_to guest_url(@assignment.guest_id), notice: "Updated!" }
				format.json { render :show, status: :ok, location: @assignment }
			else
				format.html { render :edit }
				format.json { render json: @assignment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@assignment.destroy
		respond_to do |format|
			format.html { redirect_to guest_url(@assignment.guest_id), notice: "Destroyed!" }
			format.json { head :no_content }
		end
	end


	private

		def set_assignment
			@assignment = Assignment.find(params[:id])
		end

		def set_guest
			@guest = Guest.find(params[:guest_id])
		end

		def assignment_params
			params.require(:assignment).permit(:room_number)
		end

end
