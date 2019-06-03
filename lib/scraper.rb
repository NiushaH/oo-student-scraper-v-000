require 'open-uri'
require 'pry'

class Scraper
attr_accessor :name, :location, :profile_url

students = []

  def self.scrape_index_page(index_url)
    #array of hashes that represents a single student [hash, hash, hash]
    index_url = http://178.128.13.85:50977/fixtures/student-site/
    
    
  end

  def self.scrape_profile_page(profile_url)
    #use Nokogiri and Open-URI to access page and RETURN hash that describes student
    
  end

end

