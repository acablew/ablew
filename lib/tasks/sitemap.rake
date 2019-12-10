#
# lib/tasks/sitemap.rake
#
namespace :sitemap do
  desc "generates the sitemap for the website"
  task :generate => :environment do 
    include ApplicationHelper

    SitemapGenerator::Sitemap.default_host = "https://positions.ideabroad.com"
    SitemapGenerator::Sitemap.create do

  
      # PostCategory.all.each do |pc|
      #   add pc.path, lastmod: pc.updated_at, changefreq: 'weekly', priority: 0.50
      # end

      add '/states'
      add '/states/new'
      add '/users'
      add '/scholarview'
      add '/singleposts'
      add '/keywords'
      add '/pages'


  
      Post.all.each do |post|
        add "/singleposts/#{post.title.gsub( " ", "-" )}", :lastmod => post.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Scholarship.all.each do |scholarship|
        add "/singlescholarships/#{scholarship.title.gsub( " ", "-" )}", :lastmod => scholarship.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Subject.all.each do |subject|
        add "/singlesubjects/#{subject.name.gsub( " ", "-" )}-scholarships", :lastmod => subject.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      State.all.each do |state|
        add "/country/Scholarships-in-#{state.name.gsub( " ", "-" )}", :lastmod => state.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Education.all.each do |education|
        add "/scholarlevels/#{education.level.gsub( " ", "-" )}", :lastmod => education.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

    end
    SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?
  end
end