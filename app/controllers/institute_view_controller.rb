class InstituteViewController < ApplicationController
    layout "homelayout"
    def index
      if params[:institute_id].present?
        set_meta_tags title: params[:institute_id].gsub("-", " ")
      end
        @posts = Post.all
        # @country = Subject.find(params[:country])
        params[:institute_id]["Scholarships-at-"] = ""
        if params[:institute_id].to_s.split('-').count > 1
            params[:institute_id] = params[:institute_id].gsub("-", " ")
        end
        @institute_id = params[:institute_id]
        @subjects = Subject.all
        i=0
        id = Institute.where(name:@institute_id).first
        @scholorships = Scholarship.where(institute_id: id)
        @institute = Institute.where(name: params[:institute_id]).first
    end
end
