<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix='tei'/>
    
    <sch:rule context='tei:alt-weekday-normal'>
        <sch:assert test="matches('^\d{4}\d{3}[1-7]$')">
            The alternate date needs to conform to ISO 8061 (YYYY-'W'WW-D), where WW is one of 52 weeks in the format W00 and D is an integer 1-7 representing Monday-Sunday.
        </sch:assert>
    </sch:rule>
    <sch:rule context='tei:wmo'>
        <sch:assert test="matches('^[1-99]$')">
            The World Meteorological Organization code needs to conform to their range (01-99).
        </sch:assert>
    </sch:rule>
</sch:schema>