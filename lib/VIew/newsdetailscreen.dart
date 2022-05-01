import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:newshacker/VIew/website.dart';
import 'package:newshacker/model/items.dart';
import 'package:newshacker/provider/commentprovider.dart';

class detailScreen extends StatelessWidget {
  late items story;
  detailScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(story.title.toString()),
          actions: [
            Consumer(builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  ref.refresh(commentP);
                },
                icon: Icon(Icons.refresh),
              );
            })
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        story.title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    story.by!.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.comment),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(story.kids!.length.toString()),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => website(link: story.url!),
                                transition: Transition.downToUp,
                              );
                            },
                            child: Icon(
                              story.url == null
                                  ? Icons.browser_not_supported
                                  : Icons.browser_updated_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .80,
              child: Consumer(builder: (context, ref, child) {
                final comment = ref.watch(commentP);
                return ListView.builder(
                    itemCount: comment.length,
                    itemBuilder: (context, index) {
                      final com = comment[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(com.by == null
                            ? 'Unknown Users'
                            : com.by!.toUpperCase()),
                        subtitle:
                            Text(com.text == null ? 'No Comments' : com.text!),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
