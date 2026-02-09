import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/features/auth/presentation/widgets/custom_text_field.dart';

class AddressForm extends StatefulWidget {
  AddressForm({super.key});

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

  late TextEditingController addressDdetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();

    governorate = TextEditingController();

    city = TextEditingController();

    street = TextEditingController();

    addressDdetails = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();

    return Column(
      children: [
        CustomTextField(label: 'الاسم الاول', icon: null, controller: name),
        CustomTextField(
          label: "الاسم الأخير",
          icon: null,
          controller: lastName,
        ),
        CustomTextField(
          label: "رقم الهاتف",
          icon: null,
          controller: phone,
          keyboardType: TextInputType.phone,
        ),
        CustomTextField(
          label: "البريد الإلكتروني",
          icon: null,
          controller: email,
          keyboardType: TextInputType.emailAddress,
        ),

        Row(
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              child: CustomTextField(
                label: 'المحافظة',
                controller: governorate,
              ),
            ),
            SizedBox(width: layout.sm),
            Expanded(
              child: CustomTextField(label: "المدينة", controller: city),
            ),
            SizedBox(width: layout.sm),
            Expanded(
              child: CustomTextField(label: "الشارع", controller: street),
            ),
          ],
        ),
        CustomTextField(label: "تفاصيل العنوان", controller: addressDdetails),
      ],
    );
  }
}
