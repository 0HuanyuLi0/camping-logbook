# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =======================
User.destroy_all

u1 = User.create!(
    name:'luke',
    email:'luke.com',
    password:'abc',
    isAdmin:false
)

u2 = User.create!(
    name:'like',
    email:'like.com',
    password:'abc',
    isAdmin:false
)

admin = User.create!(
    name:'admin',
    email:'admin',
    password:'abc',
    isAdmin:true
)



# =======================
Site.destroy_all

port_lincoln = Site.create!(
    name:'Port Lincoln Tourist Park',
    location:'11 Hindmarsh St, Port Lincoln SA 5606',
    coordinates:'-34.728110, 135.883642',
    price:35.00,
    link:'https://www.portlincolntouristpark.com.au/',
    powered:true,
    pets:true,
    description:"We have a wide range of both powered and unpowered campsites to choose from, most with outstanding views of Boston Bay. There is plenty to do whilst staying at Port Lincoln Tourist Park - enjoy free WIFI, access to our boat ramp, jetty and beach as well as the Parnkalla Walking Trail."
)

west_beach = Site.create!(
    name:'BIG4 West Beach Parks',
    location:'1 Military Rd, West Beach SA 5024',
    coordinates:'-34.947914, 138.505331',
    price:55.00,
    link:'http://westbeachparks.com.au/',
    powered:true,
    pets:true,
    description:"West Beach Parks is a world-class tourism, sport and recreation precinct, providing exceptional leisure experiences. We are responsible for managing the West Beach Recreation Reserve, an area of significant natural assets, and its commercial and community facilities including accommodation, boating, a coastal park, golfing, leisure and sports."
)

mt_wilson = Site.create!(
    name:'Cathedral Reserve Camping Grounds',
    location:'117 Mount Irvine Rd, Mount Wilson NSW 2786',
    coordinates:'-33.502008, 150.390370',
    price:0.00,
    link:"https://www.mtwilson.com.au/mt-wilson-progress-association/cathedral-reserve.html",
    powered:false,
    pets:true,
    description:"Camping is free and no booking is required. There are toilets, tank water (not suitable for drinking but can be boiled or used for other purposes), fireplaces, picnic tables and garbage bins. Remember to bring your own drinking water, firewood, warm clothes (it gets cold at night), toilet paper and your own camping gear. Dogs are allowed in the Mt Wilson Village and at Cathedral Reserve, however dogs are not allowed in the National Park adjacent to the reserve and village. So walks around the village are ok providing they are not into the National Park."
)

# =======================
Photo.destroy_all

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995382/CampingSites/mt_wilson_1_qsfksy.png',
    site_id:mt_wilson.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Spring',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995446/CampingSites/mt_wilson_2_dwnemi.png',
    site_id:mt_wilson.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995446/CampingSites/mt_wilson_3_kacn6d.png',
    site_id:mt_wilson.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995445/CampingSites/mt_wilson_4_lgz3na.png',
    site_id:mt_wilson.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995464/CampingSites/wt_beach_1_bvnwyv.png',
    site_id:west_beach.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://res.cloudinary.com/huanyuli/image/upload/v1661995464/CampingSites/wt_beach_2_hzpjfo.png',
    site_id:west_beach.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://www.portlincolntouristpark.com.au/wp-content/uploads/2022/08/7D2A0265-scaled.jpg',
    site_id:port_lincoln.id,
    isPublic:true,
    user_id:admin.id
)

Photo.create!(
    name:'Autumn',
    date:'2022/05/02',
    link:'https://www.portlincolntouristpark.com.au/wp-content/uploads/2022/07/waterfrotn-section2-scaled.jpg',
    site_id:port_lincoln.id,
    isPublic:true,
    user_id:admin.id
)




# =====================
List.destroy_all

l1 = List.create!(
    title:'Favorite',
    note:'hahaha',
    user_id:admin.id
)

l2 = List.create!(
    title:'Visted',
    note:'hahaha',
    user_id:admin.id
)

#=====================

l1.sites << west_beach << port_lincoln

l2.sites << west_beach << port_lincoln << mt_wilson

# ====================
Review.destroy_all

Review.create!(
    score:4.0,
    comment:"Goooooood",
    site_id:mt_wilson.id,
    user_id: u1.id
)

# ====================
Story.destroy_all

Story.create!(
    title:"test",
    content:"Gooooooooood",
    site_id:mt_wilson.id,
    user_id: u1.id
)

Story.create!(
    title:"test1",
    content:"Gooooooooood1",
    list_id:l1.id
)



