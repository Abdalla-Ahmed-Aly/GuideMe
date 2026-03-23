import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class AiTripLoading extends StatelessWidget {
  const AiTripLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            const Center(child: PulsingCircle()),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              iconColor: Colors.amber,
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              iconSize: 44,
              iconColor: Colors.amberAccent,
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              iconSize: 32,
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              iconSize: 54,
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              widget: _buildOutlineCircle(),
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              widget: _buildOutlineCircle(size: 10),
            ),

            FloatingWidget(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              widget: _buildFilledCircle(size: 10),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Lottie.asset(
                AppLotties.starsAi,
                width: constraints.maxWidth * 0.3,
                height: constraints.maxHeight * 0.3,
              ),
            ),

            const Center(
              child: FloatingText(),
            ),
          ],
        );
      },
    );
  }

  Container _buildOutlineCircle({double size = 20}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary2),
      ),
    );
  }

  Container _buildFilledCircle({double size = 20, Color? color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary2.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}

class PulsingCircle extends StatefulWidget {
  const PulsingCircle({super.key});

  @override
  State<PulsingCircle> createState() => _PulsingCircleState();
}

class _PulsingCircleState extends State<PulsingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _scale =
        Tween<double>(
          begin: .97,
          end: 1.01,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth * .8,
            height: constraints.maxHeight * .8,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary2),
            ),
          );
        },
      ),
    );
  }
}

class FloatingWidget extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  final double? iconSize;
  final Color? iconColor;
  final Widget? widget;

  const FloatingWidget({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    this.iconSize,
    this.iconColor,
    this.widget,
  });

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  static const double _dotSize = 52;
  final _rnd = Random();

  double _x = 0;
  double _y = 0;
  int _duration = 1800;

  @override
  void initState() {
    super.initState();
    _x = _rnd.nextDouble() * (widget.maxWidth - _dotSize);
    _y = _rnd.nextDouble() * (widget.maxHeight - _dotSize);
    _moveRandomly();
  }

  void _moveRandomly() {
    if (!mounted) return;

    final newDuration = 2000 + _rnd.nextInt(1200);

    setState(() {
      _x = _rnd.nextDouble() * (widget.maxWidth - _dotSize);
      _y = _rnd.nextDouble() * (widget.maxHeight - _dotSize);
      _duration = newDuration;
    });

    Future.delayed(Duration(milliseconds: newDuration), _moveRandomly);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: _duration),
            curve: Curves.easeInOut,
            left: _x,
            top: _y,
            child:
                widget.widget ??
                Icon(
                  Icons.star_rate_rounded,
                  color: widget.iconColor ?? AppColors.primary2,
                  size: widget.iconSize ?? 24,
                ),
          ),
        ],
      ),
    );
  }
}

class FloatingText extends StatefulWidget {
  const FloatingText({super.key});

  @override
  State<FloatingText> createState() => _FloatingTextState();
}

class _FloatingTextState extends State<FloatingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation =
        Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: context.screenWidth * 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.primary2),
        ),
        child: TypewriterText(
          text: context.l10n.aiTripLoadingMessage,
          charDuration: const Duration(milliseconds: 100),
          pauseDuration: const Duration(seconds: 3),
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final Duration charDuration;
  final Duration pauseDuration;

  const TypewriterText({
    super.key,
    required this.text,
    this.charDuration = const Duration(milliseconds: 80),
    this.pauseDuration = const Duration(seconds: 2),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayed = '';
  int _index = 0;
  bool _isPausing = false;

  @override
  void initState() {
    super.initState();
    _typeNextChar();
  }

  // لو الـ text اتغير من برا (مثلاً الـ cubit emit step جديد)
  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _index = 0;
      _displayed = '';
      _isPausing = false;
      _typeNextChar();
    }
  }

  void _typeNextChar() {
    if (!mounted || _isPausing) return;

    if (_index >= widget.text.length) {
      // خلص — استنى وابدأ من الأول
      _isPausing = true;
      Future.delayed(widget.pauseDuration, () {
        if (!mounted) return;
        setState(() {
          _index = 0;
          _displayed = '';
          _isPausing = false;
        });
        _typeNextChar();
      });
      return;
    }

    Future.delayed(widget.charDuration, () {
      if (!mounted || _isPausing) return;
      setState(() {
        _index++;
        _displayed = widget.text.substring(0, _index);
      });
      _typeNextChar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayed,
      style: AppTextStyles.interBold22.copyWith(
        color: AppColors.primary2,
      ),
    );
  }
}
