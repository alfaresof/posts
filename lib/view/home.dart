import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts/controller/notfire.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    final notifire = ref.read(postsProvider.notifier);
    notifire.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postsProvider);
    final notifire = ref.read(postsProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(12),
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: postState.posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        postState.posts[index].title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(postState.posts[index].body.toString()),
                      ElevatedButton(
                        onPressed: () => notifire.getProfile(
                          postState.posts[index].userId!,
                          context,
                        ),
                        child: Text('about author'),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
