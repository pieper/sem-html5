<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
  xmlns:err="http://www.w3.org/2005/xqt-errors"
  exclude-result-prefixes="xs xdt err fn">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>


  <!--
  ===================================================================
    Match elements from the XML description
  ===================================================================
  -->

  <!-- start matching at 'executable' element -->
  <xsl:template match="executable">
    <xsl:variable name="moduleTitle"><xsl:value-of select="title"/></xsl:variable>
    <html>
      <head>
        <title><xsl:value-of select="title"/></title>
        <meta content='width=device-width, initial-scale=1' name='viewport'></meta>
        <link href='../stylesheets/jquery.mobile-1.1.0.min.css' rel='stylesheet'></link>
        <script src='../js/jquery-1.7.2.min.js'/>
        <script src='../js/jquery.mobile-1.1.0.min.js'/>
      </head>
      <body>
            <div data-role='page' data-title='moduleTitle' id='page1'>
                <div data-role="content" style="padding: 15px">
                    <div data-theme="" data-content-theme="">

                      <!-- process the parameters blocks -->
                      <xsl:apply-templates select="parameters"/>

                    </div>
                </div>
            </div>
      </body>
    </html>
  </xsl:template>


  <!-- Match the 'parameters' element and create the parameter groups -->
  <xsl:template match="parameters">
    <div data-role="collapsible" data-collapsed="false">
        <h3><xsl:value-of select="label"/></h3>
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <xsl:apply-templates select="./description/following-sibling::*"/>
            </fieldset>
        </div>
    </div>
  </xsl:template>

  <!--
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    INTEGER parameter
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <xsl:variable name="name"><xsl:value-of select="name"/></xsl:variable>
    <xsl:variable default="default"><xsl:value-of select="default"/></xsl:variable>
  -->

  <xsl:template match="parameters/integer">

    <div>
      <label for="textinput1">
          <xsl:value-of select="name"/>
      </label>
      <input id="textinput1" placeholder="" type="number">
        <xsl:attribute name="value"> <xsl:value-of select="default"/> </xsl:attribute>
      </input>
    </div>

  </xsl:template>
 
</xsl:stylesheet>
