import 'package:emir_s_spell_checker_app/provider/correction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CorrectionProvider provider =
        Provider.of<CorrectionProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Emir's Spell Checker"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Your Text',
                  hintText: 'Your Text',
                  labelStyle: const TextStyle(fontSize: 20),
                  hintStyle: const TextStyle(fontSize: 16),
                  suffix: IconButton(
                    icon: const Icon(
                      Icons.clear_rounded,
                      size: 32,
                    ),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                controller: _controller,
                maxLines: 7,
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  provider.getResponse(_controller.text);
                },
                child: const Text(
                  "Check",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                  child: provider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: Text(
                            provider.response.correction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
