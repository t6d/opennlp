require_relative "example_helper"

m = OpenNLP::Models.sentence_detection(:en)
d = OpenNLP::SentenceDetector.new(m)
r = d.process <<-TEXT
Ruby is awesome. Ruby is great!
TEXT

r[0] # => "Ruby is awesome."
r[1] # => "Ruby is great!"

