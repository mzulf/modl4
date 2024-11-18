import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Nasi Goreng',
      'category': 'Main Course',
      'duration': '20 min',
      'image': 'assets/nasi_goreng.jpg'
    },
    {
      'name': 'Soto Ayam',
      'category': 'Soup',
      'duration': '45 min',
      'image': 'assets/soto_ayam.jpg'
    },
    {
      'name': 'Mie Goreng',
      'category': 'Main Course',
      'duration': '15 min',
      'image': 'assets/mie_goreng.jpg'
    },
    {
      'name': 'Ayam Penyet',
      'category': 'Main Course',
      'duration': '30 min',
      'image': 'assets/ayam_penyet.jpg'
    },
    {
      'name': 'Es Teh Manis',
      'category': 'Beverage',
      'duration': '5 min',
      'image': 'assets/es_teh_manis.jpg'
    },
    {
      'name': 'Pudding Coklat',
      'category': 'Dessert',
      'duration': '10 min',
      'image': 'assets/pudding_coklat.jpg'
    },
  ];

  List<Map<String, dynamic>> filteredRecipes = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
    searchController.addListener(() {
      filterRecipes();
    });
  }

  void filterRecipes() {
    setState(() {
      filteredRecipes = recipes
          .where((recipe) => recipe['name']
          .toLowerCase()
          .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Resep Masakan',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari resep...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),

          // Feature Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FeatureButton(
                  icon: Icons.camera_alt,
                  label: 'Scan Bahan',
                  route: '/camera',
                ),
                FeatureButton(
                  icon: Icons.mic,
                  label: 'Rekam Resep',
                  route: '/microphone',
                ),
                FeatureButton(
                  icon: Icons.volume_up,
                  label: 'Dengar Resep',
                  route: '/speaker',
                ),
              ],
            ),
          ),

          // Recipe List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(recipe: filteredRecipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const FeatureButton({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => Get.toNamed(route),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(recipe['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          recipe['name'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${recipe['category']} • ${recipe['duration']}'),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
