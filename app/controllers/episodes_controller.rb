class EpisodesController < ApplicationController
    before_action :find_episode, only: [:show, :edit, :update, :destroy]

    def index
        @episodes = Episode.all.order("created_at DESC")
    end

    def show

    end

    def new
        @episode = Episode.new
    end

    def create
        @episode = Episode.new(episode_params)

        if @episode.save
            redirect_to @episode, notice: "Successfully created new Episode"
        else
            render 'new'
        end
    end

    private

    def episode_params
        params.require(:episode).permit(:title, :description, :date, :time, :status)
    end

    def find_episode
        @episode = Episode.find(params[:id])
    end

end
