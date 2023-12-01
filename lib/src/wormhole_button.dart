import 'package:flutter/material.dart';
import '../utils/colors.dart';

class WormholeButton extends StatelessWidget {
  final void Function()? onTap;
  final String? icon;
  final String title;
  final bool? isSoft;
  final bool? isBorder;
  final IconData? leadingIcon;
  final double? borderRadius;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isLoading;
  final IconData? buttonIcon;
  final Color? iconsColor;
  final Color? loadingIndicatorColor;

  const WormholeButton({
    super.key,
    this.onTap,
    this.icon,
    required this.title,
    this.isSoft,
    this.isBorder,
    this.leadingIcon,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.isLoading,
    this.buttonIcon,
    this.iconsColor,
    this.loadingIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * .9,
        decoration: BoxDecoration(
          color: isBorder == true
              ? null
              : isSoft == true
                  ? AppColors.primary.withOpacity(.1)
                  : AppColors.primary,
          border: isBorder == true
              ? Border.all(
                  color: borderColor ?? Colors.black,
                  width: 1.5,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
        ),
        child: isLoading == true ? Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: loadingIndicatorColor ?? Colors.white,
                ),
              ),
              const SizedBox(width: 15,),
              Text(
                'Loading...',
                style: TextStyle(
                  color: isBorder == true
                      ? Theme.of(context).colorScheme.outline
                      : isSoft == true
                      ? textColor ?? AppColors.primary
                      : textColor ?? AppColors.white,
                  fontSize: fontSize ?? 17,
                  fontWeight: fontWeight ?? FontWeight.w600,
                ),
              ),

            ],
          ),
        )
            : buttonIcon != null ? Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isBorder == true
                      ? Theme.of(context).colorScheme.outline
                      : isSoft == true
                      ? textColor ?? AppColors.primary
                      : textColor ?? AppColors.white,
                  fontSize: fontSize ?? 17,
                  fontWeight: fontWeight ?? FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                height: 25,
                width: 25,
                child: Icon(buttonIcon, color: iconsColor ?? Colors.white,),
              ),
            ],
          ),
        ) : leadingIcon != null
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Icon(leadingIcon, color: iconsColor ?? Colors.white,),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: isBorder == true
                            ? Theme.of(context).colorScheme.outline
                            : isSoft == true
                                ? textColor ?? AppColors.primary
                                : textColor ?? AppColors.white,
                        fontSize: fontSize ?? 17,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isBorder == true
                          ? Theme.of(context).colorScheme.outline
                          : isSoft == true
                              ? textColor ?? AppColors.primary
                              : textColor ?? AppColors.white,
                      fontSize: fontSize ?? 17,
                      fontWeight: fontWeight ?? FontWeight.w600,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
