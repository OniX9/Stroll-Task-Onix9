import 'package:stroll_task/imports/imports.dart';
import 'package:stroll_task/screens/widgets/profile_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height * 0.60,
          width: double.infinity,
        ),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: kAppGradient,
            ),
            child: Column(
              children: [
                buildTitle(),
                Spacer(),
                ListTile(
                  leading: ProfileContainer(
                    url: 'https://images.squarespace-cdn.com/content/v1/53b599ebe4b08a2784696956/1408651395609-4BGCNVO8OMCKAGOWB5FC/CEOportrait_0101.jpg?format=500w',
                  ),
                  isThreeLine: true,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text('Angelina, 28',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        'What is your favorite time of the day?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Padding buildTitle() {
    return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Stroll Bonfire',
                      style: TextStyle(
                        fontSize: 34,
                        color: kAppPurpleLight,
                        fontWeight: FontWeight.w700,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0.0, 2),
                            blurRadius: 20.0,
                            color: Colors.black.withAlpha(51),
                          ),
                        ],
                      )),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: kAppPurpleLight,
                    size: 30,
                  ),
                ],
              ),
            );
  }
}
