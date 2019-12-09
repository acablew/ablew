#
# lib/tasks/sitemap.rake
#
namespace :sitemap do
  desc "generates the sitemap for the website"
  task :generate => :environment do 
    include ApplicationHelper

    SitemapGenerator::Sitemap.default_host = "http://scholars.ideabroad.com"
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
        add post_path(post), :lastmod => post.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Category.all.each do |category|
        add category_path(category), :lastmod => category.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Scholarship.all.each do |scholarship|
        add scholarship_path(scholarship), :lastmod => scholarship.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

      Page.all.each do |page|
        add page_path(page), :lastmod => page.updated_at, :priority => 0.3, :changefreq => 'daily'
      end

    end
    SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?
  end
end