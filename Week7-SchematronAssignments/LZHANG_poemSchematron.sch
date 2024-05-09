<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <pattern id="line-check">
        <title>Line Element LB Check</title>
        <rule context="tei:l">
            <assert test="tei:lb">Each 'l' element should contain at least one 'lb' element.</assert>
        </rule>
    </pattern>    
    
    <pattern id="div-n-attribute-check">
        <title>Check the @n attribute on div elements</title>
        <rule context="tei:div">
            <assert test="starts-with(@n, 'poem')">The @n attribute on div elements must start with 'poem'.</assert>
        </rule>
    </pattern>
    
    <pattern id="line-number-exact-check">
        <title>Exact Four-Digit Line Number Check</title>
        <rule context="tei:l">
            <assert test="matches(@n, '^\d{4}$')">The @n attribute on line elements must contain exactly four digits, such as 0001, 0002, etc. Formats like '1' or '02' are incorrect.</assert>
        </rule>
    </pattern>
    
    <pattern id="change-element-content-check">
        <title>Change Element Content Check</title>
        <rule context="tei:RevisionDesc/tei:change">
            <assert test="string-length(normalize-space(.)) > 0">The 'change' element must not be empty and should contain text.</assert>
        </rule>
    </pattern>
    
    <pattern id="div-type-validation">
        <title>Validation of div @type Attribute</title>
        <rule context="tei:div">
            <assert test="(@type = 'limerick') or (@type = 'sonnet')">
                The type of a poem must be either limerick or sonnet.
            </assert>
        </rule>
    </pattern>
    
    <pattern id="sonnet-rhyme-check">
        <title>Rhyme Attribute Check for Sonnets</title>
        <rule context="tei:div[@type='sonnet']/tei:l">
            <assert test="@rhyme">Each line in a sonnet must have a 'rhyme' attribute.</assert>
        </rule>
    </pattern>
    
    <pattern id="line-start-check">
        <title>Line Break Check</title>
        <rule context="tei:l">
            <assert test="tei:lb[1]">The first child of each 'l' element must be an 'lb' element.</assert>
        </rule>
    </pattern>
    
    <!-- 
    Check the number of lines in each type of poem to ensure they meet the expected format.
-->
    <pattern id="line-count-check">
        <title>Line Count Check for Poems</title>
        <rule context="tei:div[@type='sonnet']">
            <assert test="count(tei:l) = 14">Each sonnet must have exactly 14 lines.</assert>
        </rule>
        <rule context="tei:div[@type='limerick']">
            <assert test="count(tei:l) = 5">Each limerick must have exactly 5 lines.</assert>
        </rule>
    </pattern>
    
</sch:schema>