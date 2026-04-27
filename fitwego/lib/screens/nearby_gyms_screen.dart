import 'package:flutter/material.dart';

import '../data/mock_gyms.dart';
import '../models/gym_model.dart';
import '../theme/app_theme.dart';
import '../widgets/gym_card.dart';

class NearbyGymsScreen extends StatefulWidget {
  const NearbyGymsScreen({super.key});

  @override
  State<NearbyGymsScreen> createState() => _NearbyGymsScreenState();
}

class _NearbyGymsScreenState extends State<NearbyGymsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Gym> get _filteredGyms {
    final normalizedQuery = _query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return mockGyms;
    }

    return mockGyms.where((gym) {
      return gym.name.toLowerCase().contains(normalizedQuery) ||
          gym.address.toLowerCase().contains(normalizedQuery) ||
          gym.tags.any((tag) => tag.toLowerCase().contains(normalizedQuery));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final gyms = _filteredGyms;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Gyms'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Browse gyms around you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Search by gym name, location, or training style.',
                style: TextStyle(color: AppTheme.textGrey),
              ),
              const SizedBox(height: 18),
              _SearchField(
                controller: _searchController,
                hintText: 'Search nearby gyms',
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: gyms.isEmpty
                    ? const _EmptyGymState()
                    : ListView.builder(
                        itemCount: gyms.length,
                        itemBuilder: (context, index) => GymCard(gym: gyms[index]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppTheme.textGrey),
        prefixIcon: const Icon(Icons.search_rounded, color: AppTheme.textGrey),
        filled: true,
        fillColor: AppTheme.cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _EmptyGymState extends StatelessWidget {
  const _EmptyGymState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_off_rounded, color: AppTheme.primaryBlue, size: 38),
            SizedBox(height: 12),
            Text(
              'No gyms match that search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try another gym name, area, or tag.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.textGrey),
            ),
          ],
        ),
      ),
    );
  }
}
