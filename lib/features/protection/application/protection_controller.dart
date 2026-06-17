import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/protection_platform_service.dart';
import '../domain/protection_status.dart';

final protectionPlatformServiceProvider = Provider<ProtectionPlatformService>(
  (ref) => ProtectionPlatformService(),
);

final protectionControllerProvider =
    AsyncNotifierProvider<ProtectionController, ProtectionStatus>(
  ProtectionController.new,
);

class ProtectionController extends AsyncNotifier<ProtectionStatus> {
  late final ProtectionPlatformService _platformService;

  @override
  Future<ProtectionStatus> build() async {
    _platformService = ref.watch(protectionPlatformServiceProvider);
    return _readProtectionStatus();
  }

  Future<void> refreshStatus() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_readProtectionStatus);
  }

  Future<bool> openAccessibilitySettings() async {
    return _platformService.openAccessibilitySettings();
  }

  Future<ProtectionStatus> _readProtectionStatus() async {
    try {
      final isEnabled = await _platformService.isAccessibilityEnabled();
      return isEnabled
          ? ProtectionStatus.protected
          : ProtectionStatus.protectionRequired;
    } on PlatformException {
      return ProtectionStatus.unknown;
    } on MissingPluginException {
      return ProtectionStatus.unknown;
    }
  }
}
