import 'package:interact_cli/interact_cli.dart';
import 'package:meta/meta.dart';

@protected
abstract class L {
  // Repo
  static const String repoUrl = 'https://github.com/zoocityboy/mason-brick-generator';
  static const String repoName = 'Bundle Generator';
  // Generic
  static const String generating = 'Generator is processing';
  static const String processing = 'Processing';
  static const String generatingReplaceContent = 'Processing content...';
  static const String generatingReplacePath = 'Processing paths...';
  static const String postprocessing = 'Postprocessing...';
  static const String icon = '🦺 ';
  static const String notFound = 'not found';

  /// TUI settings

  static const String cmd = 'mason_coder';
  static const String cmdDescription =
      '$icon Mason Coder\n\n  Create a Brick Bundle template from your runnable sample code.';
  static final String cmdLink = link(
    uri: Uri.parse('https://github.com/zoocityboy/mason-coder'),
    message: 'Mason Coder',
  );
  static final String cmdFooter = '\nCreated by 🦏 zoocityboy.\n ⌙ GitHub: $cmdLink \n ⌙ Documentation: $cmdLink.';

  /// Options
  static const templateKey = 'template';
  static const templateHelp = 'Selecte available template for processing.';

  /// Commands
  static const initCommandName = 'init';
  static const initCommandDescription = 'Initialize Mason Brick Generator for project.';
  static const initCleanCommandName = 'clean';
  static const initCleanCommandDescription = 'Re-create new workspace.';
  static const initCleanProcessing = 'Cleaning workspace...';
  static const initCleanProcessingSuccess = 'Workspace cleaned.';

  static const initQuestionInstallMason = 'Mason is not instaled in your computer.';
  static const initQuestionInititalizeMason = 'Mason is not initialized in your project.';
  static const initPromptInititalizeMason = 'Do you want to add Mason to your project?';
  static const initProcessingMasonInstallation = 'Mason installation';
  static const initProcessingMasonInitialization = 'Mason initialization';
  static const initProcessingMbg = 'Mason Brick Generator initialization';
  static const initProcessingMbgSuccess = 'Mason Brick Generator initialized';

  static const listCommandName = 'list';
  static const listCommandDescription = 'List all available templates.';
  static const listProcessing = processing;
  static const listResultLabel = 'Available templates';
  static const listPrompGenerte = 'Do you want to generate brick from template?';

  static const validateCommandName = 'validate';
  static const validateCommandDescription = 'Validate template settings.';
  static const validateProcessing = processing;
  static const validateStructureProcessing = 'Validating template structure.';
  static const validatePathProcessing = 'Validating template location.';
  static const validateContentProcessing = 'Validating template variables.';

  static const generateCommandName = 'generate';
  static const generateCommandDescription = 'Generate selected brick template from source code.';
  static const generateProcessing = processing;
  static const generateChoosen = 'Choosen templates:';

  static const discoverCommandName = 'discover';
  static const discoverCommandDescription = 'Discover potential templates in your project.';
  static const disocoverProcessing = 'Discovering';
  static const discoverNotFoundNew = 'New templates not found';

  /// Template header
  static final templateHeader = 'created by [$repoName]($repoUrl) at ${DateTime.now().toIso8601String()}';
}
