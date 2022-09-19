import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;

  final GlobalKey backgroundImagekey = GlobalKey();

  MovieListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            children: [
              Flow(
                delegate: _ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context)!,
                  ListItemContext: context,
                  backgroundImagekey: backgroundImagekey,
                ),
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    key: backgroundImagekey,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 0.95],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      information,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext ListItemContext;
  final GlobalKey backgroundImagekey;

  _ParallaxFlowDelegate(
      {required this.scrollable,
      required this.ListItemContext,
      required this.backgroundImagekey})
      : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
//calcualate the position of the list time with in the viewport
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final ListItemBox = ListItemContext.findRenderObject() as RenderBox;
    final ListItemOffset = ListItemBox.localToGlobal(
      ListItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    //determine the percent postion of the list itemwithin the scrollable are
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (ListItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    //calculate the vertical alignment of the background based on the scroll

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    //covert the backgound alignment into pixel offset for painting purpose.
    final backgroundSize =
        (backgroundImagekey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final ListItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & ListItemSize);

    //paint the background
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant _ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        ListItemContext != oldDelegate.ListItemContext ||
        backgroundImagekey != oldDelegate.backgroundImagekey;
  }
}
