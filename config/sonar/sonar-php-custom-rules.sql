# Add custom PHP CodeSniffer rules for Drupal into SonarQube.
#
# This must be run AFTER SonarQube has been installed and started, so the MySQL
# database schema exists.
#
# Command: mysql -u root -ppass sonar < sonar-php-custom-rules.sql
#
# See: https://drupal.org/node/2082563

# Insert custom rules for PHP Codesniffer into the properties table.
INSERT INTO properties VALUES (NULL, 'sonar.phpCodesniffer.customRules.definition', NULL, '<?xml version="1.0" encoding="UTF-8"?>
<rules>
  <rule key="Drupal.Commenting.InlineComment.SpacingBefore" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.SpacingBefore</name>
    <configKey>SPACINGBEFORE</configKey>
    <description>Drupal.Commenting.InlineComment.SpacingBefore</description>
  </rule>
  <rule key="Drupal.Commenting.FileComment" priority="MAJOR">
    <name>Drupal.Commenting.FileComment</name>
    <configKey>FILECOMMENT</configKey>
    <description>Drupal.Commenting.FileComment</description>
  </rule>
  <rule key="Drupal.ControlStructures.InlineControlStructure.NotAllowed" priority="MAJOR">
    <name>Drupal.ControlStructures.InlineControlStructure.NotAllowed</name>
    <configKey>NOTALLOWED</configKey>
    <description>Drupal.ControlStructures.InlineControlStructure.NotAllowed</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment</name>
    <configKey>FUNCTIONCOMMENT</configKey>
    <description>Drupal.Commenting.FunctionComment</description>
  </rule>
  <rule key="Drupal.Files.LineLength.TooLong" priority="MAJOR">
    <name>Drupal.Files.LineLength.TooLong</name>
    <configKey>TOOLONG</configKey>
    <description>Drupal.Files.LineLength.TooLong</description>
  </rule>
  <rule key="Drupal.Semantics.FunctionCall.LArg" priority="MAJOR">
    <name>Drupal.Semantics.FunctionCall.LArg</name>
    <configKey>LARG</configKey>
    <description>Drupal.Semantics.FunctionCall.LArg</description>
  </rule>
  <rule key="Drupal.WhiteSpace.OperatorSpacing.SpacingAfter" priority="MAJOR">
    <name>Drupal.WhiteSpace.OperatorSpacing.SpacingAfter</name>
    <configKey>SPACINGAFTER</configKey>
    <description>Drupal.WhiteSpace.OperatorSpacing.SpacingAfter</description>
  </rule>
  <rule key="Drupal.Formatting.DisallowCloseTag.FinalClose" priority="MAJOR">
    <name>Drupal.Formatting.DisallowCloseTag.FinalClose</name>
    <configKey>FINALCLOSE</configKey>
    <description>Drupal.Formatting.DisallowCloseTag.FinalClose</description>
  </rule>
  <rule key="Drupal.WhiteSpace.OpenBracketSpacing.OpeningWhitespace" priority="MAJOR">
    <name>Drupal.WhiteSpace.OpenBracketSpacing.OpeningWhitespace</name>
    <configKey>OPENINGWHITESPACE</configKey>
    <description>Drupal.WhiteSpace.OpenBracketSpacing.OpeningWhitespace</description>
  </rule>
  <rule key="Drupal.Commenting.FileComment.DescriptionMissing" priority="MAJOR">
    <name>Drupal.Commenting.FileComment.DescriptionMissing</name>
    <configKey>DESCRIPTIONMISSING</configKey>
    <description>Drupal.Commenting.FileComment.DescriptionMissing</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.NoSpaceBefore" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.NoSpaceBefore</name>
    <configKey>NOSPACEBEFORE</configKey>
    <description>Drupal.Commenting.InlineComment.NoSpaceBefore</description>
  </rule>
  <rule key="Drupal.Strings.ConcatenationSpacing.Missing" priority="MAJOR">
    <name>Drupal.Strings.ConcatenationSpacing.Missing</name>
    <configKey>MISSING</configKey>
    <description>Drupal.Strings.ConcatenationSpacing.Missing</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.WrongStyle" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.WrongStyle</name>
    <configKey>WRONGSTYLE</configKey>
    <description>Drupal.Commenting.InlineComment.WrongStyle</description>
  </rule>
  <rule key="Drupal.Semantics.Br.XHTMLBr" priority="MAJOR">
    <name>Drupal.Semantics.Br.XHTMLBr</name>
    <configKey>XHTMLBR</configKey>
    <description>Drupal.Semantics.Br.XHTMLBr</description>
  </rule>
  <rule key="Drupal.Strings.UnnecessaryStringConcat.Found" priority="MAJOR">
    <name>Drupal.Strings.UnnecessaryStringConcat.Found</name>
    <configKey>FOUND</configKey>
    <description>Drupal.Strings.UnnecessaryStringConcat.Found</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.Empty" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.Empty</name>
    <configKey>EMPTY</configKey>
    <description>Drupal.Commenting.FunctionComment.Empty</description>
  </rule>
  <rule key="Drupal.NamingConventions.ValidClassName.NoUnderscores" priority="MAJOR">
    <name>Drupal.NamingConventions.ValidClassName.NoUnderscores</name>
    <configKey>NOUNDERSCORES</configKey>
    <description>Drupal.NamingConventions.ValidClassName.NoUnderscores</description>
  </rule>
  <rule key="Drupal.Commenting.FileComment.SpacingAfter" priority="MAJOR">
    <name>Drupal.Commenting.FileComment.SpacingAfter</name>
    <configKey>SPACINGAFTER</configKey>
    <description>Drupal.Commenting.FileComment.SpacingAfter</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.$InReturnType" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.$InReturnType</name>
    <configKey>$INRETURNTYPE</configKey>
    <description>Drupal.Commenting.FunctionComment.$InReturnType</description>
  </rule>
  <rule key="Drupal.Array.Array.LongLineDeclaration" priority="MAJOR">
    <name>Drupal.Array.Array.LongLineDeclaration</name>
    <configKey>LONGLINEDECLARATION</configKey>
    <description>Drupal.Array.Array.LongLineDeclaration</description>
  </rule>
  <rule key="Drupal.Commenting.DocCommentAlignment.SpaceBeforeAsterisk" priority="MAJOR">
    <name>Drupal.Commenting.DocCommentAlignment.SpaceBeforeAsterisk</name>
    <configKey>SPACEBEFOREASTERISK</configKey>
    <description>Drupal.Commenting.DocCommentAlignment.SpaceBeforeAsterisk</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.ShortSingleLine" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.ShortSingleLine</name>
    <configKey>SHORTSINGLELINE</configKey>
    <description>Drupal.Commenting.FunctionComment.ShortSingleLine</description>
  </rule>
  <rule key="Drupal.Semantics.FunctionCall.NotLiteralString" priority="MAJOR">
    <name>Drupal.Semantics.FunctionCall.NotLiteralString</name>
    <configKey>NOTLITERALSTRING</configKey>
    <description>Drupal.Semantics.FunctionCall.NotLiteralString</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.ShortFullStop" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.ShortFullStop</name>
    <configKey>SHORTFULLSTOP</configKey>
    <description>Drupal.Commenting.FunctionComment.ShortFullStop</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.NotCapital" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.NotCapital</name>
    <configKey>NOTCAPITAL</configKey>
    <description>Drupal.Commenting.InlineComment.NotCapital</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.SpacingAfter" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.SpacingAfter</name>
    <configKey>SPACINGAFTER</configKey>
    <description>Drupal.Commenting.InlineComment.SpacingAfter</description>
  </rule>
  <rule key="Drupal.Commenting.FileComment.WrongStyle" priority="MAJOR">
    <name>Drupal.Commenting.FileComment.WrongStyle</name>
    <configKey>WRONGSTYLE</configKey>
    <description>Drupal.Commenting.FileComment.WrongStyle</description>
  </rule>
  <rule key="Drupal.Formatting.SpaceInlineIf.NoSpaceAfter" priority="MAJOR">
    <name>Drupal.Formatting.SpaceInlineIf.NoSpaceAfter</name>
    <configKey>NOSPACEAFTER</configKey>
    <description>Drupal.Formatting.SpaceInlineIf.NoSpaceAfter</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.ShortNotCapital" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.ShortNotCapital</name>
    <configKey>SHORTNOTCAPITAL</configKey>
    <description>Drupal.Commenting.FunctionComment.ShortNotCapital</description>
  </rule>
  <rule key="Drupal.Array.Array.ArrayIndentation" priority="MAJOR">
    <name>Drupal.Array.Array.ArrayIndentation</name>
    <configKey>ARRAYINDENTATION</configKey>
    <description>Drupal.Array.Array.ArrayIndentation</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.MissingParamType" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.MissingParamType</name>
    <configKey>MISSINGPARAMTYPE</configKey>
    <description>Drupal.Commenting.FunctionComment.MissingParamType</description>
  </rule>
  <rule key="Drupal.ControlStructures.ElseIf" priority="MAJOR">
    <name>Drupal.ControlStructures.ElseIf</name>
    <configKey>ELSEIF</configKey>
    <description>Drupal.ControlStructures.ElseIf</description>
  </rule>
  <rule key="Drupal.Array.Array" priority="MAJOR">
    <name>Drupal.Array.Array</name>
    <configKey>ARRAY</configKey>
    <description>Drupal.Array.Array</description>
  </rule>
  <rule key="Drupal.ControlStructures.TemplateControlStructure.CurlyBracket" priority="MAJOR">
    <name>Drupal.ControlStructures.TemplateControlStructure.CurlyBracket</name>
    <configKey>CURLYBRACKET</configKey>
    <description>Drupal.ControlStructures.TemplateControlStructure.CurlyBracket</description>
  </rule>
  <rule key="Drupal.Array.Array.ArrayClosingIndentation" priority="MAJOR">
    <name>Drupal.Array.Array.ArrayClosingIndentation</name>
    <configKey>ARRAYCLOSINGINDENTATION</configKey>
    <description>Drupal.Array.Array.ArrayClosingIndentation</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ScopeIndent.IncorrectExact" priority="MAJOR">
    <name>Drupal.WhiteSpace.ScopeIndent.IncorrectExact</name>
    <configKey>INCORRECTEXACT</configKey>
    <description>Drupal.WhiteSpace.ScopeIndent.IncorrectExact</description>
  </rule>
  <rule key="Drupal.ControlStructures.ControlSignature" priority="MAJOR">
    <name>Drupal.ControlStructures.ControlSignature</name>
    <configKey>CONTROLSIGNATURE</configKey>
    <description>Drupal.ControlStructures.ControlSignature</description>
  </rule>
  <rule key="Drupal.Formatting.SpaceInlineIf.NoSpaceBefore" priority="MAJOR">
    <name>Drupal.Formatting.SpaceInlineIf.NoSpaceBefore</name>
    <configKey>NOSPACEBEFORE</configKey>
    <description>Drupal.Formatting.SpaceInlineIf.NoSpaceBefore</description>
  </rule>
  <rule key="Drupal.Semantics.EmptyInstall.EmptyInstall" priority="MAJOR">
    <name>Drupal.Semantics.EmptyInstall.EmptyInstall</name>
    <configKey>EMPTYINSTALL</configKey>
    <description>Drupal.Semantics.EmptyInstall.EmptyInstall</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.ShortStartSpace" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.ShortStartSpace</name>
    <configKey>SHORTSTARTSPACE</configKey>
    <description>Drupal.Commenting.FunctionComment.ShortStartSpace</description>
  </rule>
  <rule key="Drupal.WhiteSpace.OperatorSpacing.NoSpaceAfter" priority="MAJOR">
    <name>Drupal.WhiteSpace.OperatorSpacing.NoSpaceAfter</name>
    <configKey>NOSPACEAFTER</configKey>
    <description>Drupal.WhiteSpace.OperatorSpacing.NoSpaceAfter</description>
  </rule>
  <rule key="Drupal.ControlStructures.ElseCatchNewline.ElseNewline" priority="MAJOR">
    <name>Drupal.ControlStructures.ElseCatchNewline.ElseNewline</name>
    <configKey>ELSENEWLINE</configKey>
    <description>Drupal.ControlStructures.ElseCatchNewline.ElseNewline</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.InvalidEndChar" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.InvalidEndChar</name>
    <configKey>INVALIDENDCHAR</configKey>
    <description>Drupal.Commenting.InlineComment.InvalidEndChar</description>
  </rule>
  <rule key="Drupal.WhiteSpace.CloseBracketSpacing.ClosingWhitespace" priority="MAJOR">
    <name>Drupal.WhiteSpace.CloseBracketSpacing.ClosingWhitespace</name>
    <configKey>CLOSINGWHITESPACE</configKey>
    <description>Drupal.WhiteSpace.CloseBracketSpacing.ClosingWhitespace</description>
  </rule>
  <rule key="Drupal.Semantics.TInHookMenu.TFound" priority="MAJOR">
    <name>Drupal.Semantics.TInHookMenu.TFound</name>
    <configKey>TFOUND</configKey>
    <description>Drupal.Semantics.TInHookMenu.TFound</description>
  </rule>
  <rule key="Drupal.Commenting.FunctionComment.Missing" priority="MAJOR">
    <name>Drupal.Commenting.FunctionComment.Missing</name>
    <configKey>MISSING</configKey>
    <description>Drupal.Commenting.FunctionComment.Missing</description>
  </rule>
  <rule key="Drupal.Semantics.FunctionCall.ConstantStart" priority="MAJOR">
    <name>Drupal.Semantics.FunctionCall.ConstantStart</name>
    <configKey>CONSTANTSTART</configKey>
    <description>Drupal.Semantics.FunctionCall.ConstantStart</description>
  </rule>
  <rule key="Drupal.Formatting.MultiLineAssignment" priority="MAJOR">
    <name>Drupal.Formatting.MultiLineAssignment</name>
    <configKey>MULTILINEASSIGNMENT</configKey>
    <description>Drupal.Formatting.MultiLineAssignment</description>
  </rule>
  <rule key="Drupal.Commenting.InlineComment.Empty" priority="MAJOR">
    <name>Drupal.Commenting.InlineComment.Empty</name>
    <configKey>EMPTY</configKey>
    <description>Drupal.Commenting.InlineComment.Empty</description>
  </rule>
  <rule key="Drupal.NamingConventions.ValidVariableName" priority="MAJOR">
    <name>Drupal.NamingConventions.ValidVariableName</name>
    <configKey>VALIDVARIABLENAME</configKey>
    <description>Drupal.NamingConventions.ValidVariableName</description>
  </rule>
  <rule key="Drupal.Commenting.DocCommentAlignment.BlankLine" priority="MAJOR">
    <name>Drupal.Commenting.DocCommentAlignment.BlankLine</name>
    <configKey>BLANKLINE</configKey>
    <description>Drupal.Commenting.DocCommentAlignment.BlankLine</description>
  </rule>
  <rule key="Drupal.WhiteSpace.OperatorSpacing.NoSpaceBefore" priority="MAJOR">
    <name>Drupal.WhiteSpace.OperatorSpacing.NoSpaceBefore</name>
    <configKey>NOSPACEBEFORE</configKey>
    <description>Drupal.WhiteSpace.OperatorSpacing.NoSpaceBefore</description>
  </rule>
  <rule key="Drupal.WhiteSpace.EmptyLines.EmptyLines" priority="MAJOR">
    <name>Drupal.WhiteSpace.EmptyLines.EmptyLines</name>
    <configKey>EMPTYLINES</configKey>
    <description>Drupal.WhiteSpace.EmptyLines.EmptyLines</description>
  </rule>
  <rule key="Drupal.WhiteSpace.FileEnd.FileEnd" priority="MAJOR">
    <name>Drupal.WhiteSpace.FileEnd.FileEnd</name>
    <configKey>FILEEND</configKey>
    <description>Drupal.WhiteSpace.FileEnd.FileEnd</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ScopeIndent.Incorrect" priority="MAJOR">
    <name>Drupal.WhiteSpace.ScopeIndent.Incorrect</name>
    <configKey>INCORRECT</configKey>
    <description>Drupal.WhiteSpace.ScopeIndent.Incorrect</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ScopeClosingBrace.BreakIdent" priority="MAJOR">
    <name>Drupal.WhiteSpace.ScopeClosingBrace.BreakIdent</name>
    <configKey>BREAKIDENT</configKey>
    <description>Drupal.WhiteSpace.ScopeClosingBrace.BreakIdent</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ObjectOperatorSpacing.After" priority="MAJOR">
    <name>Drupal.WhiteSpace.ObjectOperatorSpacing.After</name>
    <configKey>AFTER</configKey>
    <description>Drupal.WhiteSpace.ObjectOperatorSpacing.After</description>
  </rule>
  <rule key="Drupal.NamingConventions.ValidClassName.StartWithCaptial" priority="MAJOR">
    <name>Drupal.NamingConventions.ValidClassName.StartWithCaptial</name>
    <configKey>STARTWITHCAPTIAL</configKey>
    <description>Drupal.NamingConventions.ValidClassName.StartWithCaptial</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ScopeClosingBrace.Indent" priority="MAJOR">
    <name>Drupal.WhiteSpace.ScopeClosingBrace.Indent</name>
    <configKey>INDENT</configKey>
    <description>Drupal.WhiteSpace.ScopeClosingBrace.Indent</description>
  </rule>
  <rule key="Squiz.WhiteSpace.SuperfluousWhitespace.EndLine" priority="MAJOR">
    <name>Squiz.WhiteSpace.SuperfluousWhitespace.EndLine</name>
    <configKey>ENDLINE</configKey>
    <description>Squiz.WhiteSpace.SuperfluousWhitespace.EndLine</description>
  </rule>
  <rule key="Drupal.Commenting.FileComment.Missing" priority="MAJOR">
    <name>Drupal.Commenting.FileComment.Missing</name>
    <configKey>MISSING</configKey>
    <description>Drupal.Commenting.FileComment.Missing</description>
  </rule>
  <rule key="Squiz.WhiteSpace.SuperfluousWhitespace.StartFile" priority="MAJOR">
    <name>Squiz.WhiteSpace.SuperfluousWhitespace.StartFile</name>
    <configKey>STARTFILE</configKey>
    <description>Squiz.WhiteSpace.SuperfluousWhitespace.StartFile</description>
  </rule>
  <rule key="Drupal.WhiteSpace.ObjectOperatorSpacing.Before" priority="MAJOR">
    <name>Drupal.WhiteSpace.ObjectOperatorSpacing.Before</name>
    <configKey>BEFORE</configKey>
    <description>Drupal.WhiteSpace.ObjectOperatorSpacing.Before</description>
  </rule>
    <rule key="Generic.Functions.OpeningFunctionBraceKernighanRitchie.SpaceAfterBracket" priority="MAJOR">
    <name>Generic.Functions.OpeningFunctionBraceKernighanRitchie.SpaceAfterBracket</name>
    <configKey>SPACEAFTERBRACKET</configKey>
    <description>Generic.Functions.OpeningFunctionBraceKernighanRitchie.SpaceAfterBracket</description>
  </rule>
    <rule key="Drupal.Semantics.FunctionCall.EmptyString" priority="MAJOR">
    <name>Drupal.Semantics.FunctionCall.EmptyString</name>
    <configKey>EMPTYSTRING</configKey>
    <description>Drupal.WhiteSpace.ObjectOperatorSpacing.Before</description>
  </rule>
</rules>', NULL);

# Add Drupal rules to active rule set (3 = PHP CodeSniffer profile).
INSERT INTO active_rules
SELECT NULL, 3, id, 2, NULL
FROM rules
WHERE language = 'php' AND plugin_rule_key REGEXP 'Drupal|Generic|Squiz';

# Make the PHP CodeSniffer Rules inherit from the Sonar Way.
UPDATE rules_profiles SET parent_name = 'Sonar Way' WHERE id = 3;

# Make the PHP CodeSniffer Rules the default profile for PHP projects.
UPDATE properties SET text_value = 'All PHP CodeSniffer Rules' WHERE prop_key = 'sonar.profile.php';
