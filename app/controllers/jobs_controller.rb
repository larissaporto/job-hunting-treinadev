class JobsController < ApplicationController
    before_action :authenticate_headhunter!, only: [:new, :create]
    before_action :authorize_headhunter, only: [:new, :create]

    def index 
    end

    def new 
        @job = Job.new
    end

    def create
    end

    private

    def authorize_headhunter
        redirect_to root_path unless current_headhunter
    end
end