import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_global/controller/pixabay_view_model.dart';
import 'package:tw_global/presentation/widgets/photo_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PixabayViewModel viewModel = Get.put(PixabayViewModel());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Pixabay Photos  Screen Width: ${MediaQuery.of(context).size.width}', ),
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width <= 600 ? 2 : MediaQuery.of(context).size.width <= 1100 ? 3 : 4,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: viewModel.photos.length,
            itemBuilder: (context, index) {
              return PhotoWidget(model: viewModel.photos[index]);
            },
          ),
        ),
      ),
    );
  }
}