class JobsController < ApplicationController
    before_action :authenticate_headhunter!, only: [:edit, :update, :created, :candidates, :end]
    before_action :authenticate_applicant!, only: [:start]
    before_action :authorize_headhunter, only: [:edit, :update, :created, :candidates, :end]
    before_action :authorize_applicant, only: [:start]
    before_action :set_job, only:[:show, :start, :candidates, :end]

    def index 
        @jobs = Job
                    .all
                    .order(created_at: :desc)
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
        @apply = @job.applies.create!(profile: current_applicant.profile)
        redirect_to edit_apply_path(@apply)
    end

    def created
        @jobs = Job.where(headhunter: current_headhunter)
    end

    def candidates
        @applies = Apply.where(job: @job)
    end

    def end
        @job.unavailable!
        @jobs = Job.where(headhunter: current_headhunter)
        redirect_to created_jobs_path(@jobs)
    end

    def search
        @jobs = Job
                .where('title like ?', "%#{params[:q]}%")
                .or(Job.where('description like ?', "%#{params[:q]}%"))
                .order(created_at: :desc)
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