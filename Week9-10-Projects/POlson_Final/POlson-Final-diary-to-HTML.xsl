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
                <h2>
                    <xsl:value-of select="/d:journal/d:metadata/d:sourceInfo/d:author"/>
                </h2>
                <xsl:apply-templates/>
               
            </body>
            <div>
                <h1>List of Offenses</h1>
                <ol>
                    <xsl:for-each select="//d:offense-event">
                        <li>
                            <strong>Excerpt:</strong> <xsl:value-of select="normalize-space(.)"/>
                            <br/><strong>Belligerents: </strong> <xsl:value-of select="@belligerents"></xsl:value-of>
                            <br/><strong>Severity: </strong> <xsl:value-of select="@severity"></xsl:value-of>
                            <br/><strong>Offense Type: </strong> <xsl:value-of select="@offenseType"></xsl:value-of>
                            <br/><br/><strong>Offending Actions</strong>
                            <xsl:for-each select="d:offending-action"><br/>
                                <br/><strong>Offender: </strong> <xsl:value-of select="@offender"/>
                                <br/><strong>Offended: </strong> <xsl:value-of select="@offended"/>
                                <br/><strong>Provoked?: </strong> <xsl:value-of select="@provoked"/>
                                <br/><strong>Text:</strong> "<xsl:value-of select="normalize-space(.)"/>"
                                <xsl:if test="d:insult">
                                    <br/><strong>Insult by offender</strong>
                                    <br/><strong>Insult:</strong> <xsl:value-of select="d:insult"/>
                                    <br/><strong>Insult Type:</strong> <xsl:value-of select="d:insult/@nameKind"/>
                                    <br/><strong>Explanation:</strong> <xsl:value-of select="d:insult/@Explanation"/>
                                    <br/><strong>Modern Equivalent:</strong> <xsl:value-of select="d:insult/@modernEquivalent"/>
                                </xsl:if>
                                <xsl:if test="d:laugh-at">
                                    <br/><strong>Laughter at offended's expense</strong>
                                    <br/><strong>Reason:</strong> <xsl:value-of select="d:laugh-at/@reason"/>
                                </xsl:if>
                            </xsl:for-each>
                            <br/><br/><strong>Responses</strong>
                            <xsl:if test="not(d:response)">
                                <br/> No response indicated.<br/>
                            </xsl:if>
                            <xsl:for-each select="d:response/d:offending-action"><br/>
                                <br/><strong>Offender: </strong> <xsl:value-of select="@offender"/>
                                <br/><strong>Offended: </strong> <xsl:value-of select="@offended"/>
                                <br/><strong>Provoked?: </strong> <xsl:value-of select="@provoked"/>
                                <br/><strong>Text:</strong> "<xsl:value-of select="normalize-space(.)"/>"
                                <xsl:if test="d:insult">
                                    <br/><strong>Insult:</strong> <xsl:value-of select="d:insult"/>
                                    <br/><strong>Insult Type:</strong> <xsl:value-of select="d:insult/@nameKind"/>
                                    <br/><strong>Explanation:</strong> <xsl:value-of select="d:insult/@Explanation"/>
                                    <br/><strong>Modern Equivalent:</strong> <xsl:value-of select="d:insult/@modernEquivalent"/>
                                </xsl:if>
                                
                            </xsl:for-each>
                                
                            <br/>
                        </li>
                        
                    </xsl:for-each>
                </ol>
                
            </div>
        </html>

    </xsl:template>
    <xsl:template match="d:metadata">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="d:sourceInfo"/>
    <!-- Empty so that their content is hidden -->
    <xsl:template match="d:revisions"/>
    <xsl:template match="d:entry/d:date">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    
    <xsl:template match="d:offense-event">
        <span class="offense-event">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="d:offending-action">
        <span class="offending-action">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="d:insult">
        <span class="insult">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="d:response">
        <xsl:apply-templates/>
    </xsl:template>
    

</xsl:stylesheet>
