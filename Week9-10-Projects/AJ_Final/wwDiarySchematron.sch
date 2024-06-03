<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="lis"/>

    <pattern>
        <rule context="lis:p/@n">
            <assert test="matches(.,'p\d+$')">@n attribute on p element must be in the form p0000. </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="lis:change/@who">
            <assert test="string-length() ne 0">@who attribute on the change element must have content</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="lis:margin">
            <assert test="@where='top' or @where='bottom' or @where='left' or @where='right'">
                the values for @where must be either top, bottom, left, or right.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="lis:religion">
            <assert test="contains('meeting scripture theology calling holiday', @aspect)">
                The values for @aspect must be one or more of: scripture, theology, meeting, holiday, or calling.
            </assert>
        </rule>
    </pattern>
    
</sch:schema>