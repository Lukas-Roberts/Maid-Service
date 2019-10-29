class SchedulesController < ApplicationController

    def new

    end

    def create

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
    
end