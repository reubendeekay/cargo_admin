part of dashboard;

class _WeeklyTask extends StatelessWidget {
  const _WeeklyTask({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final List<ListTaskAssignedData> data;
  final Function(int index, ListTaskAssignedData data) onPressed;
  final Function(int index, ListTaskAssignedData data) onPressedAssign;
  final Function(int index, ListTaskAssignedData data) onPressedMember;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('cargos')
            .orderBy('createdAt')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }

          List<DocumentSnapshot> docs = snapshot.data!.docs;

          return Column(
            children: docs
                .map(
                  (e) => ListTaskAssigned(
                    data: ListTaskAssignedData(
                      icon: const Icon(Icons.document_scanner),
                      destination: e['destination'],
                      label: e['id'],
                      assignTo: e['createdBy'],
                      editDate: DateTime.parse(e['createdAt'].toString()),
                    ),
                    onPressed: null,
                    onPressedAssign: null,
                    onPressedMember: null,
                  ),
                )
                .toList(),
          );
        });
  }
}
