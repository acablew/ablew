class InstitutesController < ApplicationController
    before_action :find_institute, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @institutes = Institute.all.order("created_at DESC")
    end
    def show
    end
    def new
        @institute = Institute.new
    end
    def create
        @institute = Institute.new(institute_params)
        if @institute.save
            redirect_to @institute, notice: "The institute was created!"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @institute.update(institute_params)
            redirect_to @institute, notice: "Update successful"
        else
            render 'edit'
        end
    end
    def destroy
        @scholarships = Scholarship.where(institute_id: @institute.id)
        @scholarships.each do |scholarship|
            scholarship.destroy
        end
        @institute.destroy
        redirect_to @institute, notice: "Institute destroyed"
    end
    private
    def institute_params
        params.require(:institute).permit(:name, :state_id)
    end
    def find_institute
        @institute = Institute.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
