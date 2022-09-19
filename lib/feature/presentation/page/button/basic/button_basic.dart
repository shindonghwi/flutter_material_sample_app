import 'package:flutter/material.dart';

class ButtonBasic extends StatefulWidget {
  final String title;

  // final Color title;
  const ButtonBasic(this.title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonBasicState();
}

class _ButtonBasicState extends State<ButtonBasic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Basic'),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Container(
            child: Column(
              children: [
                const ButtonTitleWidget(title: "Basic Button"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: null, child: Text(widget.title)),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class ButtonTitleWidget extends StatelessWidget {
  final String title;

  const ButtonTitleWidget({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Divider(thickness: 0.5, height: 1, color: Colors.grey),
        ))
      ],
    );
  }
}

class Square extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(),
      ),
    );
  }
}
