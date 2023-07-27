import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts/api/api.dart';
import 'package:posts/controller/state.dart';

final postsProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostState.Initial());

  void getPosts() async {
    try {
      final res = await APICall().getPosts();
      state = state.copyWith(posts: res);
    } catch (e) {}
  }

  void getProfile(
    int id,
    BuildContext context,
  ) async {
    try {
      final res = await APICall().getProfile(id);
      state = state.copyWith(profileModel: res);
      Navigator.pushNamed(context, '/profile');
    } catch (e) {}
  }
}
