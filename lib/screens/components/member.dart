part of dashboard;

class Member extends StatelessWidget {
  const Member({
    Key? key,
  }) : super(key: key);

  final int maxDisplayPeople = 5;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .orderBy('createdAt')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              (docs.length > maxDisplayPeople) ? maxDisplayPeople : docs.length,
              (index) => SimpleUserProfile(
                name: docs[index]['fullName'],
                onPressed: () {},
              ),
            ).toList(),
          );
        });
  }
}
