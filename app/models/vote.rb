class Vote < RelaxDB::Document
  property :title
  property :url
  property :description

  property :created_at  
  
  belongs_to :link
end
