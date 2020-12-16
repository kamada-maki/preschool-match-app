class Category <  ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '認可保育園'},
    { id: 3, name: '認可外保育園（企業主導型）'},
    { id: 4, name: '認可外保育園'},
    { id: 5, name: '認定こども園'},
  ]
  include ActiveHash::Associations
  has_many :preschools
end
