import 'package:flutter/material.dart';
import 'package:pentagonselllit/Elements/AppBars/AssosAppBar.dart';
import 'package:pentagonselllit/Elements/AppSideBars/NormalSideBar.dart';

class TemplateView extends StatefulWidget {
  Widget widgets;
  TemplateView({Key key, @required this.widgets}) : super(key: key);

  @override
  _TemplateViewState createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Widget> wid = [];
    wid.add(AssosAppBar(globalKey, context, "template"));
    wid.add(Center(child: widget.widgets));

    return Scaffold(
      key: globalKey,
      drawer: NormalSideBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: wid,
        ),
      ),
    );
  }
}
