import 'package:posts/models/post_model.dart';
import 'package:posts/models/profile.dart';

class PostState {
  final List<PostModel> posts;
  final ProfileModel profileModel;

  PostState({
    required this.posts,
    required this.profileModel,
  });

  factory PostState.Initial() {
    return PostState(
      posts: [],
      profileModel: ProfileModel(),
    );
  }

  PostState copyWith({
    List<PostModel>? posts,
    ProfileModel? profileModel,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      profileModel: profileModel ?? this.profileModel,
    );
  }
}
