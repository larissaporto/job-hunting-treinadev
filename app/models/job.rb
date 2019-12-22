class Job < ApplicationRecord

    enum job_level: { Estágio: 0, Júnior: 5, Pleno: 10, Sênior: 15, Especialista: 20, Diretor: 25 }

    def name
        Job.human_attribute_name("job_level.#{@job.job_level}")
    end


end
