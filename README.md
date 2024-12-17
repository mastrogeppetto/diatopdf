# Convert dia files to a pdf without blocky artifacts
[Dia](http://dia-installer.de/) is an open source application for creating technical diagrams.
Exporting a diagram in pdf using the export tool provided by the GUI produces a low quality image. The way to obtain a
better result is to first convert the dia file to Postscript, and next convert the result to pdf, as suggested in many
places on the Web.
This is what this script does, with additional checks to avoid missing parameters, overwriting existing files etc.
The usage is straightforward:

    $ bash diatopdf.sh myfile.dia

If you want to use it systematically and in other directories, you may copy it in your bin directory and enable execution:

    $ cp diatopdf.sh ~/bin/diatopdf
    $ chmod u+x ~/bin/diatopdf

The usage is now

    $ diatopdf myfile.dia

If it does not work as expected it may be because your `~/bin` directory is not in the PATH environment variable. Check with

    $ echo $PATH

and in case the directory is not there add it with

    $ export PATH=$HOME/bin:$PATH

and next append that same statement to your .bashrc (or .zshrc on some systems). 
