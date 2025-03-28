import 'package:flutter/material.dart';
import 'package:myapp/models/city.dart';
import 'package:myapp/models/space.dart';
import 'package:myapp/models/tips.dart';
import 'package:myapp/providers/space_provider.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/widgets/bottom_navbar_item.dart';
import 'package:myapp/widgets/city_card.dart';
import 'package:myapp/widgets/space_card.dart';
import 'package:myapp/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang terbaik',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 24),
                  CityCard(City(
                      id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                  const SizedBox(width: 20),
                  CityCard(City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true)),
                  const SizedBox(width: 20),
                  CityCard(City(
                      id: 3, name: 'Surabaya', imageUrl: 'assets/city3.png')),
                  const SizedBox(width: 20),
                  CityCard(City(
                      id: 4, name: 'Palembang', imageUrl: 'assets/city4.png')),
                  const SizedBox(width: 20),
                  CityCard(City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true)),
                  const SizedBox(width: 20),
                  CityCard(
                      City(id: 6, name: 'Bogor', imageUrl: 'assets/city6.png')),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder<List<Space>>(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Column(
                      children: snapshot.data!.asMap().entries.map((entry) {
                        int index = entry.key;
                        Space space = entry.value;
                        return Container(
                          margin: EdgeInsets.only(top: index == 0 ? 0 : 30),
                          child: SpaceCard(space),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(child: Text('No recommended spaces found.'));
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updatedAt: '20 Apr')),
                  const SizedBox(height: 20),
                  TipsCard(Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageUrl: 'assets/tips2.png',
                      updatedAt: '11 Dec')),
                ],
              ),
            ),
            SizedBox(height: 100 + edge),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(imageUrl: 'assets/icon_home.png', isActive: true),
            BottomNavbarItem(
                imageUrl: 'assets/icon_email.png', isActive: false),
            BottomNavbarItem(imageUrl: 'assets/icon_card.png', isActive: false),
            BottomNavbarItem(imageUrl: 'assets/icon_love.png', isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
