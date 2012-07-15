#!/usr/bin/env python

import sys
import os

try:
  import lxml
  from lxml import etree
except ImportError:
  print("")
  print("This program requires the lxml package.")
  print("")
  print("Install it with:")
  print("")
  print("% easy_install lxml")
  print("")
  print("or see http://lxml.de")
  print("")
  exit(-1)


def usage():
  print ("")
  print ("Usage:")
  print ("sem-html5 [-f] [--xsl file.xsl] <module.xml> <module.html>")
  print ("  -f force overwrite of html file")
  print ("  --xsl default ./sem-htm5.xsl")
  print ("")

def convert (moduleXML, moduleHTML, xslFilePath, verbose=False):

  # set up the xsl transformer
  fp = open(xslFilePath)
  xsl = fp.read()
  fp.close()
  xslt_root = etree.XML(xsl)
  transform = etree.XSLT(xslt_root)

  # open and convert the xml
  fp = open(moduleXML)
  doc = etree.parse(fp)
  html_tree = transform(doc)

  fp = open(moduleHTML, "w")
  fp.write(str(html_tree))
  fp.close()


def main(argv):

  force = False
  verbose = False
  xslFilePath = "./sem-html5.xsl"
  moduleXML = None
  moduleHTML = None

  while argv != []:
    arg = argv.pop(0)
    if arg == "-f" or arg == "--force":
      force = True
      continue
    if arg == "-v" or arg == "--verbose":
      verbose = True
      continue
    if arg == "--xsl":
      xslFilePath = argv.pop(0)
      continue
    if arg == "--help":
      usage()
      exit()
    if not moduleXML:
      moduleXML = arg
      continue
    if not moduleHTML:
      moduleHTML = arg
      continue

  if not moduleXML:
    print ("\nPlease specify module xml")
    usage()
    exit()

  if not moduleHTML:
    print ("\nPlease specify module html target")
    usage()
    exit()

  if not force and os.path.exists(moduleHTML):
    print ("\nhtml file (%s) exists - delete it first" % moduleHTML)
    exit()

  if not os.path.exists(xslFilePath):
    print ("\nxsl file (%s) not exist" % xslFilePath)
    usage()
    exit()

  if not os.path.exists(moduleXML):
    print ("xml file (%s) not exist" % moduleXML)
    usage()
    exit()

  if verbose:
    print ("\nWill convert \n\t%s \nto \n\t%s \nwith %s\n" % (moduleXML, moduleHTML, xslFilePath))

  convert (moduleXML, moduleHTML, xslFilePath, verbose=verbose)
  

  if verbose:
    print ('\nModule %s created!' % moduleHTML)

if __name__ == "__main__":
  main(sys.argv[1:])
