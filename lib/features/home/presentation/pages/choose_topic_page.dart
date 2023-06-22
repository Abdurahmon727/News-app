import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets/colors.dart';
import '../../../../core/data/extensions.dart';
import '../../../../core/models/home_datas.dart';
import '../../../../core/widgets/w_scale.dart';
import '../bloc/news_bloc.dart';
import '../home_screen.dart';

class ChooseTopicPage extends StatefulWidget {
  const ChooseTopicPage({super.key});

  @override
  State<ChooseTopicPage> createState() => _ChooseTopicPageState();
}

class _ChooseTopicPageState extends State<ChooseTopicPage> {
  @override
  void initState() {
    topics = List.from(context.read<NewsBloc>().state.topics);
    super.initState();
  }

  final shakeKey = GlobalKey();

  late List<String> topics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: miskyRose,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding:
                const EdgeInsets.only(top: 25, bottom: 90, left: 16, right: 16),
            children: [
              const Text(
                'Select Interests',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (!topics.contains(allTopics[index])) {
                      topics.add(allTopics[index]);
                    } else {
                      topics.remove(allTopics[index]);
                    }
                    setState(() {
                      topics;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: white, shape: BoxShape.circle),
                        child: (topics.contains(allTopics[index]))
                            ? Container(
                                decoration: const BoxDecoration(
                                    color: black, shape: BoxShape.circle),
                                child: const Icon(Icons.done, color: white),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 0.2, color: darkGrey),
                                    color: white,
                                    shape: BoxShape.circle),
                              ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            allTopics[index].inCaps,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: allTopics.length,
              ),
            ],
          ),
          WScaleAnimation(
            onTap: () {
              if (topics.length > 3) {
                context.read<NewsBloc>().add(NewsEvent.changeTopics(topics));
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: black,
              ),
              child: Text(
                (topics.length > 3) ? 'Submit' : 'Minimum 4',
                style: TextStyle(
                    color: (topics.length > 3) ? white : Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
