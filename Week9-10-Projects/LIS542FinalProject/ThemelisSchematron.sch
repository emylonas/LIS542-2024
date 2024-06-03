<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">   
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <pattern>
        <rule context="tei:name">
            <assert test="@standard">Every name element must contain a standard attribute.</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:date">
            <assert test="@weather">Every date element must contain a weather attribute.</assert>
        </rule>
    </pattern>
    
</sch:schema>
