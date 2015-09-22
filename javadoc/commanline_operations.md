


http://www.javapractices.com/topic/TopicAction.do?Id=243

compile
=====

<pre>
PROJECT_HOME
  -> lib (jar files)
  -> src (java code)
    -> hirondelle (top-level package; no .java files)
      -> ante (.java files)
        -> deluvian (.java files)

PROJECT_HOME>javac -cp lib\* src\hirondelle\ante\*.java src\hirondelle\ante\deluvian\*.java

PROJECT_HOME>javac -cp lib\* -d build src\hirondelle\ante\*.java src\hirondelle\ante\deluvian\*.java


-cp lib\*;C:\abc\one.jar;C:\xyz\two.jar

</pre>

run
===
<pre>
PROJECT_HOME>java -cp lib\*;src hirondelle.ante.Launcher
PROJECT_HOME>java -cp lib\*;src hirondelle.ante.Launcher arg1 arg2 "Arg Three"
// Setting a System property value with -D:
PROJECT_HOME>java -Dblah=whatever -cp lib\*;src hirondelle.ante.Launcher

//Set the initial and maximum size of the object allocation pool to 5 Meg and 100 Meg, respectively:
PROJECT_HOME>java -cp lib\*;src -Xms5m -Xmx100m hirondelle.ante.Launcher

//Run a jar file whose manifest specifies a Main-Class attribute:
C:\@build\dist>java -jar example-app-1.1.jar
//The javaw command is the same as the java command, with the only difference being that javaw has no associated console window.

</pre>

using javadoc
======

<pre>

javadoc -sourcepath src -subpackages hirondelle.ante -classpath lib\* -d C:\@build\javadoc

javadoc 
 -sourcepath src 
 -subpackages hirondelle.ante 
 -package
 -classpath lib\* 
 -d C:\@build\javadoc
 -linksource
 -link http://docs.oracle.com/javase/7/docs/api/
 -noqualifier java.*:javax.*
 -windowtitle "My App 1.0"
 -header "<b>My App 1.0</b>"
 -footer "<a href='http://www.blah.com'>My App</a>"
</pre>

The javadoc tool has many options. You may find these especially useful:
-linksource: links your javadoc to a static snapshot of the underlying source code (very nice).
-windowtitle, -header and -footer: often useful for showing the name and version of your application.
-link: link to the JDK's javadoc as well
-noqualifier: remove tedious package prefixes from JDK classes
define the minimum class scope to be processed, using one of: -private, -package, -protected, -public.

Javadoc can also be controlled using the following items, placed beside your source code:
package-info.java - Each package can include a package-info.java file. It contains package-level documentation. Despite its extension, a package-info.java file is not a Java class file.
doc-files subdirectories - each package can include a 'doc-files' subdirectory, containing items that can be linked from javadoc (images, html files, and so on) using ordinary hypertext links.
overview.html - a single file describing general aspects of your project. (This file doesn't necessarily reside in your source tree, but it makes sense to place it there, in analogy with the package-info.java files.)

