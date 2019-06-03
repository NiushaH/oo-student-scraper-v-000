require 'open-uri'
require 'pry'

class Scraper
attr_accessor :name, :location, :profile_url

students = []

  def self.scrape_index_page(index_url)
    #array of hashes that represents a single student [hash, hash, hash]
    index_url = http://178.128.13.85:50977/fixtures/student-site/
    
    index_page = Nokogiri::HTML(open(index_url))
    student_array = []
    index_page.css(".roster-cards-container").each do |student|
      student.css(".student-card a").each do |info|
        student_name = info.css(".student-name").text
        student_location = info.css(".student-location").text
        student_profile = "#{info.attr('href')}"
        student_array << {:name => student_name, :location => student_location, :profile_url => student_profile}
      end
    end
    student_array
    
  end

  def self.scrape_profile_page(profile_url)
    #use Nokogiri and Open-URI to access page and RETURN hash that describes student
    
  end

end

