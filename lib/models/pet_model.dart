class PetModel {
  final String name;
  final String breed;
  final String type;
  final String age;
  final String gender;
  final String image;
  final String price;

  final String weight;
  final bool vaccinated;
  final bool friendly;
  final bool houseTrained;
  final bool goodWithCats;
  final String about;

  PetModel({
    required this.name,
    required this.breed,
    required this.type,
    required this.age,
    required this.gender,
    required this.image,
    required this.price,
    required this.weight,
    required this.vaccinated,
    required this.friendly,
    required this.houseTrained,
    required this.goodWithCats,
    required this.about,
  });
}