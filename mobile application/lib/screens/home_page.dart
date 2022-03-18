import 'package:e_learning/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/courses.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home-page';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Courses>(context, listen: false).fetchAndSetProducts();
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
                      child: Consumer<Courses>(
                        builder: (ctx, productsData, _) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                            ),
                            padding: EdgeInsets.zero,
                            itemCount: productsData.items.length,
                            itemBuilder: (_, i) => CourseItem(
                              id: productsData.items[i].id,
                              name: productsData.items[i].name,
                              imgUrl: productsData.items[i].imgUrl,
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
