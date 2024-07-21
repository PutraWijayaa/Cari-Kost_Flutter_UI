import 'package:flutter/material.dart';
import 'package:myapp/models/space.dart';

class SpaceProvider with ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    // Fetch the data from an API or a local source
    // Here’s a mock implementation:
    await Future.delayed(const Duration(seconds: 2)); // Simulating network delay
    var space = Space(
        id: 1,
        name: 'Space 1',
        imageUrl: 'assets/space1.png',
        city: 'City 1',
        price: 1000,
        rating: 4,
        country: '',
        mapUrl: '',
        address: '',
        numberOfBedrooms: 2,
        numberOfCupboards: 2,
        numberOfKitchens: 2,
        phone: '',
        photos: []);
    return [
      space,
      Space(
          id: 2,
          name: 'Space 2',
          imageUrl: 'assets/space2.png',
          city: 'City 2',
          price: 1500,
          rating: 4,
          country: '',
          address: '',
          mapUrl: '',
          numberOfBedrooms: 1,
          numberOfCupboards: 1,
          numberOfKitchens: 1,
          phone: '',
          photos: []),
    ];
  }
}
