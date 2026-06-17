import 'package:flutter/services.dart';

class ProtectionPlatformService {
  ProtectionPlatformService({
    MethodChannel? methodChannel,
  }) : _methodChannel = methodChannel ?? const MethodChannel(_channelName);

  static const _channelName = 'sayno/protection';

  final MethodChannel _methodChannel;

  Future<bool> isAccessibilityEnabled() async {
    final result = await _methodChannel.invokeMethod<bool>(
      'isAccessibilityEnabled',
    );
    return result ?? false;
  }

  Future<bool> openAccessibilitySettings() async {
    final result = await _methodChannel.invokeMethod<bool>(
      'openAccessibilitySettings',
    );
    return result ?? false;
  }
}
