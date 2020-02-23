# frozen_string_literal: true

require 'mysql2'
require 'wombat'

class KeywordScraper
  attr_reader :html, :instances

  include Wombat::Crawler
  def initialize(name)
    @name = name
    @instances = {}
    @html = {}
  end

  def crawl_site(site, site_path)
    @html = Wombat.crawl do
      base_url site
      path site_path

      instances 'css=#corpo', :html
    end
  end

  def track_instances
    doc = Nokogiri::HTML(@html['instances'])
    doc.xpath("//*[text()[contains(., \"#{@name}\")]]//ancestor::a").each do |node|
      @instances[node.attribute('href').value] = node.children.text
    end
  end
end
