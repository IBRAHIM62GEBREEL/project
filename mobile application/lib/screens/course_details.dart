import 'package:e_learning/provider/lectures.dart';
import 'package:e_learning/widgets/lecture_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({
    Key? key,
  }) : super(key: key);
  static const routeName = '/course-details';

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
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
    await Provider.of<Lectures>(context, listen: false)
        .fetchAndSetProducts(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : FutureBuilder(
                future: _refreshProducts(context),
                builder: (ctx, snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : RefreshIndicator(
                            onRefresh: () => _refreshProducts(context),
                            child: Consumer<Lectures>(
                              builder: (ctx, productsData, _) => Padding(
                                padding: const EdgeInsets.all(8),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: productsData.items.length,
                                  itemBuilder: (_, i) => Column(
                                    children: [
                                      LectureItem(
                                        name: productsData.items[i].name,
                                        id: productsData.items[i].id,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
              ),
      ),
    );
  }
}
