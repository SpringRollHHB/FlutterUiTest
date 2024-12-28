import 'package:flutter/cupertino.dart';

class HhbAutomaticKeepAliveClientMixinWidget extends StatefulWidget {
  const HhbAutomaticKeepAliveClientMixinWidget({super.key});

  @override
  State<HhbAutomaticKeepAliveClientMixinWidget> createState() => _HhbAutomaticKeepAliveClientMixinWidgetState();
}

class _HhbAutomaticKeepAliveClientMixinWidgetState extends State<HhbAutomaticKeepAliveClientMixinWidget> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Placeholder();
  }

  @override
  bool get wantKeepAlive => true;

}
