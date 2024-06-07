import 'package:flutter/material.dart';
import 'package:iconsaxapp/view/iconmap.dart';

import 'icon_container.dart';

class IconsaxView extends StatelessWidget {
  const IconsaxView({super.key});

  @override
  Widget build(BuildContext context) {
    final iconsmap = iconsaxMap;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;

          if (constraints.maxWidth >= 1200) {
            // For laptop
            crossAxisCount = 6;
          } else if (constraints.maxWidth >= 600) {
            // For tablet
            crossAxisCount = 4;
          } else {
            // For phone
            crossAxisCount = 2;
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1,
            ),
            itemCount: iconsmap.length,
            itemBuilder: (BuildContext context, int index) {
              String iconName = iconsmap.keys.elementAt(index);
              IconData? iconData = iconsmap[iconName];
              return AspectRatio(
                aspectRatio: 1 / 3,
                child: IconsContainer(
                  index: index,
                  iconName: iconName,
                  icon: iconData,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
