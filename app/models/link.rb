class Link < RelaxDB::Document
  property :title
  property :url
  property :description
  property :votes_cache

  property :created_at  
  
  has_many :comments, :class=>'Comment'
  has_many :votes, :class=>'Vote'
end
