class SinglescholarshipsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        # @country = Subject.find(params[:country])
        @scholarship = Scholarship.find(params[:id])
        @subjects = Subject.all
        @scholorships = Scholarship.all
        # @real_scholorships = Scholarship.where(state_id: @scholarship.state.id).paginate(page: params[:page], per_page:4)
        @institute_scholorships = Scholarship.where('institute_id': @scholarship.institute_id)
        # @education_scholorships = Scholarship.where('education_id': @scholarship.education_id)
        # @subject_scholorships = Scholarship.where('education_id': @scholarship.subject_id)


        i=0
        @real_scholarships = Array.new
        @subject_scholarships = Array.new
        @education_scholarships = Array.new
        for scholarship in @scholorships
            for state in scholarship.states
                for state2 in @scholarship.states
                    if state.id==state2.id
                        @real_scholarships[i]=scholarship
                        i = i+1
                        break
                    end
                end
            end
        end
        j=0
        for scholarship in @scholorships
            for subject in scholarship.subjects
                for subject2 in @scholarship.subjects
                    if subject.id==subject2.id

                        @subject_scholarships[j]=scholarship
                        j = j+1
                        break
                    end
                end
            end
        end
        k=0
        for scholarship in @scholorships
            for education in scholarship.educations
                for education2 in @scholarship.educations
                    if education.id==education2.id

                        @education_scholarships[k]=scholarship
                        k = k+1
                        break
                    end
                end
            end
        end
        @real_scholarships = @real_scholarships.uniq
        @subject_scholarships = @subject_scholarships.uniq
        @education_scholarships = @education_scholarships.uniq
    end
end
