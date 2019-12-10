# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://positions.ideabroad.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # add '/', :changefreq => 'daily', :priority => 0.3
  # add '/home/aboutus'
  # add '/home/contact'
  # add '/home/career'
  # add posts_path, :priority => 0.7, :changefreq => 'weekly'
  add '/states'
  add '/states/new'
  add '/users'
  add '/scholarview'
  add '/singleposts'
  add '/keywords'
  add '/pages'

  Post.find_each do |post|
    add "/singleposts/#{post.title.gsub( " ", "-" )}", :lastmod => post.updated_at, :priority => 0.3, :changefreq => 'daily'
  end

  Scholarship.find_each do |scholarship|
    add "/singlescholarships/#{scholarship.title.gsub( " ", "-" )}", :lastmod => scholarship.updated_at, :priority => 0.3, :changefreq => 'daily'
  end

  Subject.find_each do |subject|
    add "/singlesubjects/#{subject.name.gsub( " ", "-" )}-scholarships", :lastmod => subject.updated_at, :priority => 0.3, :changefreq => 'daily'
  end

  State.find_each do |state|
    add "/country/Scholarships-in-#{state.name.gsub( " ", "-" )}", :lastmod => state.updated_at, :priority => 0.3, :changefreq => 'daily'
  end

  Education.find_each do |education|
    add "/scholarlevels/#{education.level.gsub( " ", "-" )}", :lastmod => education.updated_at, :priority => 0.3, :changefreq => 'daily'
  end

end
# SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
