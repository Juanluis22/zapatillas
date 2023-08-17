import 'package:flutter/material.dart';
import 'package:appflutter/models/orden_model.dart';
import 'package:appflutter/pages/orden/orden_item.dart';
import 'package:appflutter/services/api_orden.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class OrdenList extends StatefulWidget {
  const OrdenList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrdenListState createState() => _OrdenListState();
}

class _OrdenListState extends State<OrdenList> {
  // List<ProductModel> products = List<ProductModel>.empty(growable: true);
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text('Django - CRUD'),
        elevation: 0,
      ),*/
      backgroundColor: Colors.grey[200],
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
        child: loadOrden(),
      ),
    );
  }

  Widget loadOrden() {
    return FutureBuilder(
      future: APIOrden.getOrden(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<OrdenModel>?> model,
      ) {
        if (model.hasData) {
          return ordenList(model.data);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget ordenList(orden) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: sort_child_properties_last
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/añadir orden',
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Añadir orden',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/home',
                        );
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Menu',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                ],
              ),

              //Navigator.pushNamed(context,'/add-product',);
              //Add Product
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: orden.length,
                itemBuilder: (context, index) {
                  return OrdenItem(
                    model: orden[index],
                    onDelete: (OrdenModel model) {
                      setState(() {
                        isApiCallProcess = true;
                      });

                      APIOrden.deleteOrden(model.id).then(
                        (response) {
                          setState(() {
                            isApiCallProcess = false;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
