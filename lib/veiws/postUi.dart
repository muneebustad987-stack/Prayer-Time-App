import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_project/models/post_model.dart';



class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  List<Post> myList = [];

  bool isLoading = false;

  Future<void> getPost() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 3));
    String api = "https://jsonplaceholder.typicode.com/posts";
    Uri url = Uri.parse(api);
    var response = await http.get(url);
    // print("Response status: ${response.statusCode}");
    // print("Response body: ${response.body}");
    isLoading = false;
    myList = postFromJson(response.body);
    // print("Post length: ${myList.length}");
    // print("Post title: ${myList}");
    // print("Post title: ${myList[0].title}");
    setState(() {});
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Post",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      var singlePost = myList[index];
                      return Container(
                        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              singlePost.title ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              singlePost.body ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
