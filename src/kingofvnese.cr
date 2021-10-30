require "./word_picker.cr"
require "json"
require "kemal"
require "mime"
require "./fs"

wp = WordPicker.new "./dicts/dict.txt"

if Kemal.config.env == "production"
  serve_static false
  get "/*path" do |env|
    env.response.content_type = MIME.from_filename(env.params.url["path"])
    FileStorage.get?(env.params.url["path"]).try &.gets_to_end
  end

  get "/" do |env|
    FileStorage.get?("index.html").try &.gets_to_end
  end
else
  public_folder "./frontface"
  get "/" do |env|
    File.read("./frontface/index.html")
  end
end

before_get "/word" do |env|
  env.response.content_type = "application/json"
end

get "/word" do
  wp.pick_a_random_word.to_json
end

Kemal.run
