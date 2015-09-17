
# see http://download.java.net/jdk7u2/docs/technotes/tools/solaris/javadoc.html

javadoc -sourcepath /java/jdk/src/share/classes \
    -overview /java/jdk/src/share/classes/overview.html \
    -d /java/jdk/build/api \
    -use \
    -splitIndex \
    -windowtitle 'Java Platform, Standard Edition 7 API Specification' \
    -doctitle 'Java Platform, Standard Edition 7 API Specification' \
    -header '<b>Java™ SE 7</b>' \
    -bottom '<font size="-1">
      <a href="http://bugreport.sun.com/bugreport/">Submit a bug or feature</a><br/>
      Copyright &copy; 1993, 2011, Oracle and/or its affiliates. All rights reserved.<br/>
      Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
      Other names may be trademarks of their respective owners.</font>' \
    -group "Core Packages" "java.*:com.sun.java.*:org.omg.*" \
    -group "Extension Packages" "javax.*" \
    -J-Xmx180m \  
    @packages

javadoc -sourcepath $(SRCDIR)              \   /* Sets path for source files     */
        -overview $(SRCDIR)/overview.html  \   /* Sets file for overview text    */
        -d /java/jdk/build/api             \   /* Sets destination directory     */
        -use                               \   /* Adds "Use" files               */
        -splitIndex                        \   /* Splits index A-Z               */
        -windowtitle $(WINDOWTITLE)        \   /* Adds a window title            */
        -doctitle $(DOCTITLE)              \   /* Adds a doc title               */
        -header $(HEADER)                  \   /* Adds running header text       */
        -bottom $(BOTTOM)                  \   /* Adds text at bottom            */
        -group $(GROUPCORE)                \   /* 1st subhead on overview page   */
        -group $(GROUPEXT)                 \   /* 2nd subhead on overview page   */
        -J-Xmx180m                         \   /* Sets memory to 180MB           */
        java.lang java.lang.reflect        \   /* Sets packages to document      */
        java.util java.io java.net         \
        java.applet
        
WINDOWTITLE = 'Java™ SE 7 API Specification'
DOCTITLE = 'Java™ Platform Standard Edition 7 API Specification'
HEADER = '<b>Java™ SE 7</font>'
BOTTOM = '<font size="-1">
      <a href="http://bugreport.sun.com/bugreport/">Submit a bug or feature</a><br/>
      Copyright &copy; 1993, 2011, Oracle and/or its affiliates. All rights reserved.<br/>
      Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
      Other names may be trademarks of their respective owners.</font>'
GROUPCORE = '"Core Packages" "java.*:com.sun.java.*:org.omg.*"'
GROUPEXT  = '"Extension Packages" "javax.*"'
SRCDIR = '/java/jdk/1.7.0/src/share/classes'
