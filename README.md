# demo_shadcn

> 一个基于 [shadcn_ui](https://pub.dev/packages/shadcn_ui) 的 Flutter 组件展示应用,跨 6 个分类演示常用 UI 组件。主打 Web(部署到 GitHub Pages),同时支持 Android / iOS。

🔗 **在线 Demo**:<https://zhouyuzhouyu.github.io/demo_shadcn/> ·
📐 **设计规范**:[docs/2026-06-04-flutter-theme-handoff.md](docs/2026-06-04-flutter-theme-handoff.md) ·
🤖 **开发指南**:[CLAUDE.md](CLAUDE.md)

---

## ✨ 这是什么

用 `shadcn_ui`(Flutter 版)搭建的组件 showcase。架构上**用 Material 的导航骨架(`Scaffold` / `AppBar` / `Navigator`)承载 shadcn 风格的页面内容**——根 widget 是 `ShadApp` 而非 `MaterialApp`,颜色、间距、圆角全部读取 `ShadThemeData`,而不是 Material 主题。

每个 demo 页面自包含、互不依赖,适合作为接入 `shadcn_ui` 时的参考实现。

## 📱 Demo 页面

| 页面 | 演示内容 |
|------|----------|
| **Buttons** | Default、destructive、outline、secondary、ghost、link;图标按钮、尺寸、加载/禁用态 |
| **Forms** | Input、Checkbox、Radio、Select、Switch、Slider、OTP |
| **Feedback** | Alert、Toast/Sonner、Progress、Skeleton |
| **Overlays** | Dialog、Sheet、Tooltip、Popover |
| **Display** | Card、Badge、Avatar、Tabs、Accordion、Separator、Table |
| **Typography** | 标题/正文刻度,含中文与中英混排示例 |

## 🎨 主题

遵循已确认的视觉基线(详见 [设计规范](docs/2026-06-04-flutter-theme-handoff.md)):

- **配色**:shadcn_ui **Lime** 预设,自定义 `ShadColorScheme` 明暗两套(品牌色只用 Lime,强调用浅薄荷 soft-tint,选中态用近黑)。
- **字体**:**DM Sans**(经 `google_fonts`)→ 中文回退 **PingFang SC**。
- **圆角**:基础 `0.45rem`(= `7.2px` @16px/rem)。
- 明暗主题随系统切换;暗色下保留 Lime 品牌主色。

## 🛠 技术栈

| | |
|---|---|
| Flutter SDK | **3.35.6**(CI 固定) |
| Dart SDK | `^3.9.2` |
| UI 库 | [`shadcn_ui`](https://pub.dev/packages/shadcn_ui) `^0.53.6` |
| 字体 | [`google_fonts`](https://pub.dev/packages/google_fonts) `^6.2.1` |
| Lint | `flutter_lints` `^5.0.0` |
| Web 渲染 | CanvasKit / WasmGC(Pages 部署为 `--wasm`) |

## 🚀 本地运行

```bash
flutter pub get                    # 安装依赖
flutter run -d chrome              # 本地运行(Web)

# 质量检查(CI 会逐项门禁)
dart format .                      # 格式化(CI 用 --set-exit-if-changed 校验)
flutter analyze                    # 静态分析,须零 issue
flutter test                       # 运行测试

# 按 CI/Pages 的方式构建 Web
flutter build web --release --wasm
```

> ⚠️ `flutter analyze` 通过 **不代表** 应用能正常渲染——release web 会吞掉布局异常导致白屏。改动 UI 后请 `flutter build web` 并实际运行确认。详见 [CLAUDE.md](CLAUDE.md) 的「Verifying changes」。

## 📂 项目结构

```
lib/
├── main.dart              # 根 ShadApp + Lime 主题(明暗 ShadColorScheme)
└── pages/
    ├── home_page.dart     # 入口列表,导航到各 demo
    ├── buttons_page.dart
    ├── forms_page.dart
    ├── feedback_page.dart
    ├── overlay_page.dart
    ├── display_page.dart
    └── typography_page.dart
docs/                      # 设计规范 / 交接文档
.github/workflows/         # CI、Pages 部署、Claude 自动化
```

## 🔄 CI/CD

GitHub Actions(详见 [.github/workflows/](.github/workflows/)):

- **[ci.yml](.github/workflows/ci.yml)**:每次 push/PR 跑 `dart format` + `flutter analyze` + `flutter test`;`main` 的 push 额外构建 Web 与 APK 产物。
- **[deploy-pages.yml](.github/workflows/deploy-pages.yml)**:push 到 `main` 时以 `--wasm --base-href /demo_shadcn/` 构建并部署到 GitHub Pages。
- **[claude.yml](.github/workflows/claude.yml)**:新 issue 自动分析并提 PR;`@claude` 提及触发交互式响应。
- **[claude-code-review.yml](.github/workflows/claude-code-review.yml)**:对 PR 自动 code review。

## 📐 开发约定

接手代码前请先读 [CLAUDE.md](CLAUDE.md),其中记录了关键约束:

- `shadcn_ui ^0.53.6` 的 API 陷阱(以**安装源码为准**,而非旧文档);
- UI 改动必须遵循 [主题规范](docs/2026-06-04-flutter-theme-handoff.md);
- 静态检查通过不等于运行正常,UI 变更需实际构建运行验证。
