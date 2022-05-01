import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:newshacker/VIew/newsdetailscreen.dart';
import 'package:newshacker/provider/itemsprovider.dart';
import 'package:newshacker/provider/commentprovider.dart';

class homeScreen extends StatelessWidget {
  final count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            'Hacker-News',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
        )),
        body: Consumer(
          builder: (context, ref, child) {
            final news = ref.watch(newsProvider);

            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  final okay = news[index];
                  return InkWell(
                    onTap: () async {
                      await ref
                          .read(commentProvider.notifier)
                          .getComment(kids: okay.kids);

                      Get.to(() => detailScreen(story: okay),
                          transition: Transition.downToUp);
                    },
                    child: ListTile(
                      title: Text(okay.title!),
                      subtitle: Text("By:" + okay.by!),
                      trailing: Column(
                        children: [
                          Icon(Icons.comment),
                          Text(okay.kids?.length == null
                              ? '0'
                              : okay.kids!.length.toString())
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
