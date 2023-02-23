import 'package:arosaje/screens/home_screen.dart';
import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:arosaje/viewmodels/signin_viewmodel.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final SignInViewModel _viewModel;

  const SignInPage(this._viewModel, {super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: AnimatedBuilder(
              animation: widget._viewModel,
              builder: (context, child) {
                final errorMessage = widget._viewModel.errorMessage;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: widget._viewModel.getEmailErrorMessage),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      onSaved: widget._viewModel.emailSaved,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: widget._viewModel.getPasswordErrorMessage),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: widget._viewModel.passwordSaved,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (!widget._viewModel.isLoading)
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width, 40)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                widget._viewModel.signIn();
                              }
                            },
                            child: const Text('Sign In',
                                style: TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width, 40)),
                            onPressed: () {
                              widget._viewModel.onSignUpClicked();
                            },
                            child: const Text('Sign up',
                                style: TextStyle(fontSize: 18)),
                          )
                        ],
                      )
                    else
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (errorMessage != null) Text(errorMessage),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
