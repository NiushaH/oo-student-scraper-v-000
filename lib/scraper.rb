require 'open-uri'
require 'pry'

class Scraper
attr_accessor :name, :location, :profile_url

students = []

  def self.scrape_index_page(index_url)
    #array of hashes that represents a single student [hash, hash, hash]
    
    html = open(index_url)
    index = Nokogiri::HTML(html)
    # index_page = Nokogiri::HTML(open(index_url))

    student_array = []
    index.css(".student-card a").each do |student| 
      student_hash = {
        :name => student.css(".student-name").text,
        :location => student.css(".student-location").text,
        :profile_url => student.attribute("href").value}
        student_array << student_hash
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    #use Nokogiri and Open-URI to access page and RETURN hash that describes student

    # profile_url = :profile_url
    
    scraped_student = Nokogiri::HTML(open(profile_url))
    attributes_hash = {}
    profile_page = scraped_student.css(".social-icon-container a").collect do |social|
      social.attribute("href").value
    end
    
    links = profile_page.css('.social-icon-container a').collect {|link| link.attr('href')}
    links.each do |link|
      link.include?('twitter')? attributes_hash[:twitter] = link : ""
      link.include?('github')? attributes_hash[:github] = link : ""
      link.include?('linkedin')? attributes_hash[:linkedin] = link : ""
      !link.include?('twitter') && !link.include?('github') && !link.include?('linkedin')? attributes_hash[:blog] = link : ""
    end 
    
    attributes_hash[:profile_quote] = scrape_page.css(".profile-quote").text
    attributes_hash[:bio] = scrape_page.css("div.description-holder p").text
    attributes_hash
  end

end

