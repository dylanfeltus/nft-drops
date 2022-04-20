class Subscriber < ApplicationRecord
  validates_uniqueness_of :wallet
end
