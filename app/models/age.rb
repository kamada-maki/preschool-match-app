class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '0歳' },
    { id: 2, name: '1〜2歳' },
    { id: 3, name: '3歳' },
    { id: 4, name: '4歳〜5歳' }
  ]
  include ActiveHash::Associations
  has_many :prices
end