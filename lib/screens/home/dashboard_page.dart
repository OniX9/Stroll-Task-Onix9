import 'package:stroll_task/imports/imports.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height * 0.68,
            width: double.infinity,
          ),

          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: kAppGradient,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ExpandableBonfireTitle(
                    onPressed: () {},
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Column(
                    children: [
                      ListTile(
                        leading: ProfileContainer(
                          url:
                              'https://images.squarespace-cdn.com/content/v1/53b599ebe4b08a2784696956/1408651395609-4BGCNVO8OMCKAGOWB5FC/CEOportrait_0101.jpg?format=500w',
                        ),
                        isThreeLine: true,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text('Angelina, 28',
                              style: TextStyle(
                                fontSize: 11,
                                color: kAppGreyWhite,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          constraints: BoxConstraints(maxWidth: 0.8),
                          child: Text(
                            'What is your favorite time of the day?',
                            style: TextStyle(
                              fontSize: 20,
                              color: kAppGreyWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '“Mine is definitely the peace in the morning.”',
                          style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Color(0xB2CBC9FF)),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: PickOption(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pick your option \nSee who has a similar mind.',
                        style: TextStyle(
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/svgs/mic_recorder.svg'),
                      SizedBox(width: 5),
                      SvgPicture.asset('assets/svgs/go_icon.svg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SafeArea( //Non reactive ui
          //   child: ExpandableBonfireTitle(
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

// ***SCREEN-ONLY WIDGETs***
// 1.
class ExpandableBonfireTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? expandedHeight;
  final Function() onPressed;

  const ExpandableBonfireTitle({
    super.key,
    this.title,
    this.subTitle,
    required this.onPressed,
    this.expandedHeight = 130,
  });

  @override
  Widget build(BuildContext context) {
    final dropShadow = <Shadow>[
      Shadow(
        offset: Offset(0.0, 0),
        blurRadius: 7.9,
        color: Colors.black.withAlpha(70),
      ),
      Shadow(
        offset: Offset(0.0, 0),
        blurRadius: 2.0,
        color: Color(0xFFBEBEBE).withAlpha(70),
      ),
    ];
    return ExpandableTile(
      onTap: onPressed,
      enabled: true,
      duration: Duration(milliseconds: 1020),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kAppPurpleLight,
        size: 18,
        shadows: dropShadow,
      ),
      title: Text(
        'Stroll Bonfire',
        style: TextStyle(
          fontSize: 34,
          color: kAppPurpleLight,
          fontWeight: FontWeight.w700,
          shadows: dropShadow,
        ),
      ),
      child: Container(
        height: expandedHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.timer_sharp,
              color: Colors.white,
              size: 15,
              shadows: dropShadow,
            ),
            Text(
              '22h 00m',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                shadows: dropShadow,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.person_outline_sharp,
              color: Colors.white,
              size: 15,
              shadows: dropShadow,
            ),
            Text(
              '103',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                shadows: dropShadow,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2.
class PickOption extends StatefulWidget {
  const PickOption({
    super.key,
  });

  @override
  State<PickOption> createState() => _PickOptionState();
}

class _PickOptionState extends State<PickOption> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedOption = null);
        // Reset to null, if outside the options was clicked.
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            buildOptions(
                label: 'A',
                selectedLabel: selectedOption,
                body: 'The peace in the early mornings',
                onTap: () {
                  setState(() => selectedOption = 'A');
                }),
            buildOptions(
                label: 'B',
                selectedLabel: selectedOption,
                body: 'The magical golden hours',
                onTap: () {
                  setState(() => selectedOption = 'B');
                }),
            buildOptions(
                label: 'C',
                selectedLabel: selectedOption,
                body: 'Wind-down time after dinners',
                onTap: () {
                  setState(() => selectedOption = 'C');
                }),
            buildOptions(
                label: 'D',
                selectedLabel: selectedOption,
                body: 'The serenity past midnight',
                onTap: () {
                  setState(() => selectedOption = 'D');
                }),
          ],
        ),
      ),
    );
  }

  InkWell buildOptions({
    String? body,
    Function()? onTap,
    required String label,
    required String? selectedLabel,
  }) {
    bool isSelected = label == selectedLabel;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF232A2E),
            border: Border.all(
              width: 2,
              color: isSelected ? kAppPurpleMain : Colors.transparent,
            )),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //Circled Labels
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? kAppPurpleMain : Colors.transparent,
                border: Border.all(
                    width: 1,
                    color: isSelected ? kAppPurpleMain : Colors.white),
              ),
              child: Text(
                label.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? kAppGreyWhite : kAppGrey,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                body ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: kAppGrey,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
