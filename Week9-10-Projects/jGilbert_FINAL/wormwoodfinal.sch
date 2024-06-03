<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <pattern>
        <rule context="/d:journal">
            <assert test="d:metadata/d:sourceInfo/d:title">The document must have a title.</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="/d:journal">
            <assert test="d:metadata/d:sourceInfo/d:author">The document must have an author.</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="/d:journal">
            <assert test="d:metadata/d:sourceInfo/d:publisher">The document must have a publisher.</assert>
        </rule>
    </pattern>
    
    
    
</sch:schema>