import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

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
          'Display',
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
            _buildSectionTitle(context, 'Card'),
            const SizedBox(height: 12),
            ShadCard(
              title: const Text('Create project'),
              description: const Text('Deploy your new project in one-click.'),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShadButton.outline(
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ShadButton(onPressed: () {}, child: const Text('Deploy')),
                ],
              ),
              child: const Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      ShadInput(placeholder: Text('Name of your project')),
                    ],
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Framework', style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      ShadInput(placeholder: Text('Next.js')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ShadCard(
              title: const Text('Notifications'),
              description: const Text('You have 3 unread messages.'),
              footer: ShadButton(
                onPressed: () {},
                width: double.infinity,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.check, size: 14),
                    SizedBox(width: 6),
                    Text('Mark all as read'),
                  ],
                ),
              ),
              child: Column(
                children: [
                  _buildNotificationItem(
                    context,
                    LucideIcons.bell,
                    'Your call has been confirmed.',
                    '1 hour ago',
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationItem(
                    context,
                    LucideIcons.user,
                    'You have a new follower!',
                    '2 hours ago',
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationItem(
                    context,
                    LucideIcons.creditCard,
                    'Your subscription is expiring soon.',
                    '1 day ago',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Badge'),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadBadge(child: Text('Default')),
                ShadBadge.secondary(child: Text('Secondary')),
                ShadBadge.outline(child: Text('Outline')),
                ShadBadge.destructive(child: Text('Destructive')),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ShadBadge(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(LucideIcons.check, size: 12),
                      SizedBox(width: 4),
                      Text('Completed'),
                    ],
                  ),
                ),
                ShadBadge.secondary(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(LucideIcons.clock, size: 12),
                      SizedBox(width: 4),
                      Text('Pending'),
                    ],
                  ),
                ),
                ShadBadge.destructive(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(LucideIcons.x, size: 12),
                      SizedBox(width: 4),
                      Text('Failed'),
                    ],
                  ),
                ),
                ShadBadge.outline(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(LucideIcons.star, size: 12),
                      SizedBox(width: 4),
                      Text('Featured'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Avatar'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const ShadAvatar(
                  'https://avatars.githubusercontent.com/u/124599?v=4',
                  placeholder: Text('CN'),
                ),
                const ShadAvatar(
                  'https://avatars.githubusercontent.com/u/1?v=4',
                  placeholder: Text('GH'),
                ),
                ShadAvatar(
                  'invalid-url',
                  placeholder: Text(
                    'JD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.foreground,
                    ),
                  ),
                ),
                const ShadAvatar('', placeholder: Text('AB')),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Separator'),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Radix Primitives'),
                ShadSeparator.horizontal(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: theme.colorScheme.border,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Text('Blog'),
                      ShadSeparator.vertical(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        color: theme.colorScheme.border,
                      ),
                      const Text('Docs'),
                      ShadSeparator.vertical(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        color: theme.colorScheme.border,
                      ),
                      const Text('Source'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Accordion'),
            const SizedBox(height: 12),
            ShadAccordion<String>(
              children: [
                ShadAccordionItem<String>(
                  value: 'item-1',
                  title: const Text('Is it accessible?'),
                  child: const Text(
                    'Yes. It adheres to the WAI-ARIA design pattern.',
                  ),
                ),
                ShadAccordionItem<String>(
                  value: 'item-2',
                  title: const Text('Is it styled?'),
                  child: const Text(
                    "Yes. It comes with default styles that match the other component's aesthetic.",
                  ),
                ),
                ShadAccordionItem<String>(
                  value: 'item-3',
                  title: const Text('Is it animated?'),
                  child: const Text(
                    "Yes. It's animated by default, but you can disable it if you prefer.",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Tabs'),
            const SizedBox(height: 12),
            ShadTabs<String>(
              value: 'account',
              tabs: [
                ShadTab(
                  value: 'account',
                  content: ShadCard(
                    title: const Text('Account'),
                    description: const Text(
                      "Make changes to your account here. Click save when you're done.",
                    ),
                    footer: ShadButton(
                      onPressed: () {},
                      child: const Text('Save changes'),
                    ),
                    child: const Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name', style: TextStyle(fontSize: 13)),
                            SizedBox(height: 4),
                            ShadInput(initialValue: 'Pedro Duarte'),
                          ],
                        ),
                        SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username', style: TextStyle(fontSize: 13)),
                            SizedBox(height: 4),
                            ShadInput(initialValue: '@peduarte'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Account'),
                ),
                ShadTab(
                  value: 'password',
                  content: ShadCard(
                    title: const Text('Password'),
                    description: const Text(
                      "Change your password here. After saving, you'll be logged out.",
                    ),
                    footer: ShadButton(
                      onPressed: () {},
                      child: const Text('Save password'),
                    ),
                    child: const Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current password',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 4),
                            ShadInput(
                              placeholder: Text('Current password'),
                              obscureText: true,
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New password',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(height: 4),
                            ShadInput(
                              placeholder: Text('New password'),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Password'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Table'),
            const SizedBox(height: 12),
            _buildInvoiceTable(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    IconData icon,
    String title,
    String time,
  ) {
    final theme = ShadTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.colorScheme.foreground,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceTable(BuildContext context) {
    final theme = ShadTheme.of(context);

    final invoices = [
      ('INV001', 'Paid', 'Credit Card', '\$250.00'),
      ('INV002', 'Pending', 'PayPal', '\$150.00'),
      ('INV003', 'Unpaid', 'Bank Transfer', '\$350.00'),
      ('INV004', 'Paid', 'Credit Card', '\$450.00'),
      ('INV005', 'Pending', 'PayPal', '\$550.00'),
    ];

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: theme.colorScheme.border),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Invoice',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Status',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Method',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: theme.colorScheme.mutedForeground,
                    ),
                  ),
                ),
                Text(
                  'Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          ...invoices.map((inv) {
            final (invoice, status, method, amount) = inv;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.border,
                    width: invoices.last == inv ? 0 : 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      invoice,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(flex: 2, child: _buildStatusBadge(status)),
                  Expanded(
                    flex: 2,
                    child: Text(
                      method,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.foreground,
                      ),
                    ),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.foreground,
                    ),
                  ),
                ],
              ),
            );
          }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.foreground,
                  ),
                ),
                const SizedBox(width: 32),
                Text(
                  '\$1,750.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.foreground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    switch (status) {
      case 'Paid':
        return ShadBadge(child: Text(status));
      case 'Pending':
        return ShadBadge.secondary(child: Text(status));
      case 'Unpaid':
        return ShadBadge.destructive(child: Text(status));
      default:
        return ShadBadge.outline(child: Text(status));
    }
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
