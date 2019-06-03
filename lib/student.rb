class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    @student = student_hash.name
    
    @@all << self
  end 

  def self.create_from_collection(students_array)
    #the argument here is the students array from the Scraper class
    #this method should iterate over the array of hashes and create a new individual student using each hash using initialize 
    
  end

  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    
  end
end

