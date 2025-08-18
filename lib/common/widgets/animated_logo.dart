import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSvgLogo extends StatefulWidget {
  final double width;
  final Duration animationDuration;

  const AnimatedSvgLogo({
    Key? key,
    this.width = 300,
    this.animationDuration = const Duration(milliseconds: 2000),
  }) : super(key: key);

  @override
  State<AnimatedSvgLogo> createState() => _AnimatedSvgLogoState();
}

class _AnimatedSvgLogoState extends State<AnimatedSvgLogo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );

    // Fade in animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // Scale animation with bounce
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    // Glow animation that repeats
    _glowAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    // Loop animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _controller.forward();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          width: widget.width,
          height: widget.width * 0.31, // Maintain SVG aspect ratio
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow effect layers
              if (_glowAnimation.value > 0) ...[
                for (int i = 1; i <= 3; i++)
                  Opacity(
                    opacity: (_glowAnimation.value / 0.5).clamp(0.0, 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF43A2D9).withOpacity(0.5),
                            blurRadius: 20.0 * i,
                            spreadRadius: 5.0 * i,
                          ),
                        ],
                      ),
                      child: Transform.scale(
                        scale: _scaleAnimation.value * (1.0 + (0.05 * i)),
                        child: Opacity(
                          opacity: 0, // Invisible container for shadow only
                          child: SvgPicture.asset(
                            'assets/app-logo.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
              // Main logo
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _fadeAnimation.value.clamp(0.0, 1.0),
                  child: SvgPicture.asset(
                    'assets/app-logo.svg',
                    width: widget.width,
                    height: widget.width * 0.31,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(_fadeAnimation.value.clamp(0.0, 1.0)),
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
              // Animated arrow overlay (just the arrow part)
              if (_glowAnimation.value > 0)
                Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _glowAnimation.value.clamp(0.0, 1.0),
                    child: CustomPaint(
                      size: Size(widget.width, widget.width * 0.31),
                      painter: AnimatedArrowPainter(
                        progress: _glowAnimation.value,
                        color: const Color(0xFF43A2D9),
                        logoWidth: widget.width,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class AnimatedArrowPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double logoWidth;

  AnimatedArrowPainter({
    required this.progress,
    required this.color,
    required this.logoWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final glowPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(0.4 * progress)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    // Scale factor from SVG viewBox to our size
    final scale = logoWidth / 388.711;
    
    // Create the arrow path based on SVG coordinates
    final arrowPath = Path();
    
    // Transform SVG coordinates to our coordinate system
    final startX = (194.493 - 74.714) * scale;
    final startY = (179.587 - 77.687) * scale;
    
    arrowPath.moveTo(startX, startY);
    
    // Animate the arrow drawing
    if (progress > 0.2) {
      final segment1Progress = ((progress - 0.2) / 0.2).clamp(0.0, 1.0);
      arrowPath.lineTo(
        startX - (119.579 * scale * segment1Progress),
        startY - (16 * scale * segment1Progress),
      );
      
      if (progress > 0.4) {
        arrowPath.relativeLineTo(0, 7.2 * scale * ((progress - 0.4) / 0.1).clamp(0.0, 1.0));
        
        if (progress > 0.5) {
          final segment3Progress = ((progress - 0.5) / 0.2).clamp(0.0, 1.0);
          arrowPath.relativeLineTo(
            119.579 * scale * segment3Progress,
            27.5 * scale * segment3Progress,
          );
          
          if (progress > 0.7) {
            final segment4Progress = ((progress - 0.7) / 0.2).clamp(0.0, 1.0);
            arrowPath.relativeLineTo(
              271.932 * scale * segment4Progress,
              -27.5 * scale * segment4Progress,
            );
            
            if (progress > 0.9) {
              arrowPath.relativeLineTo(0, -7.2 * scale * ((progress - 0.9) / 0.1).clamp(0.0, 1.0));
              if (progress >= 1.0) {
                arrowPath.close();
              }
            }
          }
        }
      }
    }

    // Draw glow first
    canvas.drawPath(arrowPath, glowPaint);
    // Draw main arrow
    canvas.drawPath(arrowPath, paint);

    // Add pulsing effect
    if (progress > 0.8) {
      final pulseIntensity = (progress - 0.8) / 0.2;
      final pulsePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color.withOpacity(pulseIntensity * 0.8)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
      canvas.drawPath(arrowPath, pulsePaint);
    }
  }

  @override
  bool shouldRepaint(AnimatedArrowPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}