<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>

    <pattern>
        <rule context="tei:date">
            <assert test="@when">Date must have a when attribute</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:date/@when">
            <assert test="starts-with(., '1896')">When attribute of Date element must start with
                "1896".</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:entry">
            <assert test="starts-with(@xml:id, 'xx')">The xml:id must start with "xx"</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:pb">
            <assert test="starts-with(@n, 'p')">The page break must start with "p"</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:margin">
            <assert test="@note">Margin elements must have a note about page location</assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:place">
            <assert
                test="(@placeType = 'country') or (@placeType = 'state') or (@placeType = 'city') or (@placeType = 'building') or (@placeType = 'landscape')"
                >The place element must contain a placeType attribute which must be either
                ‘country’, ‘state’, ‘city’, ‘building’, or 'landscape'. </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="parentheses">

            <!-- Assertion to ensure parentheses contains text or non-empty elements -->
            <assert test="normalize-space(.) != '' or ./*[normalize-space(.) != '']"> A
                “parentheses” element must contain a string of characters and can contain other
                elements, as long as those elements contain a string. </assert>

            <!-- Assertion to ensure all child elements of parentheses contain text -->
            <assert test="not(./*[(normalize-space(.) = '')])"> All child elements within a
                “parentheses” element must contain a string of characters. </assert>

        </rule>
    </pattern>
<pattern>
    <rule context='favQuote'>
        <assert test="matches(@Contributor,'^[A-Z]{2}$')">
            The "favQuote" element must contain a Contributor attribute in the format "XX" (two uppercase letters).
        </assert>
    </rule>
    </pattern>
</sch:schema>
