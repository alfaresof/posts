import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts/controller/notfire.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        child: Column(children: [
          Text('name : ${profileState.profileModel.name}'),
          Text('name : ${profileState.profileModel.email}'),
        ]),
      ),
    );
  }
}
