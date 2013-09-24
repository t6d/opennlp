module OpenNLP
  module Models
    module SentenceDetection
      def sentence_detection
        SentenceModel.load(File.join(root, 'support', 'tokenization.bin'))
      end
    end

    module Tokenization
      def tokenization
        TokenizerModel.load(File.join(root, 'support', 'tokenization.bin'))
      end
    end

    module PosTagging
      def pos_tagging
        POSModel.load(File.join(root, 'support', 'pos_tagging.bin'))
      end
    end

    module NamedEntityRecognition
      def named_entity_recognition(entity_type)
        TokenNameFinderModel.load(File.join(root, 'support', 'named_entity_recognition', "#{entity_type}.bin"))
      end
    end
  end
end
