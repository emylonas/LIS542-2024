<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <!-- <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/> --> <!-- Old namespace for the poems schematron file from Week7 --> 
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    

    <!-- 
        1. Write a rule to flag the @ref attribute on <place> if its value doesn't begin with the string "https//maps" to yield a mapping website (even if I'm too yet dim to create the active link )
          
        -->
    
    <pattern>
        
            <rule context="tei:place">
                <assert test="starts-with(@ref,'https')">Any place name of interest should include link to mapping website to give info on proximity/location</assert>
            </rule>
            
        
        
    </pattern>
    
    
    <!-- 
         2.  A rule to flag when a <corr> element after <sic> element has no content.
        
     -->
   
    <pattern>
        <rule context="tei:sic/tei:corr">
            <assert test="string-length () ne 0">If there is an error/typo/misprint marked by "sic" then a correction of explanation should be assigned</assert>
        </rule>
        
    </pattern>
    
   
    
</sch:schema>