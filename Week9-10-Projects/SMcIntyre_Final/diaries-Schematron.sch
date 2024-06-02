<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="dia"/>
    
    <!-- 
        Weather can only be: sunny, rainy, cloudy, snowy, or windy
    -->
    
    <pattern>
        <rule context="dia:weather/@type">
            <assert test="(.='sunny') or (.='rainy') or (.='cloudy') or (.='snowy') or (.='windy')">type should be sunny, rainy, cloudy, snowy, or windy</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="dia:change">
            <assert test="string-length() ne 0">changes in revisions element cannot be empty</assert>
        </rule>
    </pattern>
    
    
</sch:schema>