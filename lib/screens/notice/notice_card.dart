import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
  final String name;
  final String date;
  final String notice;
  final String pic;
  const NoticeCard({Key? key, required this.name, required this.date, required this.notice, required this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                pic
                  // "https://images.unsplash.com/photo-1652910872640-8a5a6500f602?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387"
                  // widget.snap['profilePic'],
                  ),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      // "username",
                      // text: widget.snap['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        date,
                        // "19/05/2022",
                        // DateFormat.yMMMd().format(widget.snap['datePublished'].toDate()),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              notice,
              // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. ",
              style: TextStyle(color: Colors.white),
            ),
          )

        ],
      ),
    );
  }
}
