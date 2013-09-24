module OpenNLP
  module SimplifiedModelLoading
    def load(path)
      raise ArgumentError, "File not found: #{path}" unless File.file?(path) and File.readable?(path)
      new Java::java.io.FileInputStream.new(path)
    end
  end
end
