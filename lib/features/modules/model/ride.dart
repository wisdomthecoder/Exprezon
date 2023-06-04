class Ride {
  String driverName, carType, dateTime, from, to, paidFrom;
  double price;
  Ride({
    required this.driverName,
    required this.carType,
    required this.from,
    required this.to,
    required this.dateTime,
    required this.paidFrom,
    required this.price,
  });
}

Ride ride = Ride(
  driverName: 'Tenshak David',
  carType: 'Honda G4 2021',
  dateTime: 'Mon, Mar 23, 4:16',
  from: 'Shantong ICT Center, Lapap, Mangu',
  to: 'Mangu Local Education Authority Secretariat, Mangu',
  paidFrom: 'Wallet',
  price: 60.03,
);
