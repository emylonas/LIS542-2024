<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    <pattern>
        <rule context="tei:entry">
          <assert test="tei:date"> Each entry must have a date associated with it. </assert>  
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:title">
            <assert test="string-length(.) gt 0"> The title must be present in the metadata. </assert>  
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:pb">
            <assert test="starts-with(@n, 'page')"> Each page name must start with 'page.' </assert>  
        </rule>
    </pattern>
    
</schema>