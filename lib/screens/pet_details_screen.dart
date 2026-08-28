import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/pet_model.dart';

class PetDetailsScreen extends StatelessWidget {
  final PetModel pet;

  const PetDetailsScreen({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff9f5),

      body: SafeArea(
        child: Column(
          children: [
            // Image
            Stack(
              children: [
                SizedBox(
                  height: 390,
                  width: double.infinity,
                  child: Image.network(
                    pet.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.pets,
                          size: 80,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                // Back button
                Positioned(
                  top: 15,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // Favorite button
                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),

            // Details
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                pet.name,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                pet.breed,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [
                            Text(
                              pet.price,
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffe46d2c),
                              ),
                            ),

                            const Text(
                              'Adoption Fee',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Age / Gender / Weight
                    Row(
                      children: [
                        Expanded(
                          child: _InfoBox(
                            title: 'Age',
                            value: pet.age,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _InfoBox(
                            title: 'Gender',
                            value: pet.gender,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: _InfoBox(
                            title: 'Weight',
                            value: pet.weight,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Pet Info
                    const Text(
                      'Pet Info',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        if (pet.vaccinated)
                          _Tag(
                            icon: Icons.vaccines,
                            text: 'Vaccinated',
                          ),

                        if (pet.friendly)
                          _Tag(
                            icon: Icons.sentiment_satisfied,
                            text: 'Friendly',
                          ),

                        if (pet.houseTrained)
                          _Tag(
                            icon: Icons.home,
                            text: 'House Trained',
                          ),

                        if (pet.goodWithCats)
                          _Tag(
                            icon: Icons.pets,
                            text: 'Good with Cats',
                          ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // About
                    Text(
                      'About ${pet.name}',
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      pet.about,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Rescue Center
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffffeee4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.storefront,
                              color: Color(0xffe46d2c),
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Happy Paws Rescue',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '2.5 miles away',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.phone,
                                color: Color(0xffe46d2c),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Adopt button
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            10,
            20,
            15,
          ),
          child: SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.pets,
                color: Colors.white,
              ),
              label: Text(
                'Adopt ${pet.name}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffff7f45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Info box
class _InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Info tag
class _Tag extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Tag({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffffeee4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: const Color(0xffc96b3d),
          ),

          const SizedBox(width: 5),

          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xffa65b34),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}