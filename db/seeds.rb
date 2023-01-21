require 'open-uri'

cities_rm = ["Alhué", "Buin", "Calera de Tango", "Cerrillos", "Cerro Navia", "Colina", "Conchalí", "Curacaví",
             "El Bosque", "El Monte", "Estación Central", "Huechuraba", "Independencia", "Isla de Maipo", "La Cisterna",
             "La Florida", "La Granja", "La Pintana", "La Reina", "Lampa", "Las Condes", "Lo Barnechea", "Lo Espejo",
             "Lo Prado", "Macul", "Maipú", "María Pinto", "Melipilla", "Ñuñoa", "Padre Hurtado", "Paine",
             "Pedro Aguirre Cerda", "Peñaflor", "Peñalolén", "Pirque", "Providencia", "Pudahuel", "Puente Alto",
             "Quilicura", "Quinta Normal", "Recoleta", "Renca", "San Bernardo", "San Joaquín", "San José de Maipo",
             "San Miguel", "San Pedro", "San Ramón", "Santiago", "Talagante", "Tiltil", "Vitacura"]

cities_valpo = ["Algarrobo", "Cabildo", "Calera", "Calle Larga", "Cartagena", "Casablanca", "Catemu", "Concón", "El Quisco",
                "El Tabo", "Hijuelas", "Isla de Pascua", "Juan Fernández", "La Cruz", "La Ligua", "Limache", "Llaillay", "Los Andes",
                "Nogales", "Olmué", "Panquehue", "Papudo", "Petorca", "Puchuncaví", "Putaendo", "Quillota", "Quilpué", "Quintero",
                "Rinconada", "San Antonio", "San Esteban", "San Felipe", "Santa María", "Santo Domingo", "Valparaíso", "Villa Alemana",
                "Viña del Mar", "Zapallar"]

puts "We're creating some data for the DB"

puts "Creating country"

Country.create!(name: "Chile")

puts "Creating regions"

Region.create!(name: "Metropolitana de Santiago", country_id: 1)
Region.create!(name: "Valparaíso", country_id: 1)

puts "Creating cities"

cities_rm.each do |city|
  City.create!(name: "#{city}", region_id: 1)
end

cities_valpo.each do |city|
  City.create!(name: "#{city}", region_id: 2)
end

puts "Creating users"

User.create!(email: "enrique.altamiros@gmail.com",
             password: "123456",
             first_name: "Enrique",
             last_name: "Altamirano",
             phone: "912345678",
             city_id: City.ids.sample)

User.create!(email: "ecardenas@uc.cl",
             password: "123456",
             first_name: "Edgar",
             last_name: "Cardenas",
             address: "Dalmacia 1268",
             phone: "987654321",
             city_id: 36)

User.create!(email: "kemack83@gmail.com",
             password: "123456",
             first_name: "Kevin",
             last_name: "Mackinlay",
             phone: "981827374",
             city_id: City.ids.sample)

User.create!(email: "rodriguezgon22@gmail.com",
             password: "123456",
             first_name: "Gonzalo",
             last_name: "Rodriguez",
             phone: "965748392",
             city_id: City.ids.sample)

puts "Creating freights"
Freight.create!(latitude: -33.444112169031214,
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
                user_id: 2)

Freight.create!(latitude: -70.91123,
                longitude: -53.15812,
                end_latitude: -53.162935958687655,
                end_logitude: -70.91691540483653,
                address: "Cabo De Hornos 0564, Punta Arenas",
                end_address: "Pasaje Balmaceda 383",
                description: "Traslado refrigerador dentro de punta arenas",
                start_date: DateTime.now + 15,
                receiver_name: "Alejandro Espina",
                receiver_phone: "93342432",
                round_trip: true,
                user_id: 2)

puts "Creating vehicles"

vehicle = Vehicle.create!(longitude: -70.55537333505826,
                          latitude: -33.38695477391817,
                          license_plate: "AABB11",
                          vehicle_type: "Camion liviano",
                          description: "Fletes en la zona oriente de Santiago",
                          covered: false,
                          load_capacity: 1500,
                          user_id: 1,
                          city_id: 45,
                          other_regions: true,
                          other_cities: true,
                          active: true)
vehicle.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/camion-liviano_gwszqr.jpg"), filename: 'camion-liviano.jpg', content_type: "image/png")
vehicle.save

vehicle = Vehicle.create!(longitude: -70.642254030843,
                          latitude: -33.45153400632955,
                          license_plate: "CCDD22",
                          vehicle_type: "Camioneta pick up",
                          description: "Fletes económicos en todo Santiago",
                          covered: false,
                          load_capacity: 1000,
                          user_id: 3,
                          city_id: 23,
                          other_regions: false,
                          other_cities: false,
                          active: true)
vehicle.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/pick-up_qwvbem.jpg"), filename: 'pick-up.jpg')
vehicle.save

vehicle = Vehicle.create!(longitude: -70.60416478421571,
                          latitude: -33.42738778640234,
                          license_plate: "AQWB66",
                          vehicle_type: "Camion liviano",
                          description: "Fletes en Providencia",
                          covered: true,
                          load_capacity: 1500,
                          user_id: 2,
                          city_id: 36,
                          other_regions: true,
                          other_cities: true,
                          active: true)
vehicle.photo.attach(io: URI.open("https://res.cloudinary.com/dibhw3luk/image/upload/v1673703551/camion-liviano-cerrado_pntugb.jpg"), filename: 'camion-liviano-cerrado.jpg')
vehicle.save

puts "Creating quotes"

Quote.create!(status: 0,
              amount: 15_000,
              comment: "Servicio garantizado",
              vehicle_id: 3,
              freight_id: 1,
              user_id: 3)

puts "Process completed"
