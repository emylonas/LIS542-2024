<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <!-- 
     Schematron Wormwood XML
    -->
    
    <!-- 
        1. Flag if title is empty
    -->
    
    <pattern>
        <rule context= "tei:fileDesc/tei:titleStmt">
            <assert test='titleStmt'>flag if title is emtpy</assert>
        </rule>
    </pattern>
    
    <!-- 
        2. Date elements must have a @when attribute
        -->
    
    <pattern>
        <rule context="tei:date"> 
            <assert test="@when">All date elements must have a @when attribute.</assert> 
        </rule>  
    </pattern>
    
    
    <!-- 
        3. @when attribute must have 10 characters (yyyy-mm-dd) format
    -->
    
    <pattern>
        <rule context="tei:date">
            <assert test="string-length(@when)=10">@when attribute must have 10 characters "yyyy-mm-dd" format</assert>
        </rule>
    </pattern>
    
    
  
    <!-- 
        4. date must have text content like "January 29th. Wednesday"
     -->
    <pattern>
        <rule context="tei:date">
        <assert test="text()"><name/> date must have text content.</assert>
        </rule>
    </pattern>
    
    
    
    <!-- 
        5. flag names that don't have @role attribute
    -->
    
    <pattern>
        <rule context="tei:name">
            <assert test="@role">names that don't have @role attribute</assert>
        </rule>
    </pattern>
    
    <!-- 
        6. p must have @n attribute
    -->
    
    <pattern>
        <rule context="tei:p"> 
            <assert test="@n">All p elements must have a @n attribute.</assert> 
        </rule>
    </pattern>

 
</sch:schema>
