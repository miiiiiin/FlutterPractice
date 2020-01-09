import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {

  final _formKey = GlobalKey<FormState>(); //globalKey: 반드시 전체 내에서 유니크한 값이어야함. 위젯 내에서 유니크한 값 form이 글로벌 키를 통해 form의 사태를 알수 있음. formState를 generic으로 생성
  FocusNode nameFocusNode;
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode(); //생성, 다 쓰고난 후 해제해야함
  }

  @override
  void dispose() {
    nameFocusNode.dispose();//화면이 없어지기 전에 dispose해야함
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey, //global form key 세팅
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //left
          children: <Widget>[

            TextFormField(
              validator: (value) {
                //validate 규칙 setting
                if (value.isEmpty) {
                  return '공백 허용 x';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(onPressed: () {
                if (_formKey.currentState.validate()) { //valid한지 체크
                  // Valid
                  Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(content: Text('처리 중'))); //formkey를 이용하여 context 오류 해결 가능(formkey는 별도의 context를 가지고 있음)
                }
              },
              child: Text('완료'),
              ),
            ),
            TextField(
              controller: nameController, // 텍스트필드의 값을 컨트롤하기 위해
              //formfield와 달리 validator 기능이 없음
              onChanged: (text) {//text값 매개변수로 넘어옴
                print(text); //입력글자 변경될때마다 실행
              },
              focusNode: nameFocusNode,
              autofocus: true,
              decoration: InputDecoration(
                hintText: '이름을 입력해주세요',
                border: InputBorder.none,
                labelText: '이름'
              ),
            ),
            RaisedButton(onPressed: () {
              FocusScope.of(context).requestFocus(nameFocusNode);
            },
            child: Text('포커스'),
            ),
            RaisedButton(onPressed: () {
              print(nameController.text);//namecontroller 이용하여 text값 가져올 수 있음
              showDialog(context: context,
                  builder: (context) {
                  return AlertDialog(
                    content: Text(nameController.text),
                  );
              });
            },
              child: Text('Textfield 값 확인'),
            ),
          ],
        )),
      )
    );
  }
}
