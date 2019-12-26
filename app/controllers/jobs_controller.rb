class JobsController < ApplicationController
    before_action :authenticate_headhunter!, only: [:edit, :update, :created, :candidates]
    before_action :authenticate_applicant!, only: [:start]
    before_action :authorize_headhunter, only: [:edit, :update, :created, :candidates]
    before_action :authorize_applicant, only: [:start]
    before_action :set_job, only:[:show, :start, :candidates]

    def index 
        @jobs = Job.all
    end

    def new 
        @job = Job.new
    end

    def create
        @job = Job.new(params.require(:job).permit(:title, :description, :salary_from, :end_date,
                                                   :salary_to, :skills, :where, :job_level ) )
        @job.headhunter = current_headhunter
        if @job.save!
            flash[:notice] = 'Vaga criada com sucesso'
            redirect_to @job
        else
            render :new
        end
    end

    def show
    end

    def start
        @job.applies.create!(profile: current_applicant.profile)
        redirect_to controller: :applies, action: :edit, to_param => @job.applies
    end

    def created
        @jobs = Job.where(headhunter: current_headhunter)
    end

    def candidates
        @applies = Apply.where(job: @job)
    end

    private

    def authorize_headhunter
        redirect_to root_path unless current_headhunter
    end
    def authorize_applicant
        redirect_to root_path unless current_applicant
    end

    def set_job
        @job = Job.find(params[:id])
    end
end