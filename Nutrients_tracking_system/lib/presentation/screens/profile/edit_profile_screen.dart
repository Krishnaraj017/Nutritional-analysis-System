import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:statedemo/di/get_it.dart';
import 'package:statedemo/domain/entities/enums.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:statedemo/presentation/cubits/profile/profile_cubit/profile_cubit.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';
import 'package:statedemo/presentation/widgets/rosette_primary_button.dart';
import 'package:statedemo/utils/app_utils.dart';
import 'package:statedemo/utils/extensions/build_context_extensions.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileCubit>(),
      child: this,
    );
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _dobController;
  late final TextEditingController _weightController;
  late final TextEditingController _heightController;
  late final TextEditingController _wakeUpTimeController;
  late final TextEditingController _bedTimeController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Gender _gender;
  DateTime? _dateOfBirth;
  late TimeOfDay _wakeUpTime;
  late TimeOfDay _bedTime;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthCubit>().state.user!;
    _gender = user.gender ?? Gender.male;
    _dateOfBirth = user.dateOfBirth;
    _wakeUpTime = user.wakeUpTime;
    _bedTime = user.bedTime;
    _nameController = TextEditingController(text: user.name);
    _dobController = TextEditingController(text: user.dateOfBirthFormatted);
    _weightController =
        TextEditingController(text: user.weight?.toStringAsFixed(0));
    _heightController =
        TextEditingController(text: user.height?.toStringAsFixed(0));
    _wakeUpTimeController = TextEditingController(
      text: AppUtils.getTimeFromTimeOfDay(timeOfDay: user.wakeUpTime),
    );
    _bedTimeController = TextEditingController(
      text: AppUtils.getTimeFromTimeOfDay(timeOfDay: user.bedTime),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _wakeUpTimeController.dispose();
    _bedTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        context.handleLoading(state is ProfileLoading);
        if (state is ProfileFailure) {
          context.displayError(error: state.error);
        }
        if (state is ProfileSuccess) {
          context.displaySuccessMessage(
            message: 'Profile updated successfully',
          );
          context.read<AuthCubit>().updateUser(state.user);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              filled: true,
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(32),
                    Assets.icons.profile.svg(
                      height: 100,
                      width: 100,
                    ),
                    const Gap(4),
                    ValueListenableBuilder(
                      valueListenable: _nameController,
                      builder: (_, value, ___) => Text(
                        value.text,
                        style: Theme.of(context).textTheme.h2Bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(32),
                    _RowWithField(
                      title: 'Name',
                      field: TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) => value!.isEmpty
                            ? 'Name cannot be empty'
                            : value.length < 3
                                ? 'Name must be at least 3 characters long'
                                : null,
                      ),
                    ),
                    StatefulBuilder(
                      builder: (_, setState) => _RowWithField(
                        title: 'Gender',
                        //gender dropdown
                        field: Row(
                          children: List.generate(
                            Gender.values.length,
                            (index) {
                              final gender = Gender.values[index];
                              return Expanded(
                                child: RadioListTile(
                                  value: gender,
                                  groupValue: _gender,
                                  title: Text(gender.toString()),
                                  onChanged: (value) {
                                    setState(() => _gender = value!);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    _RowWithField(
                      title: 'Date of Birth',
                      field: TextFormField(
                        controller: _dobController,
                        readOnly: true,
                        validator: (value) => value!.isEmpty
                            ? 'Date of birth cannot be empty'
                            : null,
                        onTap: () async {
                          final res = await showDatePicker(
                            context: context,
                            initialDate: _dateOfBirth ?? clock.now(),
                            firstDate: DateTime(1900),
                            lastDate: clock.now(),
                          );
                          if (res != null) {
                            _dateOfBirth = res;
                            _dobController.text =
                                DateFormat('dd/MM/yyyy').format(_dateOfBirth!);
                          }
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
                    _RowWithField(
                      title: 'Weight',
                      field: TextFormField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixText: 'kg',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) => value!.isEmpty
                            ? 'Weight cannot be empty'
                            : value.length < 2
                                ? 'Please enter a valid weight'
                                : null,
                      ),
                    ),
                    _RowWithField(
                      title: 'Height',
                      field: TextFormField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixText: 'cm',
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Height cannot be empty'
                            : value.length < 2
                                ? 'Please enter a valid height'
                                : null,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    _RowWithField(
                      title: 'Wake up time',
                      field: TextFormField(
                        controller: _wakeUpTimeController,
                        readOnly: true,
                        validator: (value) => value!.isEmpty
                            ? 'Wake up time cannot be empty'
                            : null,
                        onTap: () async {
                          final res = await showTimePicker(
                            context: context,
                            initialTime: _wakeUpTime,
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: false,
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (res != null) {
                            _wakeUpTime = res;
                            _wakeUpTimeController.text =
                                AppUtils.getTimeFromTimeOfDay(timeOfDay: res);
                          }
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                    _RowWithField(
                      title: 'Bed time',
                      field: TextFormField(
                        readOnly: true,
                        controller: _bedTimeController,
                        validator: (value) =>
                            value!.isEmpty ? 'Bed time cannot be empty' : null,
                        onTap: () async {
                          final res = await showTimePicker(
                            context: context,
                            initialTime: _bedTime,
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: false,
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (res != null) {
                            _bedTime = res;
                            _bedTimeController.text =
                                AppUtils.getTimeFromTimeOfDay(timeOfDay: res);
                          }
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                    const Gap(32),
                    Center(
                      child: RosettePrimaryButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          final user = context.read<AuthCubit>().state.user!;
                          final updatedUser = user.copyWith(
                            name: _nameController.text,
                            height: double.tryParse(_heightController.text),
                            weight: double.tryParse(_weightController.text),
                            dateOfBirth: _dateOfBirth,
                            bedTime: _bedTime,
                            gender: _gender,
                            wakeUpTime: _wakeUpTime,
                          );
                          context
                              .read<ProfileCubit>()
                              .updateProfile(updatedUser);
                        },
                        width: 179,
                        height: 52,
                        child: const Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RowWithField extends StatelessWidget {
  final String title;
  final Widget field;

  const _RowWithField({required this.title, required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          field,
        ],
      ),
    );
  }
}
