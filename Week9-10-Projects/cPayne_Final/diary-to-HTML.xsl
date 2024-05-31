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
            <xd:p><xd:b>Edited by:</xd:b> Cypress Payne</xd:p>
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
                <!-- main div holds title, author, and all entries -->
                <div class="main">
                    <h1>
                        <xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:title"/>
                    </h1>
                    <h2>
                        <xsl:text>Written by </xsl:text><xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:author"/>
                    </h2>
                    <xsl:apply-templates/>
                </div>
                
                <!-- create sidebar containing a list of names from the authority list -->
                <div class="sidebar">
                    <h1>List of Names</h1>
                    <p>
                        <ol>
                            <xsl:for-each select="//d:nameAuthority">
                                <xsl:sort select="." data-type="text" order="ascending"/>
                                <li>
                                    <div><xsl:value-of select="d:standard"/>
                                        <!-- include alternate names in parentheses -->
                                        <xsl:if test="d:alternate">
                                            (<xsl:for-each select="d:alternate">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="not(position() = last())">, </xsl:if>
                                            </xsl:for-each>)
                                        </xsl:if>
                                    </div>
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

    <!-- Also suppress output from the authority list -->
    <xsl:template match="d:authorityList">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="d:nameAuthority">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="d:standard"/>
    
    <xsl:template match="d:alternate"/>
    
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

    <xsl:template match="d:pb"> <!-- match page break, use the value of @n to display the page number above each page and include a horizontal line to indicate each new page. -->
        <h3><xsl:value-of select="concat('Page ', substring-after(@n, 'page0'))"/></h3><hr/>
    </xsl:template>
    
    <xsl:template match="d:marginalia"> <!-- enclose marginalia in span element to allow CSS formatting -->
        <span class="marginalia"><xsl:apply-templates/></span>
    </xsl:template>
    
    <!-- ignora notes in marginalia for now -->
    <xsl:template match="d:note"/>
    
    <xsl:template match="d:number"> <!-- use numerical value for each number element -->
        <xsl:value-of select="@value"/>
    </xsl:template>
    
    
    <!-- Catch all to see what we aren't handling -->

    <!-- <xsl:template match='*'>
        QQQ-element: <xsl:value-of select="name()"/>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>-->

</xsl:stylesheet>
