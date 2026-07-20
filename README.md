# video_thumbnail_gdx_plus

This maintained fork of [`video_thumbnail`](https://pub.dev/packages/video_thumbnail) generates image thumbnails from video files or URLs on Android and iOS. It returns an image in memory or saves it as a file with customizable format, resolution, and quality.

[![pub package](https://img.shields.io/pub/v/video_thumbnail_gdx_plus.svg)](https://pub.dev/packages/video_thumbnail_gdx_plus)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

![Video file thumbnail example](https://raw.githubusercontent.com/justsoft/video_thumbnail/refs/heads/master/video_file.png)
![Video URL thumbnail example](https://raw.githubusercontent.com/justsoft/video_thumbnail/refs/heads/master/video_url.png)

## Acknowledgements

This package is based on the original [`justsoft/video_thumbnail`](https://github.com/justsoft/video_thumbnail) project created by John Zhong. Credit remains with John Zhong and all original contributors. See [NOTICE](NOTICE), [LICENSE](LICENSE), and the preserved changelog for attribution and licensing details. This fork is independently maintained and is not presented as an official release of the original project.

## Methods
|function|parameter|description|return|
|--|--|--|--|
|thumbnailData|String `[video]`, optional Map<String, dynamic> `[headers]`, ImageFormat `[imageFormat]`(JPEG/PNG/WEBP), int `[maxHeight]`(0: for the original resolution of the video, or scaled by the source aspect ratio), [maxWidth]`(0: for the original resolution of the video, or scaled by the source aspect ratio), int `[timeMs]` generates the thumbnail from the frame around the specified millisecond, int `[quality]`(0-100)|generates thumbnail from `[video]`|`[Future<Uint8List>]`|
|thumbnailFile|String `[video]`, optional Map<String, dynamic> `[headers]`, String `[thumbnailPath]`(folder or full path where to store the thumbnail file, null to save to same folder as the video file), ImageFormat `[imageFormat]`(JPEG/PNG/WEBP), int `[maxHeight]`(0: for the original resolution of the video, or scaled by the source aspect ratio), int `[maxWidth]`(0: for the original resolution of the video, or scaled by the source aspect ratio), int `[timeMs]` generates the thumbnail from the frame around the specified millisecond, int `[quality]`(0-100)|creates a file of the thumbnail from the `[video]` |`[Future<String>]`|

Warning:
> Giving both the `maxHeight` and `maxWidth` has different result on Android platform, it actually scales the thumbnail to the specified maxHeight and maxWidth.
> To generate the thumbnail from a network resource, the `video` must be properly URL encoded.

## Usage

**Installing**
Add [video_thumbnail_gdx_plus](https://pub.dev/packages/video_thumbnail_gdx_plus) as a dependency in your `pubspec.yaml` file.
```yaml
dependencies:
  video_thumbnail_gdx_plus: ^0.5.7
```
**import**
```dart
import 'package:video_thumbnail_gdx_plus/video_thumbnail_gdx_plus.dart';
```
**Generate a thumbnail in memory from video file**
```dart
final uint8list = await VideoThumbnail.thumbnailData(
  video: videofile.path,
  imageFormat: ImageFormat.JPEG,
  maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  quality: 25,
);
```

**Generate a thumbnail file from video URL**
```dart
final fileName = await VideoThumbnail.thumbnailFile(
  video: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  thumbnailPath: (await getTemporaryDirectory()).path,
  imageFormat: ImageFormat.WEBP,
  maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
  quality: 75,
);
```

**Generate a thumbnail file from video Assets declared in pubspec.yaml**
```dart
final byteData = await rootBundle.load("assets/my_video.mp4");
Directory tempDir = await getTemporaryDirectory();

File tempVideo = File("${tempDir.path}/assets/my_video.mp4")
  ..createSync(recursive: true)
  ..writeAsBytesSync(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

final fileName = await VideoThumbnail.thumbnailFile(
  video: tempVideo.path,
  thumbnailPath: (await getTemporaryDirectory()).path,
  imageFormat: ImageFormat.PNG,  
  quality: 100,
);
```

## Notes
Issues and pull requests are welcome in the maintained repository. WebP thumbnail generation using libwebp on iOS may have a performance cost.

## Need help or a custom solution?

Need help integrating this package, maintaining an existing Flutter project, or building a custom web, mobile, or AI solution? Get in touch to discuss your requirements:

- [Contact Gurwinder DevX](https://gurwinderdevx.com/)
- [Hire me on Upwork](https://www.upwork.com/freelancers/gurwinderdevx)

## Author and support

Maintained by **Gurwinder Singh**, a full-stack web and mobile application developer and founder of [Gurwinder DevX](https://gurwinderdevx.com/).

- [GitHub](https://github.com/47gurvinder)
- [LinkedIn](https://www.linkedin.com/in/gurwinderdevx/)
- [Upwork](https://www.upwork.com/freelancers/gurwinderdevx)
- [Buy Me a Coffee](https://buymeacoffee.com/gurwinderdevx)

If this package helps your project, consider supporting its continued development through Buy Me a Coffee.
