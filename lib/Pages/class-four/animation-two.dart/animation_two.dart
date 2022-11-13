import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/animation-two.dart/animatio_class.dart';
import 'package:playground/Pages/class-four/animation-two.dart/widgets/list_item_widget.dart';

class AnimationTwo extends StatefulWidget {
  const AnimationTwo({super.key});

  @override
  State<AnimationTwo> createState() => _AnimationTwoState();
}

bool isOpen = false;
String _description =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ,.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s';
// List<int> generatedIndex = List<int>.generate(50, (index) => index);

class _AnimationTwoState extends State<AnimationTwo> {
  int? itemSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My ScrollView'),
      ),
      body: _body(),
    );
  }

  ListView _body() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListItemWidget(
          onTap: () {
            itemSelected = index;
            setState(() {
              if (itemSelected == index) {
                isOpen = !isOpen;
              }
            });
          },
          isOpen: itemSelected == index ? isOpen : false,
          listItem: ListTitle(
            title: "My expansion tile ${index + 1}",
            description: _description,
            icon: Icons.arrow_forward_ios,
            image: const FlutterLogo(size: 40),
          ),
        );
      },
    );
  }
}
