class SchedulesController < ApplicationController
    before_action :get_schedule, only: [:show, :edit, :update]

    def new
        @schedule = Schedule.new
        @maids = Maid.where(["city = :city and state = :state", {city: current_user.city, state: current_user.state}])
    end

    def create
        @schedule = Schedule.new(schedule_params)
    end

    def show
    end

    def edit
    end

    def update

    end

    private

    def schedule_params
        params.require(:schedule).permit(:day_of_week, :length_of_time, :maid_id)
    end

    def get_schedule
        @schedule = Schedule.find(params[:id])
    end

end