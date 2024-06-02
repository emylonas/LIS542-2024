<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
  <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <!-- 
      Schematron for Wormwood diaries 
    -->

  <pattern>
    <rule context="tei:p">
      <report test="tei:date">No date elements are allowed inside paragraph elements.</report>
    </rule>
  </pattern>
  
  <pattern>
    <rule context="tei:date">
      <assert test="@when">All date elements must have a @when attribute.</assert>
    </rule>
  </pattern>
  
  <pattern>
    <rule context="tei:place[@type]">
      <assert test="@type=('city', 'state', 'country')">>The @type attribute of the place element must be either city, state, or country.</assert>
    </rule>
  </pattern>
    
</sch:schema>