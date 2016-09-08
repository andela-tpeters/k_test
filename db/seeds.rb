class_list = [
  "First Class",
  "Business Class",
  "Economy"
]

country_list = [
  [ "Nigeria", "NG", 234, "Naira", 315 ],
  [ "Kenya", "KE", 254, "Shilling", 101 ]
]

state_list = [
  [ "Abuja", 1 ],
  [ "Lagos", 1 ],
  [ "Rivers", 1 ],
  [ "Enugu", 1 ],
  [ "Kano", 1 ],
  [ "Cross River", 1 ],
  [ "Plateau", 1 ],
  [ "Kaduna", 1 ],
  [ "Imo", 1 ],
  [ "Delta", 1 ],
  [ "Oyo", 1 ],
  [ "Sokoto", 1 ],
  [ "Borno", 1 ],
  [ "Ondo", 1 ],
  [ "Kwara", 1 ],
  [ "Niger", 1 ],
  [ "Adamawa", 1 ],
  [ "Kajiado", 2 ],
  [ "Mombasa ", 2 ],
  [ "Uasin Gishu", 2 ],
  [ "Turkana", 2 ],
  [ "Garissa", 2 ],
  [ "Tana River", 2 ],
  [ "Kakamega", 2 ],
  [ "Kericho", 2 ],
  [ "Taita-Taveta", 2 ],
  [ "Elgeyo-Marakwet", 2 ],
  [ "Kisumu", 2 ],
  [ "Trans-Nzoia", 2 ],
  [ "Lamu", 2 ],
  [ "Marsabit", 2 ],
  [ "Kilifi", 2 ],
  [ "Mandera", 2 ],
  [ "Narok", 2 ],
  [ "Nairobi", 2 ],
  [ "Nakuru", 2 ],
  [ "Laikipia", 2 ],
  [ "Nyeri", 2 ],
  [ "Samburu", 2 ],
  [ "Wajir", 2 ],
 
]

airport_list = [
  [ "Nnamdi Azikiwe International Airport", "Abuja", "ABV", 1 ],
  [ "Murtala Muhammed International Airport", "Lagos", "LOS", 2 ],
  [ "Port Harcourt International Airport", "Port Harcourt", "PHC", 3 ],
  [ "Akanu Ibiam International Airport", "Enugu", "ENU", 4 ],
  [ "Mallam Aminu Kano International Airport", "Kano", "KAN", 5 ],
  [ "Margaret Ekpo International Airport", "Calabar", "CBQ", 6 ],
  [ "Yakubu Gowon Airport", "Jos", "JOS", 7 ],
  [ "Kaduna Airport", "Kaduna", "KAD", 8 ],
  [ "Asaba International Airport", "Asaba", "ABB", 10 ],
  [ "Warri Airport", "Warri", "QRW", 10 ],
  [ "Zaria Airport", "Zaria", "ZAR", 8 ],
  [ "Sam Mbakwe Airport ", "Owerri", "QOW", 9 ],
  [ "Ibadan Airport", "Ibadan", "IBA", 11 ],
  [ "Sadiq Abubakar III International Airport", "Sokoto", "SKO", 12 ],
  [ "Maiduguri International Airport", "Maiduguri", "MIU", 13 ],
  [ "Akure Airport", "Akure", "AKR", 14 ],
  [ "Ilorin Airport", "Ilorin", "ILR", 15 ],
  [ "Minna Airport", "Minna", "MXJ", 16 ],
  [ "Yola Airport", "Yola", "YOL", 17 ],
  [ "Amboseli Airport", "Amboseli", "ASV", 18 ],
  [ "Bamburi Airport", "Bamburi", "BMQ", 19 ],
  [ "Eldoret International Airport", "Eldoret", "EDL", 20 ],
  [ "Eliye Springs Airport", "Eliye Springs", "EYS", 21 ],
  [ "Garissa Airport", "Garissa", "GAS", 22 ],
  [ "Hola Airport", "Hola", "HOA", 23 ],
  [ "Kakamega Airport", "Kakamega", "GGM", 24 ],
  [ "Kalokol Airport", "Kalokol", "KLK", 21 ],
  [ "Kericho Airport", "Kericho", "KEY", 25 ],
  [ "Kilaguni Airport", "Kilaguni", "ILU", 26 ],
  [ "Kimwarer Airport", "Kimwarer", "KRV", 27 ],
  [ "Kisumu Airport", "Kisumu", "KIS", 28 ],
  [ "Kitale Airport", "Kitale", "KTL", 29 ],
  [ "Kiwayu Airport", "Kiwayu", "KWY", 30 ],
  [ "Manda Airport", "Lamu", "LAU", 30 ],
  [ "Lodwar Airport", "Lodwar", "LOK", 21 ],
  [ "Loiyangalani Airport", "Loiyangalani", "LOY", 31 ],
  [ "Malindi Airport", "Malindi", "MYD", 32 ],
  [ "Mandera Airport", "Mandera", "NDE", 33 ],
  [ "Marsabit Airport", "Marsabit", "RBT", 31 ],
  [ "Keekorok Airport", "Masai Mara", "MRE", 34 ],
  [ "Moi International Airport", "Mombasa", "MBA", 19 ],
  [ "Jomo Kenyatta International Airport", "Nairobi", "NBO", 35 ],
  [ "Wilson Airport", "Nairobi", "WIL", 35 ],
  [ "Nakuru Airport", "Nakuru", "NUU", 36 ],
  [ "Nanyuki Airport", "Nanyuki", "NYK", 37 ],
  [ "Nyeri Airport", "Nyeri", "NYE", 38 ],
  [ "Samburu Airport", "Samburu", "UAS", 39 ],
  [ "Wajir Airport", "Wajir", "WJR", 40 ]
]

class_list.each do |class|
  TravelClass.create( name: :class )
end

country_list.each do |country|
  Country.create( name: :country[0], iso_code: :country[1], country_code: :country[2] )
end

state_list.each do |state|
  State.create( name: :state[0], country: :state[2] )
end

airport_list.each do |airport|
  Airport.create( name: :airport[0], city: :airport[1], iso_code: :airport[2], state: :airport[3] )
end

100.times do
  Airport
end