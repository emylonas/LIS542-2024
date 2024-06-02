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
        3. Flag line numbers that are not at least two digits
    -->
    
    <pattern>
        <rule context="tei:p/@n">
            <assert test="string-length(@n) =2">@n has to contain more than one digit</assert>
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
    
    <pattern>
        <rule context="tei:date"> 
            <assert test="@when">All date elements must have a @when attribute.</assert> 
        </rule>  
    </pattern>
    
    
    
    <!-- 
        5. lines that don't contain 'school' 
    -->
    
    <pattern>
        <rule context="tei:p">
            <assert test="contains(., 'school')">lines that don't contain 'school'</assert>
        </rule>
    </pattern>
    
    <!-- 
        6. p must have a line attribute
    -->
    
    <pattern>
        <rule context="tei:p"> 
            <assert test="tei:p[@line]">All p elements must have a @line attribute.</assert> 
        </rule>
    </pattern>

 
</sch:schema>
