//import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);

}



final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Ad fugiat ad cupidatat velit aliqua incididunt enim enim nostrud deserunt qui nostrud. Eiusmod sit nulla in proident ipsum eu dolore. Id dolor commodo dolore esse excepteur. Sint dolore proident incididunt id enim proident ea aliquip deserunt nulla ad. Laborum dolore duis ex culpa pariatur quis. Sunt do culpa amet exercitation cillum do. Fugiat consequat aute veniam reprehenderit aliquip eu cupidatat reprehenderit quis incididunt nostrud.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Amet deserunt culpa pariatur et nulla voluptate fugiat ad irure id nostrud pariatur magna. Elit nisi cillum do commodo dolor ut magna esse voluptate. Aliquip ullamco cillum veniam tempor ullamco ad in qui nostrud exercitation qui tempor ad consectetur. Aliquip minim adipisicing in minim ad minim. Commodo fugiat Lorem proident consequat adipisicing ex aliquip ea officia aliqua in labore laboris. Ipsum exercitation labore adipisicing fugiat non elit aute ullamco voluptate sint anim.', 'assets/images/2.png'),  
  SlideInfo('Disfruta la comida', 'Irure eu dolore id ex. Dolore minim voluptate officia dolore irure pariatur irure mollit nisi culpa dolor incididunt. Magna in non veniam eu mollit voluptate. Labore do magna dolor dolor anim exercitation duis exercitation enim amet in Lorem enim commodo. Nisi tempor ipsum magna incididunt exercitation adipisicing quis consequat Lorem exercitation quis pariatur. Aliqua mollit in ullamco mollit nostrud elit consequat in ex laboris aliquip nisi sit dolor. Ut ea ad nulla et elit proident elit culpa eiusmod laborum deserunt fugiat.', 'assets/images/3.png'),  
];



class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if ( !endReached &&  page <= (slides.length-1.5)){
        setState(() {
          endReached = true;
        });
      }

     });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: 
              slides.map((slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl,
              )).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(onPressed: (){
              context.pop();
            }, child: const Text('Salir'))),

          endReached ? Positioned(
            right: 30,
            bottom: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(onPressed: (){
                context.pop();
              }, child: const Text('Comenzar')),
            )):const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 20),
          Text(caption, style: captionStyle),          
        ],
      ),
    );
  }
}