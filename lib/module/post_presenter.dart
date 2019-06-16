
abstract class PostListPresenterContract {
  void loadPosts();
}

class PostListPresenter implements PostListPresenterContract{
  @override
  void loadPosts() {
    // TODO: implement loadPosts
    print('come here');
    return;
  }

}