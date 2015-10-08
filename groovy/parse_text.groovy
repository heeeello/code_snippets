

// http://stackoverflow.com/questions/13567122/how-to-parse-text-in-groovy

// Run the command
String output = cmdLine.execute().with { proc ->

  // Then, with a StringWriter
  new StringWriter().with { sw ->

    // Consume the output of the process
    proc.consumeProcessOutput( sw, System.err )

    // Make sure we worked
    assert proc.waitFor() == 0

    // Return the output (goes into `output` var)
    sw.toString()
  }
}

// Extract the version from by looking through all the lines
Integer version = output.readLines().findResult { line ->

  // Pass the line through a regular expression
  (line =~ /Last Changed Rev: (\d+)/).with { m ->

    // And if it matches
    if( m.matches() ) {

      // Return the \d+ part as an Integer
      m[ 0 ][ 1 ] as Integer
    }
  }
}
