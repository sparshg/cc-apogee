import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1D1C1C),
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    TextStyle textStyle = const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black);

    Widget titleBar = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("PROFILE",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Row(children: const [
              Text("LOGOUT ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(Icons.logout)
            ])
          ],
        ));

    Widget stack({bal = 599999.00, invest = 39999, profit = 560000}) => Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: w,
              height: 94,
              decoration: const BoxDecoration(
                color: Color(0xFF9090FF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Positioned(
              top: 20,
              child: Text(
                "BALANCE: \$$bal",
                style: textStyle,
              ),
            ),
            Positioned(
              top: 61,
              child: Container(
                width: w * 0.78,
                height: 90,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        spreadRadius: 5.0,
                      ),
                    ]
                    // border: Border.all(color: Color(0x55000000), width: 6),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Invested", style: textStyle),
                          Text("\$ $invest", style: textStyle),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Color(0x80000000),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Profit", style: textStyle),
                          Text("\$ $profit", style: textStyle),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );

    List<String> items = [
      "Notifications",
      "Watchlist",
      "Present Holdings",
      "Recent Transactions",
      "Help and Support",
      "About Us",
    ];
    List<IconData> icons = [
      Icons.notifications_none_rounded,
      Icons.remove_red_eye_rounded,
      Icons.playlist_add_check,
      Icons.history_rounded,
      Icons.headset_mic_outlined,
      Icons.person_pin,
    ];

    Widget lists = ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF40B2E3),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.grey.shade800, width: 3),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              visualDensity: const VisualDensity(horizontal: -4),
              title: Text(items[index],
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              leading: Icon(icons[index], size: 32, color: Colors.black),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              // tileColor: Color(0xFF40B2E3),
            ),
          ),
        );
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 38),
          titleBar,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                const CircleAvatar(
                  foregroundImage: AssetImage('images/avatar.png'),
                  backgroundColor: Color(0xFF05FFB4),
                  radius: 40,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 4, color: const Color(0xFF1D1C1C)),
                          color: const Color(0xFF05FFB4)),
                      child: const Icon(Icons.edit,
                          size: 12, color: Colors.black)),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Tushar Saini",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          stack(),
          const SizedBox(height: 70),
          Expanded(child: lists),
        ],
      ),
    );
  }
}
