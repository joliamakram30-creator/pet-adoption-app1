import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/category_chip.dart';
import 'package:flutter_application_3/components/pet_card.dart';
import 'package:flutter_application_3/models/pet_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Selected category
  String selectedCategory = 'All pets';

  // Categories menu
  final List<String> categories = ['All pets', 'dogs', 'cats', 'rabbits'];

  // Pets data
  final List<PetModel> pets = [
    PetModel(
      name: 'Max',
      breed: 'Golden Retriever',
      type: 'dog',
      age: '4 Months',
      gender: 'Male',
      price: '\$150',
      weight: '12 lbs',
      vaccinated: true,
      friendly: true,
      houseTrained: true,
      goodWithCats: true,
      image: 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=500',
      about:
          'Max is an energetic and loving Golden Retriever looking for his forever home. He loves to play fetch, go for short walks, and cuddle on the couch. He is currently learning basic commands and doing great with his potty training. Max would thrive in an active home with lots of love to give.',
    ),

    PetModel(
      name: 'Riri',
      breed: 'Persian',
      type: 'cat',
      age: '1 Year',
      gender: 'Female',
      price: '\$130',
      weight: '5 lbs',
      vaccinated: true,
      friendly: true,
      houseTrained: true,
      goodWithCats: true,
      image:
          'https://images.unsplash.com/photo-1519052537078-e6302a4968d4?w=500',
      about:
          'Riri is a sweet and friendly Persian cat who loves attention and relaxing in a comfortable home.',
    ),

    PetModel(
      name: 'Chilly',
      breed: 'Golden Retriever',
      type: 'dog',
      age: '5 Months',
      gender: 'Male',
      price: '\$200',
      weight: '9 lbs',
      vaccinated: true,
      friendly: true,
      houseTrained: true,
      goodWithCats: true,
      image:
          'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500',
      about:
          'Chilly is a playful and friendly Golden Retriever who loves running, playing fetch, and spending time with people.',
    ),

    PetModel(
      name: 'Raby',
      breed: 'Rabbit',
      type: 'rabbit',
      age: '6 Months',
      gender: 'Female',
      price: '\$40',
      weight: '7 lbs',
      vaccinated: true,
      friendly: true,
      houseTrained: true,
      goodWithCats: true,
      image:
          'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=500',
      about:
          'Raby is a cute and gentle rabbit who loves quiet places, fresh food, and spending time with her family.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter pets according to selected category
    final List<PetModel> filteredPets;

    if (selectedCategory == 'All pets') {
      filteredPets = pets;
    } else if (selectedCategory == 'dogs') {
      filteredPets = pets.where((pet) {
        return pet.type == 'dog';
      }).toList();
    } else if (selectedCategory == 'cats') {
      filteredPets = pets.where((pet) {
        return pet.type == 'cat';
      }).toList();
    } else if (selectedCategory == 'rabbits') {
      filteredPets = pets.where((pet) {
        return pet.type == 'rabbit';
      }).toList();
    } else {
      filteredPets = pets;
    }

    return Scaffold(
      backgroundColor: const Color(0xfffff9f5),

      // =========================
      // DRAWER / SIDE MENU
      // =========================
      drawer: _buildDrawer(context),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: const Color(0xfffff9f5),
        elevation: 0,

        iconTheme: const IconThemeData(color: Color(0xff8b4d2e)),

        title: const Text(
          'PawPrint',
          style: TextStyle(
            color: Color(0xff8b4d2e),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // =========================
              // CATEGORIES
              // =========================
              SizedBox(
                height: 45,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,

                  itemCount: categories.length,

                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },

                  itemBuilder: (context, index) {
                    final String category = categories[index];

                    return CategoryChip(
                      title: category,

                      isSelected: selectedCategory == category,

                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // =========================
              // FIND A FRIEND
              // =========================
              const Text(
                'Find a friend',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3d2b22),
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // PETS GRID
              // =========================
              Expanded(
                child: filteredPets.isEmpty
                    ? const Center(
                        child: Text(
                          'No pets found',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        itemCount: filteredPets.length,

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,

                              childAspectRatio: 0.60,
                            ),

                        itemBuilder: (context, index) {
                          return PetCard(pet: filteredPets[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // DRAWER

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xfffff9f5),

      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // PAWPRINT TITLE
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 20),

              child: Text(
                'PawPrint',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8b4d2e),
                ),
              ),
            ),

            const Divider(height: 1),

            // USER PROFILE
            const Padding(
              padding: EdgeInsets.all(20),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,

                    backgroundColor: Color(0xffff9b62),

                    child: Icon(Icons.person, color: Colors.white, size: 32),
                  ),

                  SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Alex Miller',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Pet Enthusiast',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),

                      SizedBox(height: 3),

                      Text(
                        'Member since 2023',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            // HOME
            _drawerItem(
              context,
              icon: Icons.home,
              title: 'Home',
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // MY ADOPTIONS
            _drawerItem(
              context,
              icon: Icons.pets,
              title: 'My Adoptions',
              selected: false,
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('My Adoptions coming soon')),
                );
              },
            ),

            // SETTINGS
            _drawerItem(
              context,
              icon: Icons.settings,
              title: 'Settings',
              selected: false,
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings coming soon')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // DRAWER ITEM

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),

      child: ListTile(
        onTap: onTap,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

        tileColor: selected ? const Color(0xffff874d) : Colors.transparent,

        leading: Icon(
          icon,
          color: selected ? Colors.white : const Color(0xff3d2b22),
        ),

        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xff3d2b22),

            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
