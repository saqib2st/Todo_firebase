import 'package:flutter/material.dart';
import 'package:todo_firebase/app/data/app_color.dart';
import 'package:todo_firebase/app/data/custom_textstyle.dart';

class TodoDetailedView extends StatelessWidget {
  const TodoDetailedView(
      {super.key,
      this.url,
      this.title,
      this.des,
      this.type,
      this.catogery,
      this.id,
      this.time});

  final String? url, title, des, type, catogery, time, id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.secondaryColor,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(url.toString())),
            const SizedBox(
              height: 20,
            ),
            Text(
              title.toString(),
              style:
                  CustomTestStyle.blackTest14B.copyWith(color: Colors.black12),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              des.toString(),
              style:
                  CustomTestStyle.blackTest14B.copyWith(color: Colors.black12),
            ),
          ],
        ),
      ),
    );
  }
}
