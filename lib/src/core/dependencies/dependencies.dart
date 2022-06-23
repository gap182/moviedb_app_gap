import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagineapp_test_gap/src/config/config_notifier.dart';
import 'package:imagineapp_test_gap/src/config/config_state.dart';
import 'package:imagineapp_test_gap/src/core/presentation/controllers/global_notifier.dart';
import 'package:imagineapp_test_gap/src/core/presentation/states/global_state.dart';
import 'package:imagineapp_test_gap/src/features/home/data/repositories/popular_repository_impl.dart';
import 'package:imagineapp_test_gap/src/features/home/data/services/popular_service.dart';
import 'package:imagineapp_test_gap/src/features/home/domain/repositories/popular_repository.dart';
import 'package:imagineapp_test_gap/src/features/home/presentation/controllers/home_notifier.dart';
import 'package:imagineapp_test_gap/src/features/home/presentation/states/home_state.dart';

part 'dependencies_config.dart';
part 'dependencies_ui.dart';
part 'dependencies_domain.dart';
part 'dependencies_data.dart';
