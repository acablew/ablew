class EducationsController < ApplicationController
    before_action :find_education, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @educations = Education.all.order("created_at DESC")
    end
    def show
    end
    def new
        @education = Education.new
    end
    def create
        @education = Education.new(education_params)
        if @education.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @education.update(education_params)
            redirect_to action: "index"
        else
            render 'edit'
        end
    end
    def destroy
        @education.destroy
        redirect_to action: "index"
    end
    private
    def education_params
        params.require(:education).permit(:level)
    end
    def find_education
        @education = Education.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
