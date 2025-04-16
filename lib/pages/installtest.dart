import 'dart:io';

import 'package:flutter/material.dart';

class Installtest extends StatefulWidget {
  const Installtest({super.key});

  @override
  State<Installtest> createState() => _InstalltestState();
}

class _InstalltestState extends State<Installtest> {
  @override
  void initState() {
    super.initState();
    installer();
  }

  void installer() async {
    await Process.run('tar', [
      'xvzf',
      '\$HOME/Downloads/ImageMagick-x86_64-apple-darwin20.1.0.tar.gz',
    ]);

    await Process.run(
      "export",
      [
        'MAGICK_HOME="\$HOME/ImageMagick-7.1.1"'
      ],
    );

    await Process.run(
      "export",
      [
        'PATH="\$MAGICK_HOME/bin:\$PATH"'
      ],
    );

    await Process.run(
      "export",
      [
        ' DYLD_LIBRARY_PATH="\$MAGICK_HOME/lib/"'
      ],
    );

    final result = await Process.run(
      'convert',
      [
        '-version'
      ],
    );

    if (result.exitCode == 0) {
      print('ImageMagick installed successfully');
    } else {
      print('Error installing ImageMagick: ${result.stderr}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
