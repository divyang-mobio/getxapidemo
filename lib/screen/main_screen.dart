import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/api_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataFetching dataFetching = Get.put(DataFetching());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GetX<DataFetching>(
        init: dataFetching,
        builder: (controller) => (controller.checker.value)
            ? _listView(controller)
            : const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataFetching.apiCalling();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _listView(DataFetching controller) {
    return (controller.data.isEmpty)
        ? const Center(child: Text("error"))
        : ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => Card(
              elevation: 8,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${controller.data[index].id}"),
                    const SizedBox(height: 10),
                    Text(controller.data[index].title)
                  ],
                ),
                subtitle: Text(controller.data[index].body,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
            ),
          );
    // } catch (e) {
    //   return Center(child: Text(e.toString()));
    // }
  }
}
