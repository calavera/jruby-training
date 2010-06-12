class Person < Neo4j::Model
  property :name

  has_n :friends

  validates_presence_of :name

  def self.create(name)
    person = Person.new
    person.name = name
    person.save
    person
  end

  def self.find_by_name(name)
    Neo4j::Transaction.run do
      Person.find(:name => name)
    end
  end

  def self.know_each_other(first, second)
    first.friends << second
    second.friends << first
  end

  def find_separation(person)
    return -1 if self == person
    1.upto(6) do |degree|
      self.friends.depth(degree).each do |rel| 
        return degree if rel == person
      end
    end
    return 0
  end
end
