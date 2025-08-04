import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_scaffold.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_text_field.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/services/haptic_service.dart';
import 'package:shartflix/features/authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:shartflix/features/authentication/presentation/blocs/login_bloc/login_event.dart';
import 'package:shartflix/features/authentication/presentation/blocs/login_bloc/login_state.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';
import 'package:shartflix/features/authentication/presentation/pages/register_page.dart';
import 'package:shartflix/features/home/presentation/pages/home_page.dart';

import '../../../../core/design_system/custom_widgets/shartflix_button.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';
import '../../../../generated/assets.gen.dart';
import '../widgets/social_media_login_buttons.dart';

class LoginPage extends StatefulWidget {
  static const String name = '/LoginPage';
  static const String path = '/LoginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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

  void _handleLogin(BuildContext context) {
    HapticService.lightImpact();

    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final loginRequest = LoginRequest(email: email, password: password);

      context.read<LoginBloc>().add(LoginRequested(loginRequest: loginRequest));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: ShartflixScaffold(
        resizeToAvoidBottomInset: true,
        canPop: false,
        extendBodyBehindAppBar: true,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoginSuccess():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.tr('login.loginSuccess'))),
                );
                context.go(HomePage.path);
                break;
              case LoginFailure():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      context.tr(
                        'login.loginError',
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
            final isLoading = state is LoginLoading;

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
                          context.tr('login.title'),
                          style: ShartflixTextStyles.movieTitle,
                        ),
                        8.verticalSpace,
                        Text(
                          context.tr('login.subtitle'),
                          textAlign: TextAlign.center,
                          style: ShartflixTextStyles.movieDescription.copyWith(
                            color: ShartflixColors.white,
                          ),
                        ),
                        40.verticalSpace,
                        ShartflixTextField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          hintText: context.tr('login.emailHint'),
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
                          hintText: context.tr('login.passwordHint'),
                          obscureText: true,
                          showObscureTextIcon: true,
                          textInputAction: TextInputAction.done,
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
                            _passwordFocusNode.unfocus();
                            if (!isLoading) _handleLogin(context);
                          },
                        ),
                        29.63.verticalSpace,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: isLoading ? null : () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              context.tr('login.forgotPassword'),
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
                          ),
                        ),
                        24.verticalSpace,
                        ShartflixButton(
                          title: isLoading
                              ? context.tr('login.loggingIn')
                              : context.tr('login.loginButton'),
                          textStyle: ShartflixTextStyles.labelMedium.copyWith(
                            fontSize: 15.sp,
                          ),
                          onPressed: isLoading
                              ? null
                              : () => _handleLogin(context),
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
                              'Bir hesabın yok mu?',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: ShartflixColors.white50),
                            ),
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      HapticService.lightImpact();
                                      context.pushNamed(RegisterPage.name);
                                    },
                              child: Text(
                                '  Kayıt Ol!',
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
