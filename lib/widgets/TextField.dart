import 'package:flutter/material.dart';
import 'Toast.dart';

class TextFieldSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: ListView(
        children: <Widget>[
          LoginSample1(),
          TextFieldListen(),
          FocusNodeSample(),
          CustomTextFieldStyle(),
          CustomTextFieldStyle2(),
          FormSample(),
        ],
      ),
    );
  }
}

class LoginSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginSample1State();
  }
}

/// 输入框示例
class LoginSample1State extends State<LoginSample1> {
  String _onChangedValue = "";

  TextEditingController _phoneController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
//          autofocus: true,
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
          onChanged: (value) {
            setState(() {
              _onChangedValue = value;
            });
          },
          controller: _phoneController,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)),
          controller: _passwordController,
          textInputAction: TextInputAction.done,
        ),
        Row(
          children: <Widget>[Text("onChanged:"), Text(_onChangedValue)],
        ),
        Row(
          children: <Widget>[
            Text("onButtonPressed:"),
            Text(_passwordController.text)
          ],
        ),
        RaisedButton(
            onPressed: () {
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("登录"),
              width: 100,
              height: 50,
            ))
      ],
    );
  }
}

/// 输入框监听
class TextFieldListen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFieldListenState();
  }
}

class TextFieldListenState extends State<TextFieldListen> {
  TextEditingController _selectionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectionController.addListener(() {
      // 当输入框的焦点变化时也会回调，而onChanged不会
      Toast.toast(context, _selectionController.text);
    });
    _selectionController.text = "这个是默认内容";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "监听文本变化：",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            decoration: InputDecoration(hintText: "在这里输入内容"),
            controller: _selectionController,
          )
        ],
      ),
    );
  }
}

/// 焦点示例
class FocusNodeSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FocusNodeSampleState();
  }
}

class FocusNodeSampleState extends State<FocusNodeSample> {
  FocusNode _focusNode1 = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      Toast.toast(context, "Input1是否有焦点：${_focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "手动更改焦点：",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          TextField(
            focusNode: _focusNode1,
            autofocus: true,
            decoration: InputDecoration(
                hintText: "Input1", hintStyle: TextStyle(color: Colors.lime)),
          ),
          TextField(
            focusNode: _focusNode2,
            decoration: InputDecoration(hintText: "Input2"),
          ),
          RaisedButton(
              onPressed: () {
                if (_focusScopeNode == null) {
                  _focusScopeNode = FocusScope.of(context);
                }
                _focusScopeNode.requestFocus(_focusNode2);
              },
              child: Text("移动焦点")),
          RaisedButton(
            onPressed: () {
              _focusNode1.unfocus();
              _focusNode2.unfocus();
            },
            child: Text("隐藏键盘"),
          ),
        ],
      ),
    );
  }
}

/// 自定义TextField样式
class CustomTextFieldStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomTextFieldStyleState();
  }
}

/// 经实验，根据就近原则取样式，
/// 未获取焦点时，下划线的颜色就是theme的hintColor，获得焦点后是theme的primaryColor，
/// 未定义label样式时，label的颜色是下划线的颜色
class CustomTextFieldStyleState extends State<CustomTextFieldStyle> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.pink,
            primaryColor: Colors.brown,
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(color: Colors.deepPurple),
                labelStyle: TextStyle(color: Colors.purpleAccent))),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "自定义TextFiled样式：",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "label颜色在theme中设置",
                    hintText: "hint颜色在theme和TextField里面都设置",
                    hintStyle: TextStyle(color: Colors.amber)),
                cursorColor: Colors.green,
                cursorWidth: 5,
                cursorRadius: Radius.circular(3),
                style: TextStyle(color: Colors.greenAccent),
              )
            ],
          ),
        ));
  }
}

/// 自定义输入框样式（通过组合组件的方式）
class CustomTextFieldStyle2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomTextFieldStyle2State();
  }
}

class CustomTextFieldStyle2State extends State<CustomTextFieldStyle2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "自定义TextFiled样式(组合组件的方式)：",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email地址",
                hintText: "电子邮件地址",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.green, width: 2))),
          )
        ],
      ),
    );
  }
}

/// 表单示例
class FormSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormSampleState();
  }
}

class FormSampleState extends State<FormSample> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "表单示例:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                ),
                validator: (name) => name.trim().length > 0 ? null : "用户名不能为空",
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                ),
                validator: (name) =>
                    name.trim().length > 5 ? null : "密码长度不能小于6位",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      onPressed: () {
                        print(context);

//                        if (Form.of(context).validate()) {                      // 报错，因为这里的context是FormSample的context，
//                                                                                    而Form.of(context)是根据所指定context向根去查找，
//                                                                                    而FormState是在FormSample的子树中，所以不行。
                        if ((_formKey.currentState as FormState).validate()) {
                          Toast.toast(context, "提交成功");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "登录",
                      ),
                      color: Theme.of(context).primaryColor,
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Builder(builder: (context) {
                      return RaisedButton(
                        textColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        onPressed: () {
                          print(context);

                          if (Form.of(context).validate()) {
                            Toast.toast(context, "提交成功");
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "登录(Builder构建的button)",
                        ),
                        color: Theme.of(context).primaryColor,
                      );
                    }))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
