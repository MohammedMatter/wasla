import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/lang_keys.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late TextEditingController name;
  late TextEditingController lastName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController governorate;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController addressDetails;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    governorate = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    addressDetails = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    lastName.dispose();
    phone.dispose();
    email.dispose();
    governorate.dispose();
    city.dispose();
    street.dispose();
    addressDetails.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Column(
      children: [
        CustomTextField(
          label: LangKeys.firstName.tr(),
          icon: null,
          controller: name,
        ),
        SizedBox(height: layout.sm),

        CustomTextField(
          label: LangKeys.lastName.tr(),
          icon: null,
          controller: lastName,
        ),
        SizedBox(height: layout.sm),

        CustomTextField(
          label: LangKeys.phoneNumber.tr(),
          icon: null,
          controller: phone,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: layout.sm),

        CustomTextField(
          label: LangKeys.email.tr(),
          icon: null,
          controller: email,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: layout.sm),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: LangKeys.province.tr(),
                controller: governorate,
              ),
            ),
            SizedBox(width: layout.sm),
            Expanded(
              child: CustomTextField(
                label: LangKeys.city.tr(),
                controller: city,
              ),
            ),
            SizedBox(width: layout.sm),
            Expanded(
              child: CustomTextField(
                label: LangKeys.street.tr(),
                controller: street,
              ),
            ),
          ],
        ),
        SizedBox(height: layout.sm),

        CustomTextField(
          label: LangKeys.addressDetails.tr(),
          controller: addressDetails,
        ),
      ],
    );
  }
}
