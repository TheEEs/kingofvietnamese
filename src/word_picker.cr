class WordPicker
  @file_path : String
  @line_count : Int32

  def initialize(@file_path = "./dicts/dict.txt")
    file = FileStorage.get("dict.txt")
    @words = [] of String
    while line = file.gets
      @words << line
    end
    @line_count = @words.size
  end

  def self.shuffle(word)
    "/#{word.split("").reject!(&.===(" ")).shuffle.join("/")}/"
  end

  def pick_a_random_word
    original = @words[Random.rand(0...@line_count)]
    {original, self.class.shuffle(original)}
  end
end
