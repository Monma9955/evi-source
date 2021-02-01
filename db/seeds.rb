# 重複してデータを入れられないように対処
if Post.count == 0
  require './db/seeds/post.rb'
  require './db/seeds/evidence.rb'
end