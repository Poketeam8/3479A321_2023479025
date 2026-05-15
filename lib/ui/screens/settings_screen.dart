import 'package:flutter/material.dart';
import '../../core/services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late TextEditingController _nameController;

  String _selectedDifficulty = 'Fácil';

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: StorageService.getUsername(),
    );

    _selectedDifficulty =
        StorageService.getDifficulty();
  }

  void _saveSettings() async {

    await StorageService.saveUsername(
      _nameController.text,
    );

    await StorageService.saveDifficulty(
      _selectedDifficulty,
    );

    if (mounted) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Guardado correctamente'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Ajustes'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: _nameController,

              decoration: const InputDecoration(
                labelText: 'Jugador',
              ),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: _selectedDifficulty,

              items: ['Fácil', 'Medio', 'Difícil']
                  .map(
                    (v) => DropdownMenuItem(
                      value: v,
                      child: Text(v),
                    ),
                  )
                  .toList(),

              onChanged: (v) {

                setState(() {
                  _selectedDifficulty = v!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}