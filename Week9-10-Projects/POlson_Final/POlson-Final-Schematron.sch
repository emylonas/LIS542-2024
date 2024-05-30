<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="wd"/>
    
    <pattern>
        <rule context="wd:offense-event">
            <assert test="@severity = 'Trivial' or @severity = 'Moderate' or @severity = 'Severe'">
                The severity attribute of an offense event must be "Trivial", "Moderate", or "Severe". Check your capitalisation and spelling.
            </assert>
        </rule>    
    </pattern>
    
    <pattern>
        <rule context="wd:offense-event/wd:offending-action">
            <assert test="not(wd:laugh-at) or @offender = wd:laugh-at/@laugher">
                In an offending-action element, if the offense is laughter at another's expense, the laugher must match the offender attribute. Check your capitalisation, spelling, and order of names if multiple people are laughing.
            </assert>
            <assert test="not(wd:insult) or @offender = wd:insult/@nameCaller">
                In an offending-action element, if the offense is name calling, the name caller must match the offender attribute. Check your capitalisation, spelling, and order of names if multiple people are calling names.
            </assert>
        </rule>    
    </pattern>
    
    <pattern>
        <rule context="wd:offense-event/wd:offending-action">
            <assert test="not(wd:laugh-at) or @offended = wd:laugh-at/@laughee">
                In an offending-action element, if the offense is laughter at another's expense, the person being laughed at must match the offended attribute. Check your capitalisation, spelling, and order of names if multiple people are being laughed at.
            </assert>
            <assert test="not(wd:insult) or @offended = wd:insult/@target">
                In an offending-action element, if the offense is name calling, the target of the name calling must match the offended attribute. Check your capitalisation, spelling, and order of names if multiple people are being called a name.
            </assert>
        </rule>     
    </pattern>
    
    <pattern>
        <rule context="wd:offense-event">
            <assert test="not(wd:response) or wd:offending-action/@offender = wd:response/wd:offending-action/@offended">
                If an offense event contains a response, then the response must have an offending-action element in which the initial offendee is the offender, and vice versa.
            </assert>
        </rule>    
    </pattern>
    
</sch:schema>
