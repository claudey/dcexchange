class EpisodesController < ApplicationController
    def index
    end

    def new
        @episode = Episode.new
    end

    def create
        @episode = Episode.new(episode_params)
    end

    private

    def episode_params
        params.require(:episode).permit(:title, :description, :date, :time, :status)
    end

end
