<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <pattern>
        <rule context="l">
            <assert test="lb">Flag if line does not have lb element</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="@n/div">
            <assert test="starts-with('poem')">Flag if @n doesn't begin with "poem". </assert>            
        </rule>
    </pattern>
    
    <pattern>
        <rule context="ln">
            <assert test="@n gt 3"> Flag line numbers that has at least 4 digits </assert>
        </rule>
    </pattern> 
    
    <pattern>
        <rule context="RevisionDesc/change">
            <report test="RevisionDesc=empty"> FFlag when a change element in RevisionDesc has no content.</report>
        </rule> 
    </pattern>
    
    <pattern>
        <rule context="div/@type">
            <report test="@type = 'sonnet'"> Checks if the @type attribute on the div element has value "sonnet" </report>
            <report test="@type = 'limerick'"> Checks if the @type attribute on the div element has value "limerick" </report>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="head/sonnet">
            <report test="@rhyme"> check that the lines in any sonnet have a @rhyme attribute </report>
        </rule>
        
    </pattern>

    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    
    <pattern>
        <rule context="l">
            <assert test="lb"></assert>
        </rule>
    </pattern>
    
    

    
    
</sch:schema>