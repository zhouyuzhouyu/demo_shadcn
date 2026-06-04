import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'buttons_page.dart';
import 'display_page.dart';
import 'feedback_page.dart';
import 'forms_page.dart';
import 'overlay_page.dart';
import 'typography_page.dart';

class _DemoItem {
  const _DemoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final demos = [
      _DemoItem(
        title: 'Buttons',
        subtitle: 'Default, destructive, outline, secondary, ghost, link',
        icon: LucideIcons.mouse,
        page: const ButtonsPage(),
      ),
      _DemoItem(
        title: 'Forms',
        subtitle: 'Input, Checkbox, Radio, Select, Switch, Slider, OTP',
        icon: LucideIcons.squareCheck,
        page: const FormsPage(),
      ),
      _DemoItem(
        title: 'Feedback',
        subtitle: 'Alert, Toast/Sonner, Progress, Skeleton',
        icon: LucideIcons.bell,
        page: const FeedbackPage(),
      ),
      _DemoItem(
        title: 'Overlays',
        subtitle: 'Dialog, Sheet, Tooltip, Popover',
        icon: LucideIcons.layers,
        page: const OverlayPage(),
      ),
      _DemoItem(
        title: 'Display',
        subtitle: 'Card, Badge, Avatar, Tabs, Accordion, Separator, Table',
        icon: LucideIcons.layoutDashboard,
        page: const DisplayPage(),
      ),
      _DemoItem(
        title: 'Typography',
        subtitle: 'Headings, paragraph, lead, large, small, muted',
        icon: LucideIcons.type,
        page: const TypographyPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Shadcn UI Demo',
          style: TextStyle(
            color: theme.colorScheme.foreground,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: theme.colorScheme.border),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final demo = demos[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => demo.page),
                ),
                child: ShadCard(
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          demo.icon,
                          size: 20,
                          color: theme.colorScheme.secondaryForeground,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              demo.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.foreground,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              demo.subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        LucideIcons.chevronRight,
                        size: 16,
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
