<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>Diary XML Validation</title>
    
    <!-- Contribution Information -->
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <!-- Rule to ensure correct line numbering in entries -->
    <pattern id="line-numbering">
        <title>Ensure correct line numbering in entries</title>
        <rule context="entry">
            <assert test="every $line in p/@line satisfies number($line) >= 1">Each paragraph line attribute must be a positive integer.</assert>
        </rule>
    </pattern>
    
    <!-- Rule to check that the 'change' element contains text -->
    <pattern id="change-element-content-check">
        <title>Change Element Content Check</title>
        <rule context="revisions/change">
            <assert test="string-length(normalize-space(.)) > 0">The 'change' element must not be empty and should contain text.</assert>
        </rule>
    </pattern>
</schema>