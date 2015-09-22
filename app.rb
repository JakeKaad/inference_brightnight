require './lib/infer_two_thousand'
require './lib/relation'
require 'talks'
require 'pry'

infer2000 = InferTwoThousand.new()

# Talks.say "Hello, my name is #{infer2000.name}", voice: 'pipe'
puts "Hello, my name is #{infer2000.name}"
puts "Teach me or ask me."

continue = "yes"
while continue == "yes"
  input = gets.chomp
  puts infer2000.interpret_statement(input)
end
