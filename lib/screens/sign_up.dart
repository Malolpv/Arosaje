import 'package:arosaje/viewmodels/signup_view_model.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final SignUpViewModel _viewModel;

  const SignUpPage(this._viewModel, {super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: AnimatedBuilder(
              animation: widget._viewModel,
              builder: (context, child) {
                final errorMessage = widget._viewModel.getErrorMessage;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: widget._viewModel.nameChanged,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      onSaved: widget._viewModel.emailChanged,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: widget._viewModel.passwordChanged,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (!widget._viewModel.getIsLoading)
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width, 40)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                widget._viewModel.submit();
                              }
                            },
                            child: const Text('Sign Up',
                                style: TextStyle(fontSize: 18)),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width, 40)),
                            onPressed: () {
                              widget._viewModel.displaySignIn();
                            },
                            child: const Text('Sign In',
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
