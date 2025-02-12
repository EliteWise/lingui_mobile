import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/widgets/multi_select_list.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({super.key});

  @override
  State<StatefulWidget> createState() => _ImageGalleryPageState();

}

class _ImageGalleryPageState extends State<ImageGalleryPage> {

  List<String> listOfUrls = [
    "https://picsum.photos/600/400",
    "https://picsum.photos/600/400",
    "https://dummyimage.com/1080x1920/000/fff",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://w0.peakpx.com/wallpaper/265/481/HD-wallpaper-nature.jpg",
    "https://w0.peakpx.com/wallpaper/265/481/HD-wallpaper-nature.jpg",
    "https://w0.peakpx.com/wallpaper/265/481/HD-wallpaper-nature.jpg",
    "https://e0.pxfuel.com/wallpapers/163/906/desktop-wallpaper-beautiful-nature-with-girl-beautiful-girl-with-nature-and-moon-high-resolution-beautiful.jpg",
    "https://e0.pxfuel.com/wallpapers/163/906/desktop-wallpaper-beautiful-nature-with-girl-beautiful-girl-with-nature-and-moon-high-resolution-beautiful.jpg",
    "https://e0.pxfuel.com/wallpapers/163/906/desktop-wallpaper-beautiful-nature-with-girl-beautiful-girl-with-nature-and-moon-high-resolution-beautiful.jpg"
  ];

  List<String> personalUrls = [
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://w0.peakpx.com/wallpaper/265/481/HD-wallpaper-nature.jpg",
    "https://e0.pxfuel.com/wallpapers/163/906/desktop-wallpaper-beautiful-nature-with-girl-beautiful-girl-with-nature-and-moon-high-resolution-beautiful.jpg"
  ];

  bool showPersonalImages = false;

  final ImagePicker picker = ImagePicker();

  Future<void> _addImage() async {
    final List<XFile> images = await picker.pickMultiImage(limit: 4);
    setState(() {
      for(var image in images) {
        listOfUrls.add("https://picsum.photos/600/400"); // image.path
      }
    });
    }

  Future<void> _selectCountry() async {
    List<String> countries = [
      'USA',
      'Canada',
      'France',
      'Germany',
      'Japan',
    ];

    List<String> initiallySelected = [];

    final List<String>? selectedCountries = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Country'),
              content: MultiSelectList<String>(
                data: countries,
                selectedItems: initiallySelected,
                itemLabelBuilder: (country) => country,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, initiallySelected);
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> displayedUrls = showPersonalImages ? personalUrls : listOfUrls;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if(showPersonalImages) ...[
            const Icon(Icons.person, color: Colors.grey),
            const SizedBox(width: 8),
            ],
            Text(showPersonalImages ? "Your Gallery" : "Gallery"),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () {
                      _selectCountry();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.image_outlined),
                    onPressed: () {
                      setState(() {
                        showPersonalImages = !showPersonalImages;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addImage,
                  )
                ],
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: GridView.builder(
            key: ValueKey<bool>(showPersonalImages),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: displayedUrls.length + 1,
            itemBuilder: (context, index) {
              if(index == displayedUrls.length) {
                return GestureDetector(
                  onTap: () {
                    _addImage();
                  },
                  child: Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[700],
                        size: 50.0,
                      ),
                    ),
                  ),
                );
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageViewPage(
                        imageUrls: displayedUrls,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: displayedUrls[index],
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        )
      ),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ImageViewPage({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Image"),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageUrls.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(imageUrls[index]),
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
