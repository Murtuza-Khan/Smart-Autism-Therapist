class Hotel {
  String? imageUrl;
  String? name;
  String? address;
  int? price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/dashboard_and_doctor_details/doctors_images/h0.jpg',
    name: 'Hospital 1',
    address: 'Karachi',
    price: 5000,
  ),
  Hotel(
    imageUrl: 'assets/dashboard_and_doctor_details/doctors_images/h1.jpg',
    name: 'Hospital 2',
    address: 'Karachi',
    price: 5500,
  ),
  Hotel(
    imageUrl: 'assets/dashboard_and_doctor_details/doctors_images/h2.jpg',
    name: 'Hospital 3',
    address: 'Karachi',
    price: 6000,
  ),
];
