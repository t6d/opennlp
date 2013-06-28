require_relative "example_helper"

tokens = %w[This summer EuRuKo comes to Athens for two days on the 28th and 29th of June .]

m = OpenNLP::Models.named_entity_recognition(:en, :location)
f = OpenNLP::NameFinder.new(m)
ranges = f.process(tokens)
ranges.map { |r| tokens[r] } # => ["Athens"]

