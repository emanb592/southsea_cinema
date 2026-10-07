import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _selectedTickets = 0;
  

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
            SizedBox(height: 52),
            Text(
              'Southsea Cinema Room',
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            SizedBox(height: 28),
            Text(
              'Thursday 22 Oct 2026, 18:00 - ends at 19:14',
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            SizedBox(height: 68),
            Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            SizedBox(height: 28),
            Text(
              'Select Quantities (Up to 5 in total)',
              style: TextStyle(fontSize: 18, color: cinemaFontWhite),
            ),
            SizedBox(height: 60),
            Text(
              'Tickets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cinemaFontWhite,
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                DropdownMenu<int>(
                  initialSelection: 0,
                  width: 150,
                  onSelected: (value) {
                    setState(() {
                      _selectedTickets = value ?? 0;
                    });
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 0, label: '0'),
                    DropdownMenuEntry(value: 1, label: '1'),
                    DropdownMenuEntry(value: 2, label: '2'),
                    DropdownMenuEntry(value: 3, label: '3'),
                    DropdownMenuEntry(value: 4, label: '4'),
                    DropdownMenuEntry(value: 5, label: '5'),
                  ],
                ),
                SizedBox(width: 16),
                Text(
                  'Adult (£7.50)',
                  style: TextStyle(fontSize: 20, color: cinemaFontWhite),
                ),
              ],
            ),
            SizedBox(height: 44),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _orderMessage = _selectedTickets == 0
                      ? 'Please select at least one ticket.'
                      : '$_selectedTickets ticket${_selectedTickets == 1 ? '' : 's'} added to the order.';
                });
              },
              child: const Text('ADD TO ORDER'),
            ),
            SizedBox(height: 16),
            if (_orderMessage != null)
              Text(
                _orderMessage!,
                style: TextStyle(fontSize: 18, color: cinemaFontWhite),
              ),
          ],
        ),
      ),
    );
  }
}
