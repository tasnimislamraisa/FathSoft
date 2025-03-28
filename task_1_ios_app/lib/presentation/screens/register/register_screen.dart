import 'package:http/http.dart' as http;
import 'package:task_1_ios_app/my-imports.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fnTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120),
              Text(
                'Join With Us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter Your Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _fnTEController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: _showPassword == false,
                controller: _passwordTEController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showPassword = !_showPassword;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    icon: _showPassword
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                  ),
                ),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter Password Correctly';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: _registerUser,
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Have account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w400,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),
                                (route) => false,
                              );
                            },
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _registerUser() async {
    final name = _fnTEController.text.trim();
    final email = _emailTEController.text.trim();
    final password = _passwordTEController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(Urls.registerUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": name,
          "email": email,
          "password": password,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = responseData["token"];
        if (token != null) {
          await AuthController().saveAccessToken(token);
          _clearText();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration successful")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LogInScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Token not found in response")),
          );
        }
      } else {
        final error = responseData["error"] ?? "Registration failed";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

/*  void _registerUser() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }*/

  void _clearText() {
    _emailTEController.clear();
    _passwordTEController.clear();
    _fnTEController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _fnTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
