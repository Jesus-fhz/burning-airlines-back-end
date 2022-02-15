Airplane.destroy_all

a1 = Airplane.create!(
    name: 'Airbus a380',
    rows: 6,
    columns: 20
)

a2 = Airplane.create!(
    name: 'Boeing 747',
    rows: 8,
    columns: 18
)

a3 = Airplane.create!(
    name: 'Airbus a320',
    rows: 4,
    columns: 10
)



Flight.destroy_all

f1 = Flight.create!(
    date_flight: "2022/03/10",
    origin: 'Sydney',
    destination: 'New York',
    airplane_id: a1.id
)

f2 = Flight.create!(
    date_flight: "2022/02/27",
    origin: 'Sydney',
    destination: 'Tokyo',
    airplane_id: a2.id
)

f3 = Flight.create!(
    date_flight: "2022/03/01",
    origin: 'Sydney',
    destination: 'London',
    airplane_id: a3.id
)

User.destroy_all

u1 = User.create!(
    name: 'Cassie Lee',
    email: 'cass@ga.co',
    password: 'chicken',
    admin: true
)

u2 = User.create!(
    name: 'Jesus Flores',
    email: 'jesus@ga.co',
    password: 'chicken',
    admin: true
)

u3 = User.create!(
    name: 'Steven Furnari',
    email: 'steven@ga.co',
    password: 'chicken',
    admin: true
)

u4 = User.create!(
    name: 'Luke Hammer',
    email: 'luke@ga.co',
    password: 'chicken',
    admin: false
)

Reservation.destroy_all

Reservation.create!(
    user_id: u1.id,
    flight_id: f1.id,
    row: 23,
    column: 3
)

Reservation.create!(
    user_id: u2.id,
    flight_id: f2.id,
    row: 20,
    column: 5
)

Reservation.create!(
    user_id: u3.id,
    flight_id: f3.id,
    row: 38,
    column: 4
)





