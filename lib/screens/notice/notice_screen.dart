import 'package:flutter/material.dart';
import 'package:society_app/screens/notice/notice_card.dart';

class NoticeScreen extends StatelessWidget {
  static const String routename = '/notice-screen';
  const NoticeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String note1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. ";
    const String note2 = "Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. ";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.note_add_outlined)
          )
        ],
      ),
      body: ListView(
          children: [
            const NoticeCard(
              name: "admin3",
              date: "18/05/2022",
              notice: note1,
              pic: "https://images.unsplash.com/photo-1652910872640-8a5a6500f602?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387",
            ),
            const NoticeCard(
              name: "admin2",
              date: "19/05/2022",
              notice: note2,
              pic: "https://images.unsplash.com/photo-1652874179171-948c5e6fbb8b?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435",
            ),
          ],
        ),
    );
  }
}