class_list = [
  [ "First Class", 10 ],
  [ "Business Class", 6 ]
  [ "Economy", 3 ]
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
  [ "Eldoret International Airport", "Eldoret", "EDL", 20 ],
  [ "Moi International Airport", "Mombasa", "MBA", 19 ],
  [ "Jomo Kenyatta International Airport", "Nairobi", "NBO", 35 ],
  [ "Nnamdi Azikiwe International Airport", "Abuja", "ABV", 1 ],
  [ "Murtala Muhammed International Airport", "Lagos", "LOS", 2 ],
  [ "Port Harcourt International Airport", "Port Harcourt", "PHC", 3 ],
  [ "Akanu Ibiam International Airport", "Enugu", "ENU", 4 ],
  [ "Mallam Aminu Kano International Airport", "Kano", "KAN", 5 ],
  [ "Margaret Ekpo International Airport", "Calabar", "CBQ", 6 ],
  [ "Sadiq Abubakar III International Airport", "Sokoto", "SKO", 12 ],
  [ "Maiduguri International Airport", "Maiduguri", "MIU", 13 ],
  [ "Asaba International Airport", "Asaba", "ABB", 10 ],
  [ "Yakubu Gowon Airport", "Jos", "JOS", 7 ],
  [ "Kaduna Airport", "Kaduna", "KAD", 8 ],
  [ "Warri Airport", "Warri", "QRW", 10 ],
  [ "Zaria Airport", "Zaria", "ZAR", 8 ],
  [ "Sam Mbakwe Airport", "Owerri", "QOW", 9 ],
  [ "Ibadan Airport", "Ibadan", "IBA", 11 ],
  [ "Akure Airport", "Akure", "AKR", 14 ],
  [ "Ilorin Airport", "Ilorin", "ILR", 15 ],
  [ "Minna Airport", "Minna", "MXJ", 16 ],
  [ "Yola Airport", "Yola", "YOL", 17 ],
  [ "Amboseli Airport", "Amboseli", "ASV", 18 ],
  [ "Bamburi Airport", "Bamburi", "BMQ", 19 ],
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
  [ "Wilson Airport", "Nairobi", "WIL", 35 ],
  [ "Nakuru Airport", "Nakuru", "NUU", 36 ],
  [ "Nanyuki Airport", "Nanyuki", "NYK", 37 ],
  [ "Nyeri Airport", "Nyeri", "NYE", 38 ],
  [ "Samburu Airport", "Samburu", "UAS", 39 ],
  [ "Wajir Airport", "Wajir", "WJR", 40 ]
]

def iata(number)
  Airport.find(number).iata_code
end

3.times do |number|
  9.times do |kenya_number|
    Route.create(name: "#{iata(number)}-#{iata(kenya_number + 3)}",
                 arrival: number,
                 departure: kenya_number + 3)
    Route.create(name: "#{iata(kenya_number + 3)}-#{iata(number)}",
               arrival: kenya_number + 3,
               departure: number)
  end
end

47.times do |number|
  Route.create(name: "#{iata(number)}-#{iata(number + 1)}",
               arrival: number,
               departure: number + 1)
  Route.create(name: "#{iata(number + 1)}-#{iata(number)}",
               arrival: number + 1,
               departure: number)
end

class_list.each do |class|
  TravelClass.create(name: :class)
end

country_list.each do |country|
  Country.create(name: :country[0],
                 iso_code: :country[1],
                 country_code: :country[2])
end

state_list.each do |state|
  State.create(name: :state[0], country: :state[2])
end

airport_list.each do |airport|
  Airport.create(name: :airport[0], 
                 city: :airport[1],
                 iso_code: :airport[2],
                 state: :airport[3])
end

50.times do
  Aircraft.create(craft_no: "5N-#{Faker::Internet.password(4, 4).upcase}",
                  economy_capacity: Faker::Number.between(100, 250),
                  business_capacity: Faker::Number.between(0, 15),
                  first_capacity: Faker::Number.between(5, 10))
end

50.times do
  Aircraft.create(craft_no: "5Y-#{Faker::Internet.password(4, 4).upcase}",
                  economy_capacity: Faker::Number.between(100, 300),
                  business_capacity: Faker::Number.between(0, 20),
                  first_capacity: Faker::Number.between(6, 15))
end

54.times do |number|
  Airfare.create(service_charge_in_dollar: Faker::Number.between(700, 1200),
                 route: number,
                 class: 1)
  Airfare.create(service_charge_in_dollar: Faker::Number.between(520, 690),
                 route: number,
                 class: 2)
  Airfare.create(service_charge_in_dollar: Faker::Number.between(300, 500),
                 route: number,
                 class: 3)
end

94.times do |number|
  Airfare.create(service_charge_in_dollar: Faker::Number.between(117, 200),
                 route: number + 54,
                 class: 1)
  Airfare.create(service_charge_in_dollar: Faker::Number.between(93, 113),
                 route: number + 54,
                 class: 2)
  Airfare.create(service_charge_in_dollar: Faker::Number.between(60, 90),
                 route: number + 54,
                 class: 3)
end

seed_flight(1, 54, 3.hour, 6.hours)
seed_flight(55, 148, 1.hour, 2.hours)

def seed_flight(min_route, max_route, min_time, max_time)
  100.times do |number|
    fdate = Faker::Time.between(Date.today, 40.days.from_now, :all)
    farrival = Faker::Time.between(fdate + min_time, (fdate + max_time), :all)
    Flight.create(departure_date: fake_date,
                  arrival_date: fake_arrival,
                  aircraft: Faker::Number.between(1, 100),
                  route: Faker::Number.between(min_route, max_route))
  end
end