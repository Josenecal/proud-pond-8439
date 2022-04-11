require 'rails_helper'

RSpec.describe 'mechanics show' do

  it 'shows name, experience and rides being worked on' do
    mechanic_1 = Mechanic.create!(name: "Bill", years_experience: 12)
    park = AmmusementPark.create!(name: "Thunder Point", admission_cost: 15)
    ride_1 = Ride.create!(name: "Silly Swings", thrill_rating: 2, open: true)
    ride_2 = Ride.create!(name: "Billy's Pirate Adventure", thrill_rating: 7, open: true)
    ride_3 = Ride.create!(name: "The DOOM Tower", thrill_rating: 8, open: false)
    association_1 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_1.id)
    association_2 = MechanicRide.create!(mechanic_id: mechanic_1.id, ride_id: ride_3.id)

    visit "/mechanics/"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).to have_content(ride_1.name)

    expect(page).not_to have_content(ride_2.name) # Not working on this ride
    expect(page).not_to have_content(ride_3.name) # Only shows open rides
  end
end
