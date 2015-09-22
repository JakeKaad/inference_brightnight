class Relation
  @@all = []

  attr_reader :type, :subject, :object

  def initialize(type, subject, object)
    @type = type
    @subject = subject
    @object = object

    @@all << self
  end

  def self.all
    @@all
  end

  def describe
    "#{type} #{subject} are #{object}.".capitalize
  end

  def matches_attributes(type, subject, object)
    type == self.type && subject == self.subject && object == self.object
  end

  def self.get_subject(subject)
    @@all.select do |relation|
      relation.subject == subject
    end
  end

  def self.find(type, subject, object)
    @@all.select do |relation|
      relation.matches_attributes(type, subject, object)
    end
  end

  def subject_matches_object(relation)
    subject == relation.object
  end

  def create_inferred_relations
    if type == "all"
      @@all.select do |relation|
        if subject == relation.object
          Relation.new("all", relation.subject, object)
        end
      end
    end
  end
end
