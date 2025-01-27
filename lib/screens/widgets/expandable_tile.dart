import 'package:stroll_task/imports/imports.dart';

class ExpandableTile extends StatefulWidget {
  final Duration duration;
  final Widget? child;
  final Widget? title;
  final bool enabled;
  final Function? onTap;
  final Icon? icon;

  const ExpandableTile({
    super.key,
    this.icon,
    this.child,
    this.title,
    this.onTap,
    this.enabled = true,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool isExpanded = false;

  double? getExpandedHeight() {
    if (isExpanded && widget.enabled) {
      if (widget.child ==
          null) //Prevents expansion to container's maxHeight, if child is null
        return 0;
      return null;
    } else {
      return 0.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.title != null) widget.title!,
              SizedBox(width: 8),
              AnimatedRotation(
                duration: Duration(milliseconds: 180),
                turns: isExpanded && widget.enabled ? 45 / 180 : 0,
                child: widget.icon ?? Icon(Icons.keyboard_arrow_right, color: Colors.white),
              ),
            ],
          ),
          AnimatedContainer(
            duration: widget.duration,
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            width: double.maxFinite,
            height: getExpandedHeight(),
            decoration: BoxDecoration(),
            child: Visibility(
              visible: isExpanded,
              child: SingleChildScrollView(
                child: widget.child ?? const SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
