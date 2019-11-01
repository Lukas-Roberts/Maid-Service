class SchedulesController < ApplicationController
    before_action :get_schedule, only: [:show, :edit, :update]

    def index
        if current_account.usertype == "client"
            @schedules = Schedule.where(['client_id = :client_id', {client_id: current_user}])
        else
            @schedules = Schedule.where(['maid_id = :maid_id', {maid_id: current_user}])
        end
    end

    def new
        @schedule = Schedule.new
        @maids = Maid.where(["city = :city and state = :state", {city: current_user.city, state: current_user.state}])
    end

    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            redirect_to schedule_path(@schedule)
        else
            @maids = Maid.where(["city = :city and state = :state", {city: current_user.city, state: current_user.state}])
            render :new
        end
    end

    def show
    end

    def edit
    end


    def update
        @schedule.day_of_week = params[:schedule][:day_of_week]
        if @schedule.save
            redirect_to maid_path
        end
    end

    private

    def schedule_params
        params.require(:schedule).permit(:day_of_week, :length_of_time, :maid_id, :residence_id, :client_id)
    end

    def get_schedule
        @schedule = Schedule.find(params[:id])
    end

end