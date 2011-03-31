class Tagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :tag #, :counter-cache => true
end
