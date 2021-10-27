require "./spec_helper.cr"

describe WordPicker do
  it "should shuffle the given word" do
    word = "đụ má"
    another_word = WordPicker.shuffle(word)
    word.should_not eq another_word
    print(another_word)
  end

  it "picks a random word in the dictionary" do
    wp = WordPicker.new "./dicts/dict.txt"
    print(wp.pick_a_random_word)
  end
end
