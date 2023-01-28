require 'open-uri'

Quote.destroy_all
Freight.destroy_all
Vehicle.destroy_all
User.destroy_all
City.destroy_all
Region.destroy_all
Country.destroy_all

cities_rm = ["Alhué", "Buin", "Calera de Tango", "Cerrillos", "Cerro Navia", "Colina", "Conchalí", "Curacaví",
             "El Bosque", "El Monte", "Estación Central", "Huechuraba", "Independencia", "Isla de Maipo", "La Cisterna",
             "La Florida", "La Granja", "La Pintana", "La Reina", "Lampa", "Las Condes", "Lo Barnechea", "Lo Espejo",
             "Lo Prado", "Macul", "Maipú", "María Pinto", "Melipilla", "Ñuñoa", "Padre Hurtado", "Paine",
             "Pedro Aguirre Cerda", "Peñaflor", "Peñalolén", "Pirque", "Providencia", "Pudahuel", "Puente Alto",
             "Quilicura", "Quinta Normal", "Recoleta", "Renca", "San Bernardo", "San Joaquín", "San José de Maipo",
             "San Miguel", "San Pedro", "San Ramón", "Santiago", "Talagante", "Tiltil", "Vitacura"]

# cities_valpo = ["Algarrobo", "Cabildo", "Calera", "Calle Larga", "Cartagena", "Casablanca", "Catemu", "Concón", "El Quisco",
                # "El Tabo", "Hijuelas", "Isla de Pascua", "Juan Fernández", "La Cruz", "La Ligua", "Limache", "Llaillay", "Los Andes",
                # "Nogales", "Olmué", "Panquehue", "Papudo", "Petorca", "Puchuncaví", "Putaendo", "Quillota", "Quilpué", "Quintero",
                # "Rinconada", "San Antonio", "San Esteban", "San Felipe", "Santa María", "Santo Domingo", "Valparaíso", "Villa Alemana",
                # "Viña del Mar", "Zapallar"]

puts "We're creating some data for the DB"

puts "Creating country"

country = Country.create!(name: "Chile")

puts "Creating regions"

rm = Region.create!(name: "Metropolitana de Santiago", country: country)
# valpo = Region.create!(name: "Valparaíso", country: country)

puts "Creating cities"

cities_array = []

cities_rm.each do |city|
  cities_array << City.create!(name: "#{city}", region_id: rm.id)
end

# cities_valpo.each do |city|
#   City.create!(name: "#{city}", region_id: valpo.id)
# end

puts "Creating users"

user1 = User.create!(email: "enrique.altamiros@gmail.com",
                     password: "123456",
                     first_name: "Enrique",
                     last_name: "Altamirano",
                     phone: "912345678",
                     city: cities_array.sample)

user2 = User.create!(email: "ecardenas@uc.cl",
                     password: "123456",
                     first_name: "Edgar",
                     last_name: "Cardenas",
                     address: "Dalmacia 1268",
                     phone: "987654321",
                     city: cities_array.sample)

user3 = User.create!(email: "kemack83@gmail.com",
                     password: "123456",
                     first_name: "Kevin",
                     last_name: "Mackinlay",
                     phone: "981827374",
                     city: cities_array.sample)

user4 = User.create!(email: "rodriguezgon22@gmail.com",
                     password: "123456",
                     first_name: "Gonzalo",
                     last_name: "Rodriguez",
                     phone: "965748392",
                     city: cities_array.sample)

puts "Creating freights"

freight0 = Freight.create!(latitude: -33.444112169031214,
                           longitude: -70.61500992121303,
                           end_latitude: -33.38015931294505,
                           end_logitude: -70.54204622760442,
                           address: "Ricardo Lyon 3600",
                           end_address: "Escandinavia 1233",
                           description: "Traslado de sofa y refrigerador desde ñuñoa a las condes",
                           start_date: DateTime.now + 15,
                           receiver_name: "Camilo Moreno",
                           receiver_phone: "962671728",
                           round_trip: false,
                           user_id: user2.id)

freight = Freight.create!(latitude: -70.91123,
                          longitude: -53.15812,
                          end_latitude: -53.162935958687655,
                          end_logitude: -70.91691540483653,
                          address: "Cabo De Hornos 0564, Punta Arenas",
                          end_address: "Pasaje Balmaceda 383",
                          description: "Traslado refrigerador dentro de punta arenas",
                          start_date: DateTime.now + 15,
                          receiver_name: "Alejandro Espina",
                          receiver_phone: "93342432",
                          status: "active",
                          round_trip: true,
                          user_id: user1.id)

puts "Creating vehicles"

vehicle = Vehicle.create!(license_plate: "AABB11",
                          vehicle_type: "Camion liviano",
                          description: "Fletes en la zona oriente de Santiago",
                          covered: false,
                          load_capacity: 1500,
                          user_id: user1.id,
                          city: cities_array.sample,
                          other_regions: true,
                          other_cities: true,
                          active: true,
                          rating: 4.1,
                          alias: "El Camello")
vehicle.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/camion-liviano_gwszqr.jpg"), filename: 'camion-liviano.jpg', content_type: "image/png")
vehicle.save

vehicle = Vehicle.create!(license_plate: "CCDD22",
                          vehicle_type: "Camioneta pick up",
                          description: "Fletes económicos en todo Santiago",
                          covered: false,
                          load_capacity: 1000,
                          user_id: user1.id,
                          city: cities_array.sample,
                          other_regions: false,
                          other_cities: false,
                          active: true,
                          rating: 4.7,
                          alias: "La Llama")
vehicle.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/pick-up_qwvbem.jpg"), filename: 'pick-up.jpg')
vehicle.save

vehicle = Vehicle.create!(description: "Fletes baratos",
                          vehicle_type: "Camion",
                          covered: false,
                          load_capacity: 5000,
                          user_id: user2.id,
                          city: cities_array.sample,
                          other_regions: true,
                          other_cities: true,
                          active: true,
                          rating: 4.8,
                          alias: "El Tanque")
vehicle.photo.attach(io: URI.open("https://www.hino.cl/hino/site/artic/20210217/imag/foto_0000001820210217134541/XZU616_Galeria_1.jpg"), filename: 'camion.jpg')
vehicle.save

vehicle = Vehicle.create!(license_plate: "AAWW70",
                          vehicle_type: "Automovil",
                          description: "Fletes pequeños",
                          covered: true,
                          load_capacity: 500,
                          user_id: user2.id,
                          city: cities_array.sample,
                          other_regions: true,
                          other_cities: true,
                          active: true,
                          rating: 4.0,
                          alias: "La Hormiga")
vehicle.photo.attach(io: URI.open("https://latam-editorial.pxcrush.net/chileautos/general/editorial/corsa-8-d.jpg"), filename: 'automovil.jpg')
vehicle.save

vehicle1 = Vehicle.create!(license_plate: "AQWB66",
                           vehicle_type: "Camion liviano",
                           description: "Fletes en Providencia",
                           covered: true,
                           load_capacity: 1500,
                           user_id: user3.id,
                           city: cities_array.sample,
                           other_regions: true,
                           other_cities: true,
                           rating: 5.0,
                           alias: "El Bromas")
vehicle1.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/camion-liviano-cerrado_pntugb.jpg"), filename: 'camion-liviano-cerrado.jpg')
vehicle1.save

vehicle = Vehicle.create!(license_plate: "GTER43",
                          vehicle_type: "Mini camion",
                          description: "Fletes",
                          covered: true,
                          load_capacity: 1000,
                          user_id: user3.id,
                          city: cities_array.sample,
                          other_regions: false,
                          other_cities: true,
                          active: true,
                          rating: 4.2,
                          alias: "Zapato")
vehicle.photo.attach(io: URI.open("https://s3-sa-east-1.amazonaws.com/amotor.images/images/vehiculos/WhatsApp%20Image%202022-01-08%20at%2019-54-38%20(5).jpeg"), filename: 'mini-camion-cerrado.jpg')
vehicle.save

vehicle = Vehicle.create!(description: "Transporte a todas las regiones",
                          vehicle_type: "Camion",
                          covered: true,
                          load_capacity: 5000,
                          user_id: user4.id,
                          city: cities_array.sample,
                          other_regions: true,
                          other_cities: true,
                          active: true,
                          rating: 3.5,
                          alias: "Optimus")
vehicle.photo.attach(io: URI.open("https://www.hino.cl/hino/site/artic/20210218/imag/foto_0000001120210218112014/FD1121_Motor_potente_para_un_trabajo_continuo.jpg"), filename: 'camion-cerrado.jpg')
vehicle.save

vehicle8 = Vehicle.create!(license_plate: "CCDD22",
                           vehicle_type: "Camioneta",
                           description: "Fletes en todo Santiago",
                           covered: true,
                           load_capacity: 1000,
                           user_id: user4.id,
                           city: cities_array.sample,
                           other_regions: false,
                           other_cities: true,
                           active: true,
                           rating: 3.9,
                           alias: "Doña")
vehicle8.photo.attach(io: URI.open("https://acnews.blob.core.windows.net/imgnews/medium/NAZ_11c6a504359c4419b6aa818f14246ada.jpg"), filename: 'pick-up.jpg')
vehicle8.save

puts "Creating quotes"

quote1 = Quote.create!(status: 0,
                       amount: 15_000,
                       comment: "Servicio garantizado",
                       vehicle_id: vehicle1.id,
                       freight_id: freight.id,
                       user_id: user3.id)

quote2 = Quote.create!(status: 0,
                       amount: 25_000,
                       comment: "Te entregaremos todo a tiempo",
                       vehicle_id: vehicle8.id,
                       freight_id: freight0.id,
                       user_id: user4.id)

puts "Creating reviews"

Review.create!(rating: 5.0,
               quote_id: quote1.id,
               user_id: user1.id,
               vehicle_id: vehicle1.id,
               comment: "Excelente servicio")

Review.create!(rating: 3.5,
               quote_id: quote2.id,
               user_id: user2.id,
               vehicle_id: vehicle8.id,
               comment: "Todo bien")

puts "Process completed"
