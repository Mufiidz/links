import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:mylink/utils/utils_export.dart';
import '../../data/firebase_repository.dart';
import '../../di/main_module.dart';
import '../../res/assets.dart';
import 'bloc/home_bloc.dart';
import 'components/group_list_widget.dart';
import 'components/title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Mufidz Links',
      color: Colors.black,
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 5),
              onEnd: () => setState(() {
                index += 1;
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];

                begin = alignmentList[index % alignmentList.length];
                end = alignmentList[(index + 2) % alignmentList.length];
              }),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin, end: end, colors: [bottomColor, topColor])),
            ),
            ImprovedScrolling(
              scrollController: _controller,
              enableMMBScrolling: true,
              enableKeyboardScrolling: true,
              enableCustomMouseWheelScrolling: true,
              child: ListView(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                children: [
                  const TitleWidget(),
                  FractionallySizedBox(
                    widthFactor: context.mediaSize.width > 700 ? 0.5 : 0.7,
                    child: BlocProvider(
                      create: (context) =>
                          HomeBloc((getIt<FirebaseRepository>()))
                            ..add(GetAllLinksEvent()),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is LinksLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is LinksDataState) {
                            return state.listLinks.isEmpty
                                ? const Center(
                                    child: Text(
                                      'Tidak ada data',
                                    ),
                                  )
                                : GroupListWidget(state);
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: SizedBox.square(
                          dimension: 80, child: Image.asset(Assets.logo)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
}
