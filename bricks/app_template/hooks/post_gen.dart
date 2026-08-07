import 'dart:io';
import 'package:mason/mason.dart';

Future<void> exec(String cmd, List<String> args) async {
  final result = await Process.run(
    cmd,
    args,
    runInShell: true,
  );

  stdout.write(result.stdout);
  stderr.write(result.stderr);

  if (result.exitCode != 0) {
    exit(result.exitCode);
  }
}

Future<void> run(HookContext context) async {
  print('==> Installing dependencies...');

  await exec('flutter', ['pub', 'add', 'flutter_bloc']);
  await exec('flutter', ['pub', 'add', 'equatable']);
  await exec('flutter', ['pub', 'add', 'dio']);
  await exec('flutter', ['pub', 'add', 'connectivity_plus']);
  await exec('flutter', ['pub', 'add', 'flutter_modular']);

  print('==> Installing dev dependencies...');
  await exec('flutter', ['pub', 'add', '--dev', 'flutter_lints']);

  print('==> Done.');
}