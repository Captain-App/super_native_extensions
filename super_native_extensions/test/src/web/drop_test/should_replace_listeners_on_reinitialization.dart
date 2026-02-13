@TestOn('chrome')

import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter_test/flutter_test.dart';
import 'package:super_native_extensions/src/web/drop.dart';
import 'package:web/web.dart' as web;

void main() {
  test('should replace listeners on reinitialization', () async {
    final context = DropContextImpl();
    await context.initialize();
    final listenersA =
        (web.document as JSObject)[DropContextImpl.listenersProperty];
    await context.initialize();
    final listenersB =
        (web.document as JSObject)[DropContextImpl.listenersProperty];
    expect(
      listenersB,
      hasLength(4),
    );
    expect(listenersA, isNot(listenersB));
  });
}
