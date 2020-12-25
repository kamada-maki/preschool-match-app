class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '大阪市都島区'},
    { id: 2, name: '大阪市福島区'},
    { id: 3, name: '大阪市此花区'},
    { id: 4, name: '大阪市西区'},
    { id: 5, name: '大阪市港区'},
    { id: 6, name: '大阪市大正区'},
    { id: 7, name: '大阪市天王寺区'},
    { id: 8, name: '大阪市浪速区'},
    { id: 9, name: '大阪市西淀川区'},
    { id: 10, name: '大阪市東淀川区'},
    { id: 11, name: '大阪市東成区'},
    { id: 12, name: '大阪市生野区'},
    { id: 13, name: '大阪市旭区'},
    { id: 14, name: '大阪市城東区'},
    { id: 15, name: '大阪市阿倍野区'},
    { id: 16, name: '大阪市住吉区'},
    { id: 17, name: '大阪市東住吉区'},
    { id: 18, name: '大阪市西成区'},
    { id: 19, name: '大阪市淀川区'},
    { id: 20, name: '大阪市鶴見区'},
    { id: 21, name: '大阪市住之江区'},
    { id: 22, name: '大阪市平野区'},
    { id: 23, name: '大阪市北区'},
    { id: 24, name: '大阪市中央区'},
    { id: 25, name: '堺市'},
    { id: 26, name: '岸和田市'},
    { id: 27, name: '豊中市'},
    { id: 28, name: '池田市'},
    { id: 29, name: '吹田市'},
    { id: 30, name: '泉大津市'},
    { id: 31, name: '高槻市'},
    { id: 32, name: '貝塚市'},
    { id: 33, name: '守口市'},
    { id: 34, name: '枚方市'},
    { id: 35, name: '茨城市'},
    { id: 36, name: '八尾市'},
    { id: 37, name: '泉佐野市'},
    { id: 38, name: '富田林市'},
    { id: 39, name: '寝屋川市'},
    { id: 40, name: '河内長野市'},
    { id: 41, name: '松原市'},
    { id: 42, name: '大東市'},
    { id: 43, name: '和泉市'},
    { id: 44, name: '箕面市'},
    { id: 45, name: '柏原市'},
    { id: 46, name: '羽曳野市'},
    { id: 47, name: '門真市'},
    { id: 48, name: '摂津市'},
    { id: 49, name: '高石市'},
    { id: 50, name: '藤井寺市'},
    { id: 51, name: '東大阪市'},
    { id: 52, name: '泉南市'},
    { id: 53, name: '四條畷市'},
    { id: 54, name: '交野市'},
    { id: 55, name: '大阪狭山市'},
    { id: 56, name: '阪南市'},
    { id: 57, name: '羽曳野市'},
    { id: 58, name: '三島郡'},
    { id: 59, name: '豊能郡'},
    { id: 60, name: '泉北郡'},
    { id: 61, name: '泉南郡'},
    { id: 62, name: '南河内郡'},
    { id: 63, name: '千早赤阪村'}
  ]
  include ActiveHash::Associations
  has_many :preschools
end
