<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <!-- 
      The text is green is an XML comment, which means it is for humans to read, but is ignored by any XML processor. 
       You can fill in your Schematron rules below each comment. They are merely there to help. 
    -->
    
    <!-- 
        1. Write a rule to flag an <l> element that doesn't have an lb element inside it. 
    -->

<pattern>
    <rule context="tei:author">
        <assert test="string-length(.) gt 0">Checks to see if document has a author.</assert>
    </rule>
    
</pattern>


   
    <pattern>
       <rule context="tei:title">
           <assert test="string-length(.) gt 0">Checks to see if document has a title.</assert>   
       </rule> 
        
    </pattern>
    
    
    
</sch:schema>