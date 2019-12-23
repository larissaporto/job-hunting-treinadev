class JobsController < ApplicationController
    before_action :authenticate_headhunter!, only: [:new, :create]
    before_action :authorize_headhunter, only: [:new, :create]
    before_action :set_job, only:[:show]

    def index 
    end

    def new 
        @job = Job.new
    end

    def create
        @job = Job.new(params.require(:job).permit(:title, :description, :salary_from, :end_date,
                                                   :salary_to, :skills, :where, :job_level ) )
        if @job.save!
            flash[:notice] = 'Vaga criada com sucesso'
            redirect_to @job
        else
            render :new
        end
    end

    def show
    end

    private

    def authorize_headhunter
        redirect_to root_path unless current_headhunter
    end

    def set_job
        @job = Job.find(params[:id])
    end
end