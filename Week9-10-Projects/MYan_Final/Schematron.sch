<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <!-- Wormwood Schematron -->
 
    <!-- Each date element must contain a "when" attribute-->
    
    <pattern>
        <rule context="tei:date">
            <assert test="@when">"Date" element must contain a "when" date attribute</assert>
        </rule>
    </pattern>
    
 
    <!-- Each "when" attribute should be filled out with correct date formatting-->
  
    <pattern>
        <rule context="tei:date">
            <assert test="string-length(@when)=10">Attribute must be filled in the following format "yyyy-mm-dd-"</assert>
        </rule>
    </pattern>

    <!-- Each "name" element should be must contain a "role" attribute-->

    <pattern>
        <rule context="tei:entries//tei:name">
            <assert test="@role">"Name" element must have a "role" attribute</assert>
        </rule>
    </pattern>
    
    
</sch:schema>