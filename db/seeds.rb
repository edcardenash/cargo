cities_rm = [ "Alhué", "Buin", "Calera de Tango", "Cerrillos", "Cerro Navia", "Colina", "Conchalí", "Curacaví",
              "El Bosque", "El Monte", "Estación Central", "Huechuraba", "Independencia", "Isla de Maipo", "La Cisterna",
              "La Florida", "La Granja", "La Pintana", "La Reina", "Lampa", "Las Condes", "Lo Barnechea", "Lo Espejo",
              "Lo Prado", "Macul", "Maipú", "María Pinto", "Melipilla", "Ñuñoa", "Padre Hurtado", "Paine",
              "Pedro Aguirre Cerda", "Peñaflor", "Peñalolén", "Pirque", "Providencia", "Pudahuel", "Puente Alto",
              "Quilicura", "Quinta Normal", "Recoleta", "Renca", "San Bernardo", "San Joaquín", "San José de Maipo",
              "San Miguel", "San Pedro", "San Ramón", "Santiago", "Talagante", "Tiltil", "Vitacura" ]

cities_valpo = ["Algarrobo", "Cabildo", "Calera", "Calle Larga", "Cartagena", "Casablanca", "Catemu", "Concón",
                "El Quisco", "El Tabo", "Hijuelas", "Isla de Pascua", "Juan Fernández", "La Cruz", "La Ligua", "Limache",
                "Llaillay", "Los Andes", "Nogales", "Olmué", "Panquehue", "Papudo", "Petorca", "Puchuncaví", "Putaendo",
                "Quillota", "Quilpué", "Quintero", "Rinconada", "San Antonio", "San Esteban", "San Felipe", "Santa María",
                "Santo Domingo", "Valparaíso", "Villa Alemana", "Viña del Mar", "Zapallar"]

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
             city_id: City.id.sample)

User.create!(email: "ecardenas@uc.cl",
             password: "123456",
             first_name: "Edgar",
             last_name: "Cardenas",
             address: "Dalmacia 1268"
             phone: "987654321",
             city_id: 36)

User.create!(email: "kemack83@gmail.com",
             password: "123456",
             first_name: "Kevin",
             last_name: "Mackinlay",
             phone: "981827374",
             city_id: City.id.sample)

User.create!(email: "rodriguezgon22@gmail.com",
             password: "123456",
             first_name: "Gonzalo",
             last_name: "Rodriguez",
             phone: "965748392",
             city_id: City.id.sample)

puts "Creating freights"

Freight.create!(start_latitude: -33.444112169031214,
                start_longitude: -70.61500992121303,
                end_latitude: -33.38015931294505,
                end_logitude: -70.54204622760442,
                description: "Traslado de sofa y refrigerador desde Providencia a Vitacura"
                start_date:  DateTime.now + 15
                receiver_name: "Camilo Moreno"
                receiver_phone: "962671728"
                round_trip: false
                user_id: 2
)

puts "Proceso finalizado"
