<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
 <!--
   1. This rule flags a dialog if the type of the dialog has not been identified.
 -->
  <pattern>
    <rule context="dialog">
      <assert test="@type">Flag if a dialog element doesn't have a type attribute.</assert>
    </rule>
  </pattern>
  
 <!--
   2. This rule flags 
 -->
<pattern>
  <rule context="date">
    <assert test="matches(@when, '\d{4}-\d{2}-\d{2}')">Flag if sourceDesc is empty.</assert>
  </rule>
</pattern>
      
</sch:schema>
