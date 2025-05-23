import 'package:flutter_test/flutter_test.dart';
import 'package:tcp_listener_plugin/tcp_listener_plugin.dart';
import 'package:tcp_listener_plugin/tcp_listener_plugin_platform_interface.dart';
import 'package:tcp_listener_plugin/tcp_listener_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTcpListenerPluginPlatform
    with MockPlatformInterfaceMixin
    implements TcpListenerPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TcpListenerPluginPlatform initialPlatform = TcpListenerPluginPlatform.instance;

  test('$MethodChannelTcpListenerPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTcpListenerPlugin>());
  });

  test('getPlatformVersion', () async {
    TcpListenerPlugin tcpListenerPlugin = TcpListenerPlugin();
    MockTcpListenerPluginPlatform fakePlatform = MockTcpListenerPluginPlatform();
    TcpListenerPluginPlatform.instance = fakePlatform;

    expect(await tcpListenerPlugin.getPlatformVersion(), '42');
  });
}
