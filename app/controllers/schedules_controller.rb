class SchedulesController < ApplicationController
    before_action :get_schedule, only: [:edit, :update, :destroy]
    before_action :authenticate

    def index
        @schedules = Schedule.where(['client_id = :client_id', {client_id: current_user}])
    end

    def new
        @schedule = Schedule.new
        @maids = Maid.where(["city = :city and state = :state", {city: current_user.city, state: current_user.state}])
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            redirect_to client_path(current_user.id)
        else
            @maids = Maid.where(["city = :city and state = :state", {city: current_user.city, state: current_user.state}])
            render :new
        end
    end

    def edit
    end


    def update
        @schedule.status = params[:schedule][:status]
        if @schedule.save
            redirect_to maid_path(current_user.id)
        end
    end

    def destroy
        @schedule.delete
        flash[:alert] = "Request Deleted"
        redirect_to client_path(current_user.id)
    end

    private

    def schedule_params
        params.require(:schedule).permit(:day_of_week, :length_of_time, :maid_id, :residence_id, :client_id)
    end

    def get_schedule
        @schedule = Schedule.find(params[:id])
    end

end