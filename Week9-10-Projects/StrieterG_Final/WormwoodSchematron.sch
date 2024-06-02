<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
<!-- Wormwood Diary XML Schematron -->

<!-- ensure every date element has a "when" attribute as is best practice in XML encoding -->
<pattern>
    <rule context="tei:date">
        <assert test="string-length(@when)=10">When attribute must contain 10 characters "XXXX-XX-XX"</assert>
    </rule>
</pattern>
    
<!-- ensure page break elements indicate which page is being broken -->
<pattern>
    <rule context="tei:pb">
        <assert test="starts-with(@n, 'p')">pb's n attribute must start with "p" to indicate page number</assert>
    </rule>
</pattern>
    
    
</sch:schema>