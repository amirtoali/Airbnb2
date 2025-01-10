# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# Assuming you have 12 images in total (airbnb1.webp to airbnb12.webp)
description = <<~HELLO 
<div class="_1tyq5tj">
<h1 class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 dir dir-ltr" tabindex="-1">About this space</h1>
</div>
<div class="_tp3sbt">
<section><span class="l1h825yc atm_kd_19r6f69_24z95b atm_kd_19r6f69_1xbvphn_1oszvuo dir dir-ltr"> Our studio apartment opens up onto a 40sq meter balcony with a panoramic view of the Hout Bay Valley and the Helderberg mountains beyond. Large sliding doors disappear into the walls creating an unimpeded indoor/outdoor flow while the elevated position protects your privacy. The open plan bathroom faces onto an enclosed secret garden which includes a frame-less glass shower. The unit has a fully equipped kitchenette and is serviced daily except weekends and public holidays. </span></section>
</div>
<div class="_tp3sbt">
<section>
<div class="_gt7myn">
<h2 class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 dir dir-ltr" tabindex="-1">The space</h2>
</div>
<span class="l1h825yc atm_kd_19r6f69_24z95b atm_kd_19r6f69_1xbvphn_1oszvuo dir dir-ltr"> There is a secret garden leading off the bathroom. The front of the studio has glass doors which are seamless and disappear when open into cavity walls. The studio is protected with external beams ensuring your safety. The best of all are the views which are unsurpassed and just simply outrageously beautiful. There is a gas barbeque on a wide patio with outside furniture </span></section>
</div>
<div class="_tp3sbt">
<section>
<div class="_gt7myn">
<h2 class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 dir dir-ltr" tabindex="-1">Guest access</h2>
</div>
<span class="l1h825yc atm_kd_19r6f69_24z95b atm_kd_19r6f69_1xbvphn_1oszvuo dir dir-ltr"> This is a stand alone unit and you will have access to the entire studio and surrounding garden </span></section>
</div>
<div class="_tp3sbt">
<section>
<div class="_gt7myn">
<h2 class="hpipapi atm_7l_1kw7nm4 atm_c8_1x4eueo atm_cs_1kw7nm4 atm_g3_1kw7nm4 atm_gi_idpfg4 atm_l8_idpfg4 atm_kd_idpfg4_pfnrn2 dir dir-ltr" tabindex="-1">Other things to note</h2>
</div>
<span class="l1h825yc atm_kd_19r6f69_24z95b atm_kd_19r6f69_1xbvphn_1oszvuo dir dir-ltr"> We have solar and battery power so are not affected by power outages. <br /> There are beautiful mountain walks outside our back gate, which take you to a view point overlooking Llundudno. We are approximately 15 minutes from the city but enjoy a village atmosphere. There are some spectacular wine farms in the close vicinity </span></section>
</div>
HELLO
total_images = 12
user = User.create(email:"amir1@gmail.com", password: "123456")
5.times do |i|
  # Create a new property
  property = Property.create(
    name: Faker::Lorem.unique.sentence(word_count: 3),
    headline: Faker::Lorem.paragraph(sentence_count: 6),
    description: description,
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.building_number,
    city: Faker::Address.city,
    state: Faker::Address.state,
    countroy: Faker::Address.country,
    price: Money.from_amount(5000, "PKR")
  )

  # Attach images based on the property index
  if i.even?
    (1..6).each do |j| # Attach images 1 to 6 for even indices
      property.images.attach(io: File.open("app/assets/images/airbnb#{j}.webp"), filename: "airbnb#{j}.webp")
    end
  else
    (7..12).each do |j| # Attach images 7 to 12 for odd indices
      property.images.attach(io: File.open("app/assets/images/airbnb#{j}.webp"), filename: "airbnb#{j}.webp")
    end
  end
  ((5..10).to_a.sample).times do 
  Review.create(
     content: Faker::Lorem.paragraph(sentence_count: 6), 
     cleanliness_rating: (1..5).to_a.sample,
     accuracy_rating: (1..5).to_a.sample,
     checkin_rating: (1..5).to_a.sample,
     communication_rating: (1..5).to_a.sample,
     location_rating: (1..5).to_a.sample,
     value_rating: (1..5).to_a.sample, 
     property:  property,
     user: user
    ) 
end
end
