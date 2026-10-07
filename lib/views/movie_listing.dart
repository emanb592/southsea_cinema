import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int ticketQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: cinemaBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'THE ROCKY HORROR PICTURE SHOW (1975) (12A)',
              style: const TextStyle(
                color: cinemaFontWhite,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'Southsea Cinema Room',
              style: const TextStyle(color: cinemaFontWhite, fontSize: 20),
            ),
            const SizedBox(height: 28),
            Text(
              'Saturday 31 Oct 2026, 19:00 - ends at 20:40',
              style: const TextStyle(color: cinemaFontWhite, fontSize: 20),
            ),
            const SizedBox(height: 64),
            Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
              style: const TextStyle(color: cinemaFontWhite, fontSize: 20),
            ),
            const SizedBox(height: 32),
            Text(
              'Select Quantities (Up to 10 in total)',
              style: const TextStyle(color: cinemaFontWhite, fontSize: 20),
            ),
            const SizedBox(height: 56),
            const Text(
              'Tickets',
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 150,
                  color: cinemaFontWhite,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: ticketQuantity,
                      isExpanded: true,
                      dropdownColor: cinemaFontWhite,
                      iconEnabledColor: Colors.black,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      items: List.generate(
                        6,
                        (quantity) => DropdownMenuItem(
                          value: quantity,
                          child: Text('$quantity'),
                        ),
                      ),
                      onChanged: (quantity) {
                        if (quantity != null) {
                          setState(() => ticketQuantity = quantity);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Adult (£20)',
                  style: TextStyle(color: cinemaFontWhite, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: cinemaFontWhite,
              ),
              child: const Text('ADD TO ORDER'),
            ),
          ],
        ),
      ),
    );
  }
}
