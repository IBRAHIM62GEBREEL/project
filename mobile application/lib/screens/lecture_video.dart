import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/videos.dart';

class LectureVideo extends StatefulWidget {
  const LectureVideo({Key? key}) : super(key: key);
  static const routeName = '/lecture-video';

  @override
  State<LectureVideo> createState() => _LectureVideoState();
}

class _LectureVideoState extends State<LectureVideo> {
  bool isLoading = false;
  int? id;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    Future.delayed(
      Duration.zero,
      () {
        id = ModalRoute.of(context)!.settings.arguments as int;
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Videos>(context, listen: false)
        .fetchAndSetProducts(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () => _refreshProducts(context),
                      child: Consumer<Videos>(
                        builder: (ctx, productsData, _) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: const [
                                SizedBox(
                                  width: double.infinity,
                                  // child: Text('${productsData.items[]}'),
                                )
                              ],
                            )),
                      ),
                    ),
        ),
      ),
    );
  }
}
