class Comment < RelaxDB::Document    
  property :author
  property :body  

  property :created_at  
  
  belongs_to :link
end
