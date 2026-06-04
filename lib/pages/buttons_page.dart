import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Buttons',
          style: TextStyle(color: theme.colorScheme.foreground),
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.foreground),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: theme.colorScheme.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Variants'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(onPressed: () {}, child: const Text('Default')),
                ShadButton.destructive(
                  onPressed: () {},
                  child: const Text('Destructive'),
                ),
                ShadButton.outline(
                  onPressed: () {},
                  child: const Text('Outline'),
                ),
                ShadButton.secondary(
                  onPressed: () {},
                  child: const Text('Secondary'),
                ),
                ShadButton.ghost(onPressed: () {}, child: const Text('Ghost')),
                ShadButton.link(onPressed: () {}, child: const Text('Link')),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'With Icons'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.mail, size: 16),
                  child: const Text('Login with Email'),
                ),
                ShadButton.outline(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.gitBranch, size: 16),
                  child: const Text('GitHub'),
                ),
                ShadButton.secondary(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.settings, size: 16),
                  child: const Text('Settings'),
                ),
                ShadButton.destructive(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.trash, size: 16),
                  child: const Text('Delete'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Sizes'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () {},
                  child: const Text('Small'),
                ),
                ShadButton(onPressed: () {}, child: const Text('Default')),
                ShadButton(
                  size: ShadButtonSize.lg,
                  onPressed: () {},
                  child: const Text('Large'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Icon Buttons'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadIconButton(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.plus, size: 16),
                ),
                ShadIconButton.outline(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.settings, size: 16),
                ),
                ShadIconButton.ghost(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.bell, size: 16),
                ),
                ShadIconButton.destructive(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.trash, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Loading State'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(
                  onPressed: _loading
                      ? null
                      : () async {
                          setState(() => _loading = true);
                          await Future.delayed(const Duration(seconds: 2));
                          if (mounted) setState(() => _loading = false);
                        },
                  child: _loading
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('Please wait...'),
                          ],
                        )
                      : const Text('Click to Load'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Disabled State'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(onPressed: null, child: const Text('Default')),
                ShadButton.destructive(
                  onPressed: null,
                  child: const Text('Destructive'),
                ),
                ShadButton.outline(
                  onPressed: null,
                  child: const Text('Outline'),
                ),
                ShadButton.secondary(
                  onPressed: null,
                  child: const Text('Secondary'),
                ),
                ShadButton.ghost(onPressed: null, child: const Text('Ghost')),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = ShadTheme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.foreground,
      ),
    );
  }
}
