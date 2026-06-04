// Smoke test: 验证应用能正常启动并渲染首页导航。
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_shadcn/main.dart';

void main() {
  testWidgets('App 启动并显示首页', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // 首页标题与若干导航项应当渲染。
    expect(find.text('Shadcn UI Demo'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);
    expect(find.text('Forms'), findsOneWidget);
  });
}
