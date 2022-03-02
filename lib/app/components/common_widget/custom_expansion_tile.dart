

import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';




class ExpansionTile extends StatefulWidget {

  ExpansionTile({
    Key? key,
    this.contentPadding,
    this.verticalVisualDensity = 0.0,
    this.isIcon = false,
    this.tileHeight,
    this.leading,
    @required this.title,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  final Widget? leading;
  final bool isIcon;
  final Widget? title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget>? children;
  final double? tileHeight;
  final EdgeInsetsGeometry? contentPadding;
  late double verticalVisualDensity;
  final Widget? trailing;
  final bool? initiallyExpanded;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<ExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);


  late AnimationController _controller;
  late Animation<double?> _heightFactor;


  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {

    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            SizedBox(
               height: widget.tileHeight,
               child: Theme(
                 data: ThemeData(
                     splashColor: Colors.transparent,
                     highlightColor: Colors.transparent
                 ),
                 child: ListTile(
                   visualDensity: VisualDensity(horizontal: 0,vertical: widget.verticalVisualDensity),
                   minVerticalPadding: 0,
                   contentPadding: widget.contentPadding,
                   dense: true,
                   onTap: _handleTap,
                   leading: widget.leading,
                   title: widget.title,
                   trailing: widget.trailing ??
                       RotationTransition(
                         turns: _controller.drive(_halfTween.chain(_easeInTween)),
                         child: widget.isIcon ?
                                Container(color: Colors.transparent,width: 1,) :
                                Image.asset(
                           _isExpanded ?  AppAsset.minus : AppAsset.plus,
                           height: 14,
                           color: appColorDarkGrey,
                           width: 14,
                         )
                       ),
                 ),
               ),
             ),

             ClipRect(
              child: Align(
                heightFactor: _heightFactor.value,
                child: child,
              ),
            ),
        ],
      );
  }


  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children!),
    );
  }
}
