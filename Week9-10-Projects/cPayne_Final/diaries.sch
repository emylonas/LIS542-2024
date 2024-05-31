<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="d"/>
    
    <!-- check that change elements include text -->
    <pattern>
        <rule context="d:change">
            <report test="string-length(.) eq 0">Change elements must include a brief description of the changes made</report>
        </rule>
    </pattern>
    
    <!-- ensure that page numbers begin with 1, start with 'page', and increase by 1 each time -->
    <pattern>
        <rule context="d:pb[not(preceding::d:pb)]">
            <assert test="@n = 'page01'">First page id must be "page01"</assert>
        </rule>
        <rule context="d:pb[preceding::d:pb]">
            <assert test="starts-with(@n, 'page')">Page id must begin with "page"</assert>
            <assert test="number(substring-after(@n, 'page')) = number(substring-after(preceding::d:pb[1]/@n, 'page')) + 1">Page ids must appear in order</assert>
        </rule>
    </pattern>
    
    <!-- check that name ids are included in a nameAuthority element -->
    <pattern>
        <rule context="d:name">
            <assert test="//d:nameAuthority/@xml:id = ./@xml:id">Names must be in the authority list</assert>
        </rule>
    </pattern>
    
    <!-- check that number values are actual numbers -->
    <pattern>
        <rule context="d:number">
            <report test="not(matches(@value, '^[0-9./:]+$'))">Value must be numeric and may only contain 0-9 and the characters . / :</report>
        </rule>
    </pattern>
    
    
</sch:schema>