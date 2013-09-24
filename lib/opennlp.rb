require_relative "opennlp/version"
require_relative "opennlp/simplified_model_loading"
require_relative "../vendor/apache-opennlp/lib/opennlp-tools-1.5.3.jar"

module OpenNLP
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
  Chunker = Java::opennlp.tools.chunker.ChunkerME

  class Chunker
    def process(tokens, pos_tags)
      chunk(tokens, pos_tags).to_a
    end
  end
end

