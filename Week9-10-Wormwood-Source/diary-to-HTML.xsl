<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:d="http://UW-LIS-diaries/ns/1.0" exclude-result-prefixes="xs xd" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p> Stylesheet to convert the a diary marked up according to the diaries.rng schema
                to HTML.</xd:p>
            <xd:p><xd:b>Created on:</xd:b> May 10, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> elli</xd:p>

        </xd:desc>
    </xd:doc>

    <!-- line break in output file; improves human readability of xml output -->
    <!-- <xsl:strip-space elements="*"/> -->
    <xsl:variable name="newline">
        <xsl:text> 
</xsl:text>
    </xsl:variable>

    <xsl:output method="xml" encoding="UTF-8" indent="no"/>

    <xsl:template match="/">

        <!-- The following matchest the root element, and sets up the overall HTML structure. -->
        <html>
            <head>
                <title>
                    <xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="diaries.css"/>
            </head>

            <body>
                <h1>
                    <xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:title"/>
                </h1>
                <h1>
                    <xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:author"/>
                </h1>
                <xsl:apply-templates/>


                <div>
                    <h1>List of Names</h1>
                    <p>
                        <ol>
                                                       <xsl:for-each select="//d:entries//d:name" xml:space="preserve">
                                                                <li>
                                                                      <xsl:value-of select="."/> (<xsl:value-of select="@role"/>)
                                                                    </li>
                                                            </xsl:for-each>
                        </ol>
                    </p>
                </div>
            </body>
        </html>

    </xsl:template>


    <!-- **********************************************************************  Metadata elements ********************************************************************** -->
    <xsl:template match="d:journal">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- We are going to suppress all output from the metadata elements for now. Keeping the parent element around just in case we decide to use it later -->

    <xsl:template match="d:metadata">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="d:sourceInfo"/>
    <!-- Empty so that their content is hidden -->
    <xsl:template match="d:revisions"/>



    <!--   ******************************************************************** Diary Entries Strcture ******************************************************************** -->


    <xsl:template match="d:entries"> <!-- Match <entries> and keep going  -->
       
        <xsl:apply-templates/>
       
    </xsl:template>

    <xsl:template match="d:entry"> <!-- Match <entry>, surround each one with an HTML <div> element and keep going  -->
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="d:p"> <!-- Match <entry>, surround each one with an HTML <p> element and keep going  -->
        <p>
            [<xsl:value-of select="@n"/>]
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!--   ******************************************************* Phrase level elements and Milestone Elements *************************************************** -->

    <xsl:template match="d:entry/d:date">
        <!-- Match the <date> which is at the beginning of each entry. It is the child of <entry> -->
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="d:date">
        <!-- Match all other dates. This could be qualified to only match <date> in <p>.-->
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="d:name"> <!-- Enclosing in HTML span element with class attribute so CSS formatting can be applied. -->
        <span class="name"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="d:place"> <!-- Enclosing in HTML span element with class attribute so CSS formatting can be applied. -->
        <span class="place"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="d:alternates"> <!-- Match <alternate> and keep going. -->
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="d:cite">
       <xsl:apply-templates/>
    </xsl:template>
    

    <xsl:template match="d:original | d:abbr"> <!-- Enclosing in HTML span element with class attribute to allow js to hide and show orig/new spelling. -->
        <span class="original"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="d:corr | d:expan"> <!-- Enclosing in HTML span element with class attribute to allow js to hide and show orig/new spelling. -->
        <span class="modern"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="d:del">
        <span class="del"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="d:pb"> [<xsl:value-of select="@n"/>] </xsl:template>
    <!--  or  select="concat('page ',translate(@n, 'page0', ''))"  for a more elegant display -->

    <!-- Catch all to see what we aren't handling -->

    <!-- <xsl:template match='*'>
        QQQ-element: <xsl:value-of select="name()"/>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>-->

</xsl:stylesheet>
