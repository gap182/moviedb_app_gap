import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imagineapp_test_gap/src/core/app_values/assets.dart';
import 'package:imagineapp_test_gap/src/core/dependencies/dependencies.dart';
import 'dart:math' as math;

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplahsPageState();
}

class _SplahsPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    ref.read(confgiProvider.notifier).loadConfigData();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: 2 * math.pi)
        .animate(animationController!);
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        animation?.addListener(() async {
          if (animation!.isCompleted) {
            await Future.delayed(const Duration(seconds: 1));
            _goHome();
          }
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void _goHome() {
    context.go('/main');
  }

  @override
  Widget build(BuildContext context) {
    animationController?.forward();

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation!,
          builder: (context, child) => Transform.rotate(
            angle: animation!.value,
            child: Image.asset(
              Assets.mainLogo,
            ),
          ),
        ),
      ),
    );
  }
}
