<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    
    <!-- 
        1. This rule flags when the author element is empty
    -->

<pattern>
        <rule context="tei:author">
            <assert test="tei:name">the author name is missing</assert>
        </rule>  
</pattern>

    <!-- 
        2. This rule ensures every quote has a quote type. 
    -->
    <pattern>
        <rule context="tei:quote">
            <assert test="tei:quote[@qtype]" > there must be a type of quote listed</assert>
        </rule>       
    </pattern>    
</sch:schema>