class SubjectsController < ApplicationController
    before_action :find_subject, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @subjects = Subject.all.order("created_at DESC")
    end
    def show
    end
    def new
        @subject = Subject.new
    end
    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @subject.update(subject_params)
            redirect_to action: "index"
        else
            render 'edit'
        end
    end
    def destroy
        @subject.destroy
        redirect_to action: "index"
    end
    private
    def subject_params
        params.require(:subject).permit(:name)
    end
    def find_subject
        @subject = Subject.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
