import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/app/core/common/constants/app_colors.dart';
import 'package:landing_page/app/core/common/extensions/widget_extension.dart';

class Input extends StatefulWidget {
  final String? label;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool showError;
  final bool transparent;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final double? prefixWidth;
  final Widget? suffixIcon;

  const Input(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.showError = true,
    this.transparent = false,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.onSubmitted,
    this.prefixIcon,
    this.prefixWidth,
    this.suffixIcon,
  });

  const Input.numeric(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.number,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.showError = true,
    this.transparent = false,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.prefixWidth,
    this.onSubmitted,
    this.suffixIcon,
  });
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool visible = false;

  final StreamController<String> streamController = StreamController<String>();

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  Stream<String> get textStream {
    widget.controller.addListener(() {
      // Atualiza a Stream com o novo valor
      streamController.add(widget.controller.text);
    });

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffix = widget.suffixIcon;

    if (widget.keyboard == TextInputType.visiblePassword && suffix == null) {
      suffix = widget.keyboard == TextInputType.visiblePassword
          ? IconButton(
              color: AppColors.grey_600.withOpacity(0.8),
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => visible = !visible),
            )
          : null;
    }
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.transparent ? AppColors.white : AppColors.grey_600,
                ),
              ),
              const Gap(5),
            ],
            TextFormField(
              key: widget.key,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              canRequestFocus: !widget.readOnly,
              onFieldSubmitted: widget.onSubmitted,
              controller: widget.controller,
              autovalidateMode: widget.autovalidateMode,
              validator: widget.validation,
              inputFormatters: widget.formatter,
              keyboardType: widget.keyboard,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines ?? 1,
              readOnly: widget.readOnly,
              obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
              onChanged: widget.onChange,
              onTap: widget.onTap,
              focusNode: widget.focusNode ?? (widget.readOnly ? FocusNode(canRequestFocus: false) : null),
              style: const TextStyle(
                color: AppColors.grey_700,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                isDense: false,
                prefixIconColor: AppColors.grey_600,
                labelStyle: const TextStyle(
                  color: AppColors.grey_600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                hintStyle: const TextStyle(
                  color: AppColors.grey_400,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: AppColors.primary.withOpacity(0.7),
                    width: 2,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
                //DISABLE  ------
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                ),
                //ERROR  ------
                errorStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.error.withOpacity(0.5),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.error,
                  ),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.error,
                  ),
                ),
                // focusedBorder: const OutlineInputBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                //   borderSide: BorderSide(
                //     width: 1,
                //     color: Colors.white,
                //   ),
                // ),
                // hintStyle: TextStyle(
                //   color: widget.transparent ? AppColors.grey_300.withOpacity(0.5) : AppColors.grey_400,
                //   fontSize: 14,
                //   fontWeight: FontWeight.normal,
                // ),
                fillColor: AppColors.grey_100,
                suffixIcon: suffix,
                errorMaxLines: 2,
                // errorStyle: widget.transparent
                //     ? const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: AppColors.error,
                //       )
                //     : null,
                prefixIconConstraints: widget.prefixWidth != null ? BoxConstraints(minWidth: widget.prefixWidth!) : null,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hint,
              ),
            ),
            if (widget.maxLength != null)
              StreamBuilder(
                stream: textStream,
                builder: (_, snapshot) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${snapshot.data?.length ?? 0}/${widget.maxLength}',
                      style: TextStyle(
                        color: widget.transparent ? AppColors.grey_300 : AppColors.grey_600,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ).pTop(4).pRight(8),
              ),
          ],
        ),
      ],
    );
  }
}
