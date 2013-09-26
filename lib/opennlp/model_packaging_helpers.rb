module OpenNLP
  module ModelPackagingHelpers
    module SentenceDetection
      def sentence_detection_model
        SentenceModel.load(File.join(root, 'support', 'sentence_detection.bin'))
      end
    end

    module Tokenization
      def tokenization_model
        TokenizerModel.load(File.join(root, 'support', 'tokenization.bin'))
      end
    end

    module PosTagging
      def pos_tagging_model
        POSModel.load(File.join(root, 'support', 'pos_tagging.bin'))
      end
    end

    module NamedEntityRecognition
      def named_entity_recognition_model(entity_type)
        TokenNameFinderModel.load(File.join(root, 'support', 'named_entity_recognition', "#{entity_type}.bin"))
      end
    end

    module Chunking
      def chunking_model
        ChunkerModel.load(File.join(root, 'support', 'chunking.bin'))
      end
    end
  end
end
