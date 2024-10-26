import 'package:api_integration/view/Services/api_service.dart';
import 'package:api_integration/view/model/product_modal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModal>> productes;
  @override
  void initState() {
    productes = getProductes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("productes list"),
        ),
        body: FutureBuilder(
            future: productes,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "${snapShot.data![index].category?.image}",
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text("${snapShot.data![index].category!.name}"),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Price:${snapShot.data![index].price!}",
                          overflow: TextOverflow.fade,
                        )
                      ],
                    );
                  },
                );
              } else if (snapShot.hasError) {
                return const Text("Network issue error");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
