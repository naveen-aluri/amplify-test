import 'package:amplify_test/bloc/gender_selection_bloc.dart';
import 'package:amplify_test/common_widgets/common_textfield.dart';
import 'package:amplify_test/common_widgets/custom_dropdown.dart';
import 'package:amplify_test/common_widgets/gender_widget.dart';
import 'package:amplify_test/utils/strings.dart';
import 'package:amplify_test/utils/styles.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailController = new TextEditingController();
  int _selectedGenderIndex;
  String _selectedDuration;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text('What\'s your email address?',
            style: Styles.bold(color: Colors.black)),
        SizedBox(height: 10),
        CommonTextField(
          controller: _emailController,
          currentFocusNode: FocusNode(),
          nextFocusNode: FocusNode(),
          hint: 'Email',
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          borderColor: Colors.grey[300],
          fillColor: Colors.grey[100],
        ),
        SizedBox(height: 30),
        Text('What\'s your gender?', style: Styles.bold(color: Colors.black)),
        SizedBox(height: 10),
        StreamBuilder(
            stream: genderSelectionBloc.responseData,
            builder: (context, AsyncSnapshot<int> genderIndex) {
              _selectedGenderIndex = genderIndex.data;
              return GenderWidget(index: _selectedGenderIndex);
            }),
        SizedBox(height: 30),
        Text('How much do you train?', style: Styles.bold(color: Colors.black)),
        SizedBox(height: 10),
        CustomDropDown(
          dropDownMenuItems: TRAINING_DURATION_LIST.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child:
                  new Text(value, style: Styles.regular(color: Colors.black)),
            );
          }).toList(),
          valueChanged: (val) {
            setState(() {
              _selectedDuration = val;
            });
          },
          value: _selectedDuration ?? TRAINING_DURATION_LIST[0],
        )
      ],
    );
  }
}
