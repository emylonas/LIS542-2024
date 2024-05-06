<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://nothing.com/journal" prefix="jnl"/>
    
    <pattern>
        <rule context="jnl:p/jnl:name">
            <assert test="@role">There must be a @role attribute on name elements.</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="jnl:p/@n">
            <assert test="matches(.,'p\d+$')">@n attribute on p element must be in the from p0000. </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="jnl:change/@who">
            <assert test="string-length() ne 0">@who attribute  on the change element must have content</assert>
        </rule>
    </pattern>
    
    
  
</schema>

