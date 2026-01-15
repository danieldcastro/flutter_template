import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  Future<void> exec(
    String command,
    List<String> args, {
    String? workingDirectory,
  }) async {
    context.logger.info('> $command ${args.join(" ")}');

    final result = await Process.run(
      command,
      args,
      workingDirectory: workingDirectory,
      runInShell: true,
    );

    final stdoutStr = result.stdout.toString().trim();
    final stderrStr = result.stderr.toString().trim();

    if (stdoutStr.isNotEmpty) context.logger.info(stdoutStr);
    if (stderrStr.isNotEmpty) context.logger.warn(stderrStr);

    if (result.exitCode != 0) {
      throw Exception('Falhou: $command ${args.join(" ")}');
    }
  }

  // 1) Garantir flutter da versão do projeto (FVM)
  await exec('fvm', ['install']);
  await exec('fvm', ['use']);

  // 2) Instalar dependências
  await exec('fvm', ['flutter', 'pub', 'get']);

  // 3) iOS pods (opcional - só roda se existir pasta ios)
  final iosDir = Directory('ios');
  if (iosDir.existsSync()) {
    await exec('pod', ['install'], workingDirectory: 'ios');
  }

  context.logger.success('✅ Projeto pronto!');
}
