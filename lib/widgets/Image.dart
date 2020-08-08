import 'package:flutter/material.dart';

class ImageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image示例"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("images/ic_launcher.png"),
                width: 100,
              ),
              Image.asset(
                "images/ic_launcher.png",
                width: 100,
              ),
              Text("从asset中加载图片")
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg"),
                width: 100,
              ),
              Image.network(
                "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                width: 100,
              ),
              Text("从网络中加载图片")
            ],
          ),
          Divider(),
          Container(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Image的fit属性："),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                        width: 100,
                        fit: BoxFit.contain,
                        height: 50,
                      ),
                      Text("BoxFit.contain(默认)")
                    ],
                  ),
                  Divider(
                    color: Colors.purpleAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                        width: 100,
                        fit: BoxFit.fill,
                        height: 50,
                      ),
                      Expanded(
                          child:
                              Text("BoxFit.fill,会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形"))
                    ],
                  ),
                  Divider(
                    color: Colors.purpleAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                        width: 100,
                        fit: BoxFit.fitWidth,
                        height: 50,
                      ),
                      Expanded(
                          child: Text(
                              "BoxFit.fitWidth,图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁"))
                    ],
                  ),
                  Divider(
                    color: Colors.purpleAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                        width: 100,
                        fit: BoxFit.fitHeight,
                        height: 50,
                      ),
                      Expanded(
                          child: Text(
                              "BoxFit.fitHeight,图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁"))
                    ],
                  ),
                  Divider(
                    color: Colors.purpleAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                        width: 100,
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                      Expanded(
                        child: Text(
                          "BoxFit.cover,会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁",
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ],
              )),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("混合模式 colorBlendMode:"),
                Image.network(
                  "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                  width: 100,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("repeat:"),
                  Image.network(
                    "http://img18.3lian.com/d/file/201709/21/a05161a4469dc5ef8be88ee217d53d92.jpg",
                    width: 100,
                    height: 200,
                    repeat: ImageRepeat.repeatY,
                  ),
                ]),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Icon（iconfont）",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _createIcon(),
                Text("使用IconData和Icon显示如上效果"),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.accessible,
                      size: 34,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.error,
                      size: 34,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.fingerprint,
                      size: 34,
                      color: Colors.green,
                    ),
                  ],
                ),
                Text("使用自定义字体图标（从iconfront中下载素材）"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      MyIcons.wechat,
                      size: 34,
                      color: Colors.green,
                    ),
                    Icon(
                      MyIcons.book,
                      size: 34,
                      color: Colors.greenAccent,
                    ),
                    Icon(
                      MyIcons.coffee,
                      size: 34,
                      color: Colors.lightGreenAccent,
                    ),
                    Icon(
                      MyIcons.juice,
                      size: 34,
                      color: Colors.teal,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createIcon() {
    String icons = "";
    // accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
    // error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
    // fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Text.rich(TextSpan(
      children: [
        TextSpan(text: "\n直接用字符串\n"),
        TextSpan(
            text: icons,
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 34,
                color: Colors.green)),
      ],
    ));
  }
}

class MyIcons {
  static const IconData wechat =
      const IconData(0xe65d, fontFamily: "MyIcons");
  static const IconData book =
  const IconData(0xe627, fontFamily: "MyIcons", matchTextDirection: true);
  static const IconData coffee =
  const IconData(0xe601, fontFamily: "MyIcons", matchTextDirection: true);
  static const IconData juice =
  const IconData(0xe602, fontFamily: "MyIcons", matchTextDirection: true);
}
