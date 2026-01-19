import 'dart:io';

Future<void> run(String cmd, List<String> args) async {
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

Future<void> main() async {
  print('==> Installing dependencies...');

  await run('flutter', ['pub', 'add', 'flutter_bloc']);
  await run('flutter', ['pub', 'add', 'equatable']);
  await run('flutter', ['pub', 'add', 'dio']);
  await run('flutter', ['pub', 'add', 'connectivity_plus']);
  await run('flutter', ['pub', 'add', 'flutter_modular']);

  print('==> Installing dev dependencies...');
  await run('flutter', ['pub', 'add', '--dev', 'flutter_lints']);

  print('==> Done.');
}
