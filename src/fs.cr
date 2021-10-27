require "baked_file_system"

class FileStorage
  extend BakedFileSystem
  bake_folder "../dicts"
  bake_folder "../frontface"
end
