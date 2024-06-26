import 'package:echofetch/features/pickup/models/waste_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WasteItemWidget extends StatelessWidget {
  WasteItemWidget({
    super.key,
    required this.wasteItem,
    required this.isSelected,
    required this.onTap,
  });
  final WasteItem wasteItem;
  final bool isSelected;
  final void Function(WasteItem) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(wasteItem);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                colors: [
                  wasteItem.color.withAlpha(255),
                  wasteItem.color.withAlpha(175),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    wasteItem.title,
                    style: GoogleFonts.lato(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₹${wasteItem.price.toStringAsFixed(0)}/kg',
                    style: GoogleFonts.lato(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isSelected,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.check_box,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
