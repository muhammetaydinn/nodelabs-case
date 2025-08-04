// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_scaffold.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_text_field.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/features/authentication/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:shartflix/features/authentication/presentation/blocs/register_bloc/register_event.dart';
import 'package:shartflix/features/authentication/presentation/blocs/register_bloc/register_state.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';
import 'package:shartflix/features/profile/presentation/pages/update_profile_image_page.dart';

import '../../../../core/design_system/custom_widgets/shartflix_button.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';
import '../../../../generated/assets.gen.dart';
import '../widgets/social_media_login_buttons.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static const String name = '/RegisterPage';
  static const String path = '/RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  late final FocusNode _nameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ad soyad alanı boş bırakılamaz';
    }
    if (value.length < 2) {
      return 'Ad soyad en az 2 karakter olmalıdır';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-posta alanı boş bırakılamaz';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Geçerli bir e-posta adresi girin';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre alanı boş bırakılamaz';
    }
    if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalıdır';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre tekrar alanı boş bırakılamaz';
    }
    if (value != _passwordController.text) {
      return 'Şifreler eşleşmiyor';
    }
    return null;
  }

  void _handleRegister(BuildContext context) {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (_formKey.currentState?.validate() ?? false) {
      final registerRequest = RegisterRequest(
        email: email,
        name: name,
        password: password,
      );

      context.read<RegisterBloc>().add(
        RegisterRequested(registerRequest: registerRequest),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: ShartflixScaffold(
        resizeToAvoidBottomInset: true,
        canPop: true,
        extendBodyBehindAppBar: true,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            switch (state) {
              case RegisterSuccess():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(context.tr('register.registerSuccess')),
                  ),
                );
                context.pushReplacement(
                  UpdateProfileImagePage.pathFromRegister,
                );
                break;
              case RegisterFailure():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.tr(
                        'register.registerError',
                        args: [state.errorMessage],
                      ),
                    ),
                  ),
                );
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            final isLoading = state is RegisterLoading;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Text(
                          context.tr('register.title'),
                          style: ShartflixTextStyles.movieTitle,
                        ),
                        8.verticalSpace,
                        Text(
                          context.tr('register.subtitle'),
                          textAlign: TextAlign.center,
                          style: ShartflixTextStyles.movieDescription.copyWith(
                            color: ShartflixColors.white,
                          ),
                        ),
                        40.verticalSpace,
                        ShartflixTextField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          hintText: context.tr('register.nameHint'),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          enabled: !isLoading,
                          validator: _validateName,
                          autovalidateMode: AutovalidateMode.disabled,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 9.w,
                              top: 19.h,
                              bottom: 19.h,
                            ),
                            child: ShartflixSvgImage(
                              assetPath: Assets.icons.svgIcons.addUser,
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(
                              context,
                            ).requestFocus(_emailFocusNode);
                          },
                        ),
                        13.63.verticalSpace,
                        ShartflixTextField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          hintText: context.tr('register.emailHint'),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          enabled: !isLoading,
                          validator: _validateEmail,
                          autovalidateMode: AutovalidateMode.disabled,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 9.w,
                              top: 19.h,
                              bottom: 19.h,
                            ),
                            child: ShartflixSvgImage(
                              assetPath: Assets.icons.svgIcons.message,
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(
                              context,
                            ).requestFocus(_passwordFocusNode);
                          },
                        ),
                        13.63.verticalSpace,
                        ShartflixTextField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          hintText: context.tr('register.passwordHint'),
                          obscureText: true,
                          showObscureTextIcon: true,
                          textInputAction: TextInputAction.next,
                          enabled: !isLoading,
                          validator: _validatePassword,
                          autovalidateMode: AutovalidateMode.disabled,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 9.w,
                              top: 19.h,
                              bottom: 19.h,
                            ),
                            child: ShartflixSvgImage(
                              assetPath: Assets.icons.svgIcons.unlock,
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(
                              context,
                            ).requestFocus(_confirmPasswordFocusNode);
                          },
                        ),
                        13.63.verticalSpace,
                        ShartflixTextField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          hintText: context.tr('register.confirmPasswordHint'),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          enabled: !isLoading,
                          validator: _validateConfirmPassword,
                          autovalidateMode: AutovalidateMode.disabled,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 9.w,
                              top: 19.h,
                              bottom: 19.h,
                            ),
                            child: ShartflixSvgImage(
                              assetPath: Assets.icons.svgIcons.unlock,
                            ),
                          ),
                          onFieldSubmitted: (_) {
                            _confirmPasswordFocusNode.unfocus();
                            if (!isLoading) _handleRegister(context);
                          },
                        ),
                        29.63.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: '${context.tr('register.termsAgreement')} ',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: isLoading
                                        ? ShartflixColors.white50.withOpacity(
                                            0.5,
                                          )
                                        : ShartflixColors.white50,
                                  ),
                              children: [
                                TextSpan(
                                  text: context.tr('register.readAndAccept'),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: isLoading
                                            ? ShartflixColors.white50
                                            : ShartflixColors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: isLoading
                                            ? ShartflixColors.white50
                                            : ShartflixColors.white,
                                      ),
                                ),
                                TextSpan(
                                  text:
                                      '. ${context.tr('register.termsContinue')}',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: isLoading
                                            ? ShartflixColors.white50
                                                  .withOpacity(0.5)
                                            : ShartflixColors.white50,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        24.verticalSpace,
                        ShartflixButton(
                          title: isLoading
                              ? context.tr('register.registering')
                              : context.tr('register.registerButton'),
                          textStyle: ShartflixTextStyles.labelMedium.copyWith(
                            fontSize: 15.sp,
                          ),
                          onPressed: isLoading
                              ? null
                              : () => _handleRegister(context),
                          height: 53.31.h,
                          borderRadius: 18.r,
                        ),
                        36.92.verticalSpace,
                        const SocialMediaLoginButtons(),
                        32.27.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.tr('register.alreadyHaveAccount'),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: ShartflixColors.white50),
                            ),
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      context.pushNamed(LoginPage.name);
                                    },
                              child: Text(
                                '  ${context.tr('register.loginHere')}',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: isLoading
                                          ? ShartflixColors.white50
                                          : ShartflixColors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        40.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
