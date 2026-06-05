import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

// Lime light theme — colors derived from oklch values in
// docs/2026-06-04-flutter-theme-handoff.md
const _limeLightScheme = ShadColorScheme(
  background: Color(0xFFFFFFFF), // oklch(1 0 0)
  foreground: Color(0xFF1A1A1A), // oklch(0.145 0 0)
  card: Color(0xFFFFFFFF),
  cardForeground: Color(0xFF1A1A1A),
  popover: Color(0xFFFFFFFF),
  popoverForeground: Color(0xFF1A1A1A),
  primary: Color(0xFF95E300), // oklch(0.841 0.238 128.85) — Lime brand
  primaryForeground: Color(0xFF365314), // oklch(0.405 0.101 131.063)
  secondary: Color(0xFFF4F4F5), // oklch(0.967 0.001 286.375)
  secondaryForeground: Color(0xFF27272A), // oklch(0.21 0.006 285.885)
  muted: Color(0xFFF7F7F7), // oklch(0.97 0 0)
  mutedForeground: Color(0xFF71717A), // oklch(0.556 0 0)
  accent: Color(0xFFECFCCB), // brand-soft tint — oklch(0.952 0.05 128)
  accentForeground: Color(0xFF365314),
  destructive: Color(0xFFEF4444), // oklch(0.577 0.245 27.325)
  destructiveForeground: Color(0xFFFFFFFF),
  border: Color(0xFFE5E5E5), // oklch(0.922 0 0)
  input: Color(0xFFE5E5E5),
  ring: Color(0xFF95E300),
  selection: Color(0xFF1A1A1A), // near-black selection fill
);

// Lime dark theme — inverted contrast, same Lime brand primary
const _limeDarkScheme = ShadColorScheme(
  background: Color(0xFF0F0F0F),
  foreground: Color(0xFFF0F0F0),
  card: Color(0xFF1A1A1A),
  cardForeground: Color(0xFFF0F0F0),
  popover: Color(0xFF1A1A1A),
  popoverForeground: Color(0xFFF0F0F0),
  primary: Color(0xFF95E300), // keep Lime brand in dark mode
  primaryForeground: Color(0xFF0F1A00),
  secondary: Color(0xFF1F1F23),
  secondaryForeground: Color(0xFFF0F0F0),
  muted: Color(0xFF1A1A1A),
  mutedForeground: Color(0xFFA1A1AA),
  accent: Color(0xFF1C2B00), // dark brand-soft tint
  accentForeground: Color(0xFF95E300),
  destructive: Color(0xFFEF4444),
  destructiveForeground: Color(0xFFFFFFFF),
  border: Color(0xFF2A2A2A),
  input: Color(0xFF2A2A2A),
  ring: Color(0xFF95E300),
  selection: Color(0xFFF0F0F0),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ShadTextTheme only takes a family string; PingFang SC fallback is applied via DefaultTextStyle.merge below
    final dmSansStyle = GoogleFonts.dmSans(
      fontFamilyFallback: ['PingFang SC', '.PingFang SC', 'Heiti SC'],
    );

    return ShadApp(
      title: 'Shadcn UI Demo',
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: _limeLightScheme,
        textTheme: ShadTextTheme(family: dmSansStyle.fontFamily!),
        radius: BorderRadius.circular(7.2), // 0.45rem base radius (at 16px/rem)
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: _limeDarkScheme,
        textTheme: ShadTextTheme(family: dmSansStyle.fontFamily!),
        radius: BorderRadius.circular(7.2),
      ),
      home: DefaultTextStyle.merge(
        style: TextStyle(fontFamilyFallback: dmSansStyle.fontFamilyFallback),
        child: const HomePage(),
      ),
    );
  }
}
