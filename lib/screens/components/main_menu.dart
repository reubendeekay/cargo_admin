part of dashboard;

class _MainMenu extends StatelessWidget {
  const _MainMenu({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(int index, SelectionButtonData value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      data: [
        SelectionButtonData(
          activeIcon: EvaIcons.home,
          icon: EvaIcons.homeOutline,
          label: "Home",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.bell,
          icon: EvaIcons.bellOutline,
          label: "Notifications",
          totalNotif: 100,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.checkmarkCircle2,
          icon: EvaIcons.checkmarkCircle,
          label: "Add Admin",
          totalNotif: 20,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.settings,
          onPressed: () {
            Get.offAll(() => const SignInScreen());
          },
          icon: EvaIcons.settingsOutline,
          label: "Log out",
        ),
      ],
      onSelected: onSelected,
    );
  }
}
