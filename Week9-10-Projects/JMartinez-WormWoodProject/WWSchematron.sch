<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
<pattern>
    <rule context="tei:pb/@n">
        <assert test="starts-with(.,'page')">Values of attribute n in pb must start with 'page'</assert>
    </rule>
</pattern>
    
<pattern>
    <rule context="tei:weather">
        <assert test="@when">All weather elements must include a 'when' attribute</assert>
    </rule>
</pattern>
    
<pattern>
    <rule context="tei:weather/@when">
        <assert test="matches(.,'morning') or matches(.,'afternoon') or matches(.,'evening') or matches(.,'day')">the value of this atrribute must be 'morning', 'afternoon', 'evening', or 'day'</assert>
    </rule>
</pattern>

<pattern>
    <rule context="tei:marginNote/@position">
        <assert test="matches(.,'upper') or matches(.,'lower') or matches(.,'right') or matches(.,'left')">The value of @position must be 'upper', 'lower', 'right', or  'left.</assert>
    </rule>
</pattern>
 
    
</sch:schema>