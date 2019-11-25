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
      Post.all.each do |post|
        add post.path, lastmod: post.updated_at, changefreq: 'weekly', priority: 0.25
      end
    end
    SitemapGenerator::Sitemap.ping_search_engines if Rails.env.production?
  end
end