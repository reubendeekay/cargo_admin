part of dashboard;

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  final dataProfil = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "Reuben",
    level: "System Administrator",
  );

  final member = ["Mustapha Ahmed", "Raymond Mekenye"];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

  final taskInProgress = [
    CardTaskData(
      label: "Add a new booking",
      jobDesk: "System Administrator",
      dueDate: DateTime.now().add(const Duration(minutes: 50)),
      onTap: () {
        Get.to(() => const AddBookingScreen());
      },
    ),
    CardTaskData(
      label: "Track Bookings",
      jobDesk: "Branch Admin",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
      onTap: () {
        Get.to(() => const TrackingScreen());
      },
    ),
    CardTaskData(
      label: "Change Schedule",
      jobDesk: "Branch Manager",
      dueDate: DateTime.now().add(const Duration(days: 2)),
      onTap: () {
        Get.to(() => const RateRequest());
      },
    ),
    CardTaskData(
      label: "Directory",
      jobDesk: "System Analyst",
      dueDate: DateTime.now().add(const Duration(minutes: 50)),
      onTap: () {
        Get.to(() => const AlertsScreen());
      },
    )
  ];

  final weeklyCargo = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      label: "Doc 16/1617/1",
      destination: "Kenya",
      assignTo: "Reuben Jefwa",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.amber),
      label: "Doc 16/1617/1",
      destination: "Tanzania",
      assignTo: "Mustapha",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "Doc 16/1617/1",
      destination: "Uganda",
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      label: "Doc 16/1617/1",
      destination: "Doha",
    ),
  ];

  final taskGroup = [
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 10)),
        label: "Doha Branch Opening",
        jobdesk: "Management",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 11)),
        label: "India Shipments Arrival",
        jobdesk: "Logistics",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 5)),
        label: "Sydney Shipments Departure",
        jobdesk: "Logistics",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 6)),
        label: "New Admin added",
        jobdesk: "Management",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 5)),
        label: "New Pick up location in Tanzania added",
        jobdesk: "Management",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 6)),
        label: "New Shipment Added",
        jobdesk: "Logistics",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 8)),
        label: "New Admin added",
        jobdesk: "Mnanagement",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 10)),
        label: "System Upgrade",
        jobdesk: "System Analyst",
      ),
    ]
  ];

  void onPressedProfil() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {}
  void onSelectedTaskMenu(int index, String label) {}

  void searchTask(String value) {}

  void onPressedTask(int index, ListTaskAssignedData data) {}
  void onPressedAssignTask(int index, ListTaskAssignedData data) {}
  void onPressedMemberTask(int index, ListTaskAssignedData data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, ListTaskDateData data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }
}
