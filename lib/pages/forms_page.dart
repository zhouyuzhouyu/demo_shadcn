import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  bool _checkboxValue = false;
  bool _termsValue = false;
  bool _switchAirplane = false;
  bool _switchNotifications = true;
  String _radioValue = 'comfortable';
  String? _selectedFruit;
  String? _selectedTimezone;
  double _sliderValue = 33;
  final _formKey = GlobalKey<ShadFormState>();

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
          'Forms',
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
            _buildSectionTitle(context, 'Input'),
            const SizedBox(height: 12),
            const ShadInput(
              placeholder: Text('Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            const ShadInput(placeholder: Text('Password'), obscureText: true),
            const SizedBox(height: 8),
            const ShadInput(
              placeholder: Text('Search...'),
              leading: Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(LucideIcons.search, size: 16),
              ),
            ),
            const SizedBox(height: 8),
            ShadInput(
              placeholder: const Text('Enter amount'),
              keyboardType: TextInputType.number,
              trailing: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'USD',
                  style: TextStyle(color: theme.colorScheme.mutedForeground),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const ShadInput(
              placeholder: Text('Disabled input'),
              enabled: false,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Textarea'),
            const SizedBox(height: 12),
            const ShadTextarea(placeholder: Text('Type your message here.')),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Checkbox'),
            const SizedBox(height: 12),
            ShadCheckbox(
              value: _termsValue,
              onChanged: (v) => setState(() => _termsValue = v),
              label: const Text('Accept terms and conditions'),
              sublabel: const Text(
                'You agree to our Terms of Service and Privacy Policy.',
              ),
            ),
            const SizedBox(height: 8),
            ShadCheckbox(
              value: _checkboxValue,
              onChanged: (v) => setState(() => _checkboxValue = v),
              label: const Text('Send me email notifications'),
            ),
            const SizedBox(height: 8),
            const ShadCheckbox(
              value: false,
              onChanged: null,
              label: Text('Disabled checkbox'),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Switch'),
            const SizedBox(height: 12),
            ShadSwitch(
              value: _switchAirplane,
              onChanged: (v) => setState(() => _switchAirplane = v),
              label: const Text('Airplane Mode'),
            ),
            const SizedBox(height: 8),
            ShadSwitch(
              value: _switchNotifications,
              onChanged: (v) => setState(() => _switchNotifications = v),
              label: const Text('Push Notifications'),
              sublabel: const Text('Receive alerts about your account.'),
            ),
            const SizedBox(height: 8),
            const ShadSwitch(
              value: false,
              onChanged: null,
              label: Text('Disabled switch'),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Radio Group'),
            const SizedBox(height: 12),
            ShadRadioGroup<String>(
              initialValue: _radioValue,
              onChanged: (v) => setState(() => _radioValue = v ?? _radioValue),
              items: const [
                ShadRadio(
                  value: 'default',
                  label: Text('Default'),
                  sublabel: Text('The default system layout.'),
                ),
                ShadRadio(
                  value: 'comfortable',
                  label: Text('Comfortable'),
                  sublabel: Text('A slightly more spaced layout.'),
                ),
                ShadRadio(
                  value: 'compact',
                  label: Text('Compact'),
                  sublabel: Text('A tighter, denser layout.'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Selected: $_radioValue',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Select'),
            const SizedBox(height: 12),
            ShadSelect<String>(
              placeholder: const Text('Select a fruit'),
              options: const [
                ShadOption(value: 'apple', child: Text('Apple')),
                ShadOption(value: 'banana', child: Text('Banana')),
                ShadOption(value: 'cherry', child: Text('Cherry')),
                ShadOption(value: 'date', child: Text('Date')),
                ShadOption(value: 'elderberry', child: Text('Elderberry')),
                ShadOption(value: 'fig', child: Text('Fig')),
                ShadOption(value: 'grape', child: Text('Grape')),
              ],
              selectedOptionBuilder: (context, value) => Text(value),
              onChanged: (value) => setState(() => _selectedFruit = value),
            ),
            if (_selectedFruit != null) ...[
              const SizedBox(height: 8),
              Text(
                'Selected: $_selectedFruit',
                style: TextStyle(
                  color: theme.colorScheme.mutedForeground,
                  fontSize: 13,
                ),
              ),
            ],
            const SizedBox(height: 16),
            ShadSelect<String>(
              placeholder: const Text('Select a timezone'),
              options: [
                _buildSelectGroupLabel(context, 'North America'),
                const ShadOption(
                  value: 'est',
                  child: Text('Eastern Standard Time (EST)'),
                ),
                const ShadOption(
                  value: 'cst',
                  child: Text('Central Standard Time (CST)'),
                ),
                const ShadOption(
                  value: 'pst',
                  child: Text('Pacific Standard Time (PST)'),
                ),
                _buildSelectGroupLabel(context, 'Europe'),
                const ShadOption(
                  value: 'gmt',
                  child: Text('Greenwich Mean Time (GMT)'),
                ),
                const ShadOption(
                  value: 'cet',
                  child: Text('Central European Time (CET)'),
                ),
              ],
              selectedOptionBuilder: (context, value) => Text(value),
              onChanged: (value) => setState(() => _selectedTimezone = value),
            ),
            if (_selectedTimezone != null) ...[
              const SizedBox(height: 8),
              Text(
                'Timezone: $_selectedTimezone',
                style: TextStyle(
                  color: theme.colorScheme.mutedForeground,
                  fontSize: 13,
                ),
              ),
            ],
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Slider'),
            const SizedBox(height: 12),
            ShadSlider(
              initialValue: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (v) => setState(() => _sliderValue = v),
            ),
            const SizedBox(height: 4),
            Text(
              'Value: ${_sliderValue.round()}',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Input OTP'),
            const SizedBox(height: 12),
            ShadInputOTP(
              maxLength: 6,
              children: [
                const ShadInputOTPGroup(
                  children: [
                    ShadInputOTPSlot(),
                    ShadInputOTPSlot(),
                    ShadInputOTPSlot(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    LucideIcons.minus,
                    size: 16,
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
                const ShadInputOTPGroup(
                  children: [
                    ShadInputOTPSlot(),
                    ShadInputOTPSlot(),
                    ShadInputOTPSlot(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Form with Validation'),
            const SizedBox(height: 12),
            ShadForm(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShadInputFormField(
                    id: 'username',
                    label: const Text('Username'),
                    placeholder: const Text('shadcn'),
                    description: const Text(
                      'This is your public display name.',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a username';
                      }
                      if (value.length < 2) {
                        return 'Username must be at least 2 characters';
                      }
                      if (value.length > 30) {
                        return 'Username must be at most 30 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadInputFormField(
                    id: 'email',
                    label: const Text('Email'),
                    placeholder: const Text('name@example.com'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ShadSelectFormField<String>(
                    id: 'role',
                    label: const Text('Role'),
                    placeholder: const Text('Select a role'),
                    validator: (value) {
                      if (value == null) return 'Please select a role';
                      return null;
                    },
                    options: const [
                      ShadOption(value: 'admin', child: Text('Admin')),
                      ShadOption(value: 'user', child: Text('User')),
                      ShadOption(value: 'viewer', child: Text('Viewer')),
                    ],
                    selectedOptionBuilder: (context, value) => Text(value),
                  ),
                  const SizedBox(height: 16),
                  ShadCheckboxFormField(
                    id: 'newsletter',
                    label: const Text('Subscribe to newsletter'),
                    initialValue: false,
                    inputLabel: const Text('Email updates'),
                    validator: (v) => null,
                  ),
                  const SizedBox(height: 24),
                  ShadButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final data = _formKey.currentState!.value;
                        ShadToaster.of(context).show(
                          ShadToast(
                            title: const Text('Form submitted!'),
                            description: Text('Data: ${data.toString()}'),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectGroupLabel(BuildContext context, String label) {
    final theme = ShadTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(
        label,
        textAlign: TextAlign.start,
        style: theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.popoverForeground,
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
