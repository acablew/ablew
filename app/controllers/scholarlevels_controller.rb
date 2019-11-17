class ScholarlevelsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        @scholarships = Scholarship.all
        @level_id = params[:level_id]
        @level = Education.find(@level_id);
        @scholarship_level = Array.new
        i=0
        for scholarship in @scholarships
            for education in scholarship.educations
                if education.level == @level.level
                    @scholarship_level[i] = scholarship
                    i=i+1
                end
            end
        end
    end
end
