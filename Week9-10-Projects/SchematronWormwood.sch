<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <pattern>
        <rule context="tei:date">
            <assert test="@when">Date must have a when attribute</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:entry">
            <assert test="starts-with(@xml:id, 'xx')">The xml:id must start with "xx"</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:pb">
            <assert test="starts-with(@n, 'p')">The page break must start with "p"</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:margin">
            <assert test="@note">Margin elements must have a note about page location</assert>
        </rule>
    </pattern>
</sch:schema>