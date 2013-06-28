require_relative "example_helper"

m = OpenNLP::Models.pos_tagging(:en)
t = OpenNLP::POSTagger.new(m)
r = t.process(%w[Ruby is awesome])

r[0] # => NNP
r[1] # => VBZ
r[2] # => JJ

