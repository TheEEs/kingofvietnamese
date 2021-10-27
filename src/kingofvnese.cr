require "./word_picker.cr"
require "json"
require "kemal"
require "./fs"

wp = WordPicker.new "./dicts/dict.txt"

serve_static false
#public_folder "./frontface" 

before_get "/word" do |env|
  env.response.content_type = "application/json"
end

get "/word" do
  wp.pick_a_random_word.to_json
end

get "/*path" do |env|
  print(env.params.url["path"])
  FileStorage.get(env.params.url["path"]).gets_to_end
end

get "/" do |env|
    FileStorage.get("index.html").gets_to_end 
end

Kemal.run
