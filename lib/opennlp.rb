require_relative "opennlp/version"
require_relative "../vendor/apache-opennlp/lib/opennlp-tools-1.5.3.jar"

module OpenNLP

  module SimplifiedModelLoading
    def load(path)
      raise ArgumentError, "File not found" unless File.file?(path) and File.readable?(path)
      new Java::java.io.FileInputStream.new(path)
    end
  end

  module Models
    class << self

      def sentence_detection(language)
        SentenceModel.load(build_file_name_from_type_and_language(:sentence_detection, language))
      end

      def tokenization(language)
        TokenizerModel.load(build_file_name_from_type_and_language(:tokenization, language))
      end

      def pos_tagging(language)
        POSModel.load(build_file_name_from_type_and_language(:pos_tagging, language))
      end

      def named_entity_recognition(language, entity_type)
        TokenNameFinderModel.load(build_file_name_from_type_and_language(:named_entity_recognition, language, entity_type))
      end

      private

        def build_file_name_from_type_and_language(type, *args)
          File.expand_path("../../support/models/#{type}/#{args.join("-")}.bin", __FILE__)
        end

    end
  end

  SentenceModel = Java::opennlp.tools.sentdetect.SentenceModel
  SentenceModel.extend(SimplifiedModelLoading)
  SentenceDetector = Java::opennlp.tools.sentdetect.SentenceDetectorME

  class SentenceDetector

    def process(text)
      sent_detect(text).to_a
    end

  end

  TokenizerModel = Java::opennlp.tools.tokenize.TokenizerModel
  TokenizerModel.extend(SimplifiedModelLoading)
  Tokenizer = Java::opennlp.tools.tokenize.TokenizerME

  class Tokenizer

    def process(sentence)
      tokenize(sentence).to_a
    end

  end

  POSModel = Java::opennlp.tools.postag.POSModel
  POSModel.extend(SimplifiedModelLoading)
  POSTagger = Java::opennlp.tools.postag.POSTaggerME

  class POSTagger

    def process(tokens)
      tokens = Array(tokens).map(&:to_s).to_java(:string)
      tag(tokens).to_a
    end

  end

  TokenNameFinderModel = Java::opennlp.tools.namefind.TokenNameFinderModel
  TokenNameFinderModel.extend(SimplifiedModelLoading)
  NameFinder = Java::opennlp.tools.namefind.NameFinderME

  class NameFinder

    def process(tokens)
      find(Array(tokens).to_java(:string)).to_a.map do |span|
        span.start ... span.end
      end
    end

  end

  ChunkerModel = Java::opennlp.tools.chunker.ChunkerModel
  ChunkerModel.extend(SimplifiedModelLoading)
  ChunkerME = Java::opennlp.tools.chunker.ChunkerME

  class Chunker

    def process(tokens, pos_tags)
      chunk(tokens, tags).to_a
    end

  end

end
