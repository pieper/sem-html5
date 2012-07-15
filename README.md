sem-html5
=========

Experiments in generating HTML5 (specifically jqmobile) interfaces to the slicer execution model


The Slicer Execution Model (SEM) is a XML description of program arguments, allowing the automatic
generation of GUIs and of command line parsing code.

See here for more info:

http://www.slicer.org/slicerWiki/index.php/Slicer3:Execution_Model_Documentation

https://github.com/Slicer/SlicerExecutionModel

This project is an attempt to auto-translate the XML into html for a form-based front
end to any module written with SEM.

The current plan is to use jquery mobile as the interface tool on the html side, but other
tools may be swapped out in the future.

http://jquerymobile.com/

Testing
=======

You can try the sample site by checking out the repository and then running a server.

For example on a mac:

```bash
git clone git://github.com/pieper/sem-html5
cd sem-html5/sampleSite/
python -m SimpleHTTPServer &
open http://localhost:8000
```
