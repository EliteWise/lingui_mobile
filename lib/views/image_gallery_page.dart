import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/widgets/multi_select_list.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageGalleryPage extends StatefulWidget {
  const ImageGalleryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageGalleryPageState();

}

class _ImageGalleryPageState extends State<ImageGalleryPage> {

  List<String> listOfUrls = [
    "https://via.placeholder.com/600x400.png?text=Image+1",
    "https://via.placeholder.com/600x400.png?text=Image+1",
    "https://via.placeholder.com/600x400.png?text=Image+1",
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

  final ImagePicker picker = ImagePicker();

  Future<void> _addImage() async {
    final List<XFile>? images = await picker.pickMultiImage(limit: 4);
    if(images != null) {
      setState(() {
        for(var image in images) {
          listOfUrls.add("https://via.placeholder.com/600x400.png?text=Image+1"); // image.path
        }
      });
    }
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

    final ImagePicker picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 18),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.tune),
                    onPressed: () {
                      _selectCountry();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.image_outlined),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addImage,
                  )
                ],
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: listOfUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewPage(
                      imageUrls: listOfUrls,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: CachedNetworkImage(
                imageUrl: listOfUrls[index],
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const ImageViewPage({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
  }) : super(key: key);

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
