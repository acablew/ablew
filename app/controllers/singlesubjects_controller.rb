class SinglesubjectsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        @scholarships1 = Scholarship.all
        i=0

        params[:subject]["-scholarships"] = ""

        @subject_name = params[:subject]

        if @subject_name.to_s.split('-').count > 1
            @subject_name["-"] = " "
        end
        @subject = Subject.where('name':@subject_name).first
        @scholarships = Array.new
        @educations = Education.all

        for scholarship in @scholarships1
            for subject in scholarship.subjects
                if subject.name == @subject.name
                    @scholarships[i] = scholarship
                end
            end
        end
        @subjects = Subject.all
    end
end
