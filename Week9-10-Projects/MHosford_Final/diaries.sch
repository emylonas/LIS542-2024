<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
<!-- the change element in revision description must have content, need to leave a papertrail of edits &c. &c. -->
    <pattern>
        <rule context="RevisionDesc">
            <report test="string-length(change) = 0"> A change element in RevisionDesc must have
                content.</report>
        </rule>
    </pattern>
    
 <!-- the mapRef for a place element must contain a valid URL -->
    <pattern>
        <rule context="place">
            <assert test="matches(@mapRef, '^https?://[^\s/$.?#].[^\s]*$')">
                A place element must have a valid URL as the value of its mapRef attribute.
            </assert>
        </rule>
    </pattern>
    
<!-- pagebreaks must have page numbers in chronological order -->
    <pattern>
        <rule context="pb">
            <assert test="not(preceding-sibling::pb) or number(substring-after(@n, 'p')) &gt; number(substring-after(preceding-sibling::pb[1]/@n, 'p'))">
                The @n value of pb elements must follow a chronological order.
            </assert>
        </rule>
    </pattern>

</sch:schema>
