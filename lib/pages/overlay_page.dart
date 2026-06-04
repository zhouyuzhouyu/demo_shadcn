import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OverlayPage extends StatefulWidget {
  const OverlayPage({super.key});

  @override
  State<OverlayPage> createState() => _OverlayPageState();
}

class _OverlayPageState extends State<OverlayPage> {
  final _popoverController = ShadPopoverController();

  @override
  void dispose() {
    _popoverController.dispose();
    super.dispose();
  }

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
          'Overlays',
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
            _buildSectionTitle(context, 'Dialog'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(
                  onPressed: () => _showDialog(context),
                  child: const Text('Open Dialog'),
                ),
                ShadButton.outline(
                  onPressed: () => _showScrollableDialog(context),
                  child: const Text('Scrollable Dialog'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Alert Dialog'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton.destructive(
                  onPressed: () => _showAlertDialog(context),
                  child: const Text('Delete Account'),
                ),
                ShadButton.outline(
                  onPressed: () => _showConfirmDialog(context),
                  child: const Text('Confirm Action'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Sheet'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadButton(
                  onPressed: () => _showSheet(context, ShadSheetSide.right),
                  child: const Text('Right Sheet'),
                ),
                ShadButton.outline(
                  onPressed: () => _showSheet(context, ShadSheetSide.left),
                  child: const Text('Left Sheet'),
                ),
                ShadButton.outline(
                  onPressed: () => _showSheet(context, ShadSheetSide.top),
                  child: const Text('Top Sheet'),
                ),
                ShadButton.outline(
                  onPressed: () => _showSheet(context, ShadSheetSide.bottom),
                  child: const Text('Bottom Sheet'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Tooltip'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadTooltip(
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('Add to library'),
                  ),
                  child: ShadIconButton.outline(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.plus, size: 16),
                  ),
                ),
                ShadTooltip(
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('Delete item'),
                  ),
                  child: ShadIconButton.ghost(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.trash, size: 16),
                  ),
                ),
                ShadTooltip(
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('Open settings'),
                  ),
                  child: ShadIconButton.ghost(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.settings, size: 16),
                  ),
                ),
                ShadTooltip(
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('Send email'),
                  ),
                  child: ShadButton(
                    onPressed: () {},
                    leading: const Icon(LucideIcons.mail, size: 16),
                    child: const Text('Email'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Popover'),
            const SizedBox(height: 12),
            ShadPopover(
              controller: _popoverController,
              popover: (context) => SizedBox(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Dimensions',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.foreground,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Set the dimensions for the layer.',
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.mutedForeground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Width',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.colorScheme.foreground,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const ShadInput(initialValue: '100%'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.colorScheme.foreground,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const ShadInput(initialValue: '25px'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ShadButton(
                        onPressed: () => _popoverController.hide(),
                        child: const Text('Save changes'),
                      ),
                    ],
                  ),
                ),
              ),
              child: ShadButton.outline(
                onPressed: _popoverController.toggle,
                child: const Text('Open Popover'),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Edit Profile'),
        description: const Text(
          "Make changes to your profile here. Click save when you're done.",
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ShadButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Save changes'),
          ),
        ],
        child: const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      ShadInput(initialValue: 'Pedro Duarte'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      ShadInput(initialValue: '@peduarte'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showScrollableDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Terms of Service'),
        description: const Text('Please read and accept our terms.'),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Decline'),
          ),
          ShadButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Accept'),
          ),
        ],
        child: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. '
              'Nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
              'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
              'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
              'culpa qui officia deserunt mollit anim id est laborum.\n\n'
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
              'accusantium doloremque laudantium totam rem aperiam eaque ipsa.',
              style: TextStyle(
                fontSize: 13,
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('Are you absolutely sure?'),
        description: const Text(
          'This action cannot be undone. This will permanently delete your '
          'account and remove your data from our servers.',
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ShadButton.destructive(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: const Text('Confirm Action'),
        description: const Text(
          'Are you sure you want to proceed with this action?',
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ShadButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              ShadToaster.of(context).show(
                const ShadToast(
                  title: Text('Action confirmed!'),
                  description: Text('Your action has been processed.'),
                ),
              );
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _showSheet(BuildContext context, ShadSheetSide side) {
    showShadSheet(
      context: context,
      side: side,
      builder: (context) => ShadSheet(
        title: const Text('Edit Profile'),
        description: const Text(
          "Make changes to your profile here. Click save when you're done.",
        ),
        actions: [
          ShadButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Save changes'),
          ),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(fontSize: 13)),
                  SizedBox(height: 4),
                  ShadInput(
                    initialValue: 'Pedro Duarte',
                    placeholder: Text('Your name'),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username', style: TextStyle(fontSize: 13)),
                  SizedBox(height: 4),
                  ShadInput(
                    initialValue: '@peduarte',
                    placeholder: Text('Your username'),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bio', style: TextStyle(fontSize: 13)),
                  SizedBox(height: 4),
                  ShadTextarea(placeholder: Text('Tell us about yourself')),
                ],
              ),
            ],
          ),
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
