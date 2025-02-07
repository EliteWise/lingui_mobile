import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lingui_mobile/views/image_gallery_page.dart';

import '../utils/Utils.dart';

class CountryFolderPage extends StatelessWidget {
  const CountryFolderPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> availableCountries = [
      "USA",
      "Canada",
      "France",
      "Germany",
      "Japan",
      "Australia",
      "Brazil",
      "India",
      "China",
      "Mexico",
      "Russia",
      "Italy",
      "Spain",
      "South Korea",
      "South Africa",
      "Argentina",
      "Netherlands",
      "Sweden",
      "New Zealand",
      "English",
      "Spanish",
      "German",
      "Chinese",
      "Japanese",
      "French",
      "Italian",
      "Portuguese",
      "Russian",
      "Korean",
      "Hindi",
      "Arabic",
      "Dutch",
      "Swedish",
      "Norwegian",
      "Danish",
      "Finnish",
      "Greek",
      "Turkish",
      "Polish",
      "Czech",
      "Hungarian",
      "Romanian",
      "Hebrew",
      "Thai",
      "Vietnamese",
      "Indonesian",
      "Malay",
      "Filipino"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums by Country"),
      ),
      body: GridView.builder(
        itemCount: availableCountries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              elevation: 3.0,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/600/400",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              availableCountries[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SvgPicture.asset(
                            getFlagAsset(availableCountries[index]),
                            package: 'country_icons',
                            width: 12,
                            height: 12,
                          ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const ImageGalleryPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var forwardTween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeInOut));

                    return FadeTransition(
                      opacity: animation.drive(forwardTween),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 0),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
