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
    
    page = Nokogiri::HTML(open(profile_url))
    profile = {}
    
    social = page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
    social.each do |link|
      if link.include?("twitter")
        profile[:twitter] = link
      elsif link.include?("linkedin")
        profile[:linkedin] = link
      elsif link.include?("github")
        profile[:github] = link
      elsif link.include?(".com")
        profile[:blog] = link
      end
    end
    
    attributes_hash[:profile_quote] = scrape_page.css(".profile-quote").text
    attributes_hash[:bio] = scrape_page.css("div.description-holder p").text
    attributes_hash
  end

end

