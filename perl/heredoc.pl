#!/usr/bin/perl -w

my $serverName=$ENV{"DOC_SERVER"};
my $REPO_NAME=$ENV{"REPO_NAME"};

my $text;
{
    local $/;               # Slurp the whole file
    $text = <>;
}

my $MD_DOC_STRING=<<MD_EOF;


$REPO_NAME 项目库文档地址
====================
$REPO_NAME 项目库文档地址为: [http://$serverName/$REPO_NAME][doc]

[doc]: http://$serverName/$REPO_NAME "$REPO_NAME doc"

MD_EOF

$text = $text . $MD_DOC_STRING;

print $text
__END__

Using a here-doc allows us to print multi-line strings without worrying about the quotes and escaping that come with the standard method of defining strings. A here-doc is started with the <<END statement:
 #!/usr/bin/perl -w

 $heredoc = <<END;
 Everything after the
 start of the
 here-doc is part of
 the string until we get
 to the
 END
 print $heredoc;
END is just used as an example, it could be any word. The important rule to remember is that you finish a here-doc using the same word you started, and it must be by itself on the line (as END is in the above example). The output of the script looks like this:
 Everything after the
 start of the
 here-doc is part of
 the string until we get
 to the
You can also specify strings inside the here-doc and they will be interpolated. This is especially useful for dealing with large chunks of text, like in an HTML document:
 #!/usr/bin/perl -w

 $text = 'Text from a Perl string.';
 print <<HTML;
 <html>
 <head>
 <title>Here-Doc Example</title>
 </head>
 <body>
 <h1>Here-Doc Example</h1>
 <p>$text</p>
 </body>
 HTML

If you do not want your strings to be interpolated, surround the keyword with single quotes like so:
 print <<'HTML';

