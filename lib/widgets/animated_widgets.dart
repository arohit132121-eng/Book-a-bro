import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Staggered pop-in container used for list items.
/// index: used to stagger -> multiply by 60ms
class PopIn extends StatefulWidget {
  final Widget child;
  final int index;
  final Duration duration;
  const PopIn({super.key, required this.child, this.index = 0, this.duration = const Duration(milliseconds: 420)});

  @override
  State<PopIn> createState() => _PopInState();
}

class _PopInState extends State<PopIn> with SingleTickerProviderStateMixin {
  late final AnimationController _ctr;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctr = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _ctr, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero).animate(CurvedAnimation(parent: _ctr, curve: Curves.easeOut));

    // staggered start
    final delay = (widget.index * 70).clamp(0, 500);
    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) _ctr.forward();
    });
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

/// BounceButton: wraps any child, gives tiny scale animation on tap.
class BounceButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final double scale;
  final Duration duration;
  const BounceButton({super.key, required this.child, required this.onTap, this.scale = 1.06, this.duration = const Duration(milliseconds: 120)});

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> with SingleTickerProviderStateMixin {
  late final AnimationController _ctr;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctr = AnimationController(vsync: this, duration: widget.duration);
    _scale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: widget.scale).chain(CurveTween(curve: Curves.easeOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: widget.scale, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 50),
    ]).animate(_ctr);
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  void _tap() async {
    try {
      _ctr.forward();
      await Future.delayed(widget.duration);
      _ctr.reset();
    } catch (_) {}
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, __) => Transform.scale(scale: _scale.value, child: widget.child),
      ),
    );
  }
}

/// Blue three-dot typing indicator
class BlueTypingIndicator extends StatefulWidget {
  final double dotSize;
  const BlueTypingIndicator({super.key, this.dotSize = 6});

  @override
  State<BlueTypingIndicator> createState() => _BlueTypingIndicatorState();
}

class _BlueTypingIndicatorState extends State<BlueTypingIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _ctr;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctr = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat();
    _anim = CurvedAnimation(parent: _ctr, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF007AFF);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _anim,
          builder: (_, __) {
            final t = (_anim.value + (i * 0.18)) % 1.0;
            final scale = 0.6 + (0.8 * (0.5 + 0.5 * math.sin(2 * math.pi * t)));
            final opacity = 0.45 + 0.55 * (0.5 + 0.5 * math.cos(2 * math.pi * t));
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Opacity(
                opacity: opacity.clamp(0.2, 1.0),
                child: Transform.scale(
                  scale: scale.clamp(0.6, 1.4),
                  child: Container(width: widget.dotSize * 1.8, height: widget.dotSize * 1.8, decoration: BoxDecoration(color: blue, shape: BoxShape.circle)),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
