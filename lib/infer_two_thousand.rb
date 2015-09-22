class InferTwoThousand
  attr_reader :name

  def initialize
    @name = "Infer2000"
  end

  def interpret_statement(input)
    input.downcase!
    if input.include? "?"
      query(input)
    elsif input.include? "describe"
      describe(input)
    else
      teach(input)
    end
  end

  def teach(input)
    words = input.split(" ")
    relation = Relation.new(words[0], words[1], words[3])
    relation.create_inferred_relations
    "Ok"
  end

  def query(input)
    words = input.gsub("?", "").split(" ")
    type = words[1]
    subject = words[2]
    object = words[3]

    relation = Relation.find(type, subject, object).first
    # binding.pry
    if relation
      "Yes, #{relation.describe}"
    else
      "No"
    end
  end

  def describe(input)
    words = input.split(" ")
    subject = words.last
    descriptions = Relation.get_subject(subject)

    descriptions.map(&:describe).join(" ")
  end
end
