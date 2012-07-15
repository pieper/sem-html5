<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
  xmlns:err="http://www.w3.org/2005/xqt-errors"
  xmlns:ctk="http://www.commontk.org"
  exclude-result-prefixes="xs xdt err fn">

  <xsl:output method="xml" indent="yes"/>


  <!--
  ===================================================================
    Match elements from the XML description
  ===================================================================
  -->

  <!-- start matching at 'executable' element -->
  <xsl:template match="/executable">
    <xsl:variable name="moduleTitle"><xsl:value-of select="title"/></xsl:variable>
    <html lang='en'>
      <head>
        <title>{normalize-space($moduleTitle)} </title>
        <meta content='width=device-width, initial-scale=1' name='viewport'></meta>
          <link href='../stylesheets/jquery.mobile-1.1.0.min.css' rel='stylesheet'></link>
        <script src='../js/jquery-1.7.2.min.js'></script>
        <script src='../js/jquery.mobile-1.1.0.min.js'></script>
      </head>
      <body>
            <div data-role='page' data-title='{normalize-space($moduleTitle)}' id='page1'>
                <div data-role="content" style="padding: 15px">
                    <div data-theme="" data-content-theme="">
                    </div>
                </div>
            </div>
      </body>
  </html>
  </xsl:template>

</xsl:stylesheet>
