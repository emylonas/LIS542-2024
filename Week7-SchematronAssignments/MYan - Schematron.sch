<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <!-- 
      The text is green is an XML comment, which means it is for humans to read, but is ignored by any XML processor. 
       You can fill in your Schematron rules below each comment. They are merely there to help. 
    -->
    
    <!-- 
        1. Write a rule to flag an <l> element that doesn't have an lb element inside it. 
    -->

    <pattern>
        <rule context="tei:l">
            <assert test="tei:lb">L element must contain an LB element inside of it</assert>
        </rule>
    </pattern>

    <!-- 
        2. Write a rule to flag the @n attribute on <div> if its value doesn't begin with the string "poem." 
        In your example, the first poem is correct, but the second one is not.  
        -->
    
<pattern>
    <rule context="tei:div">
        <assert test="starts-with (@n,'poem')">The @n aatribute must begin with the string "poem"</assert>
    </rule>            
</pattern>   
    
    
    <!-- 
        3. Write a rule to flag line numbers that are not contain 3 digits. 
        That is, n="0001" is correct. n="1" or n="02" are wrong 
    -->
    
<pattern>
    <rule context="tei:l">
        <assert test="string-length(@n) ge 3">String length must contain, or have more than 3 digits</assert>
    </rule>            
</pattern>
    
    
    <!-- 
        4. Write a rule to flag when a <change> element in <RevisionDesc> has no content.
        HInt: One way to figure out if there is any text content in an element is to measure the length of the content. 
     -->
   
   <!-- Matt: having a bit of trouble with this one, won't seem to flag -->
   
<pattern>
    <rule context="tei:revisiondesc/tei:change">
        <report test="string-length(.)= 0 ">Change elements must have text content</report>
    </rule>        
        
</pattern>

    
    <!-- 
        5. Write a rule that checks if the @type attribute on the <div> element has one of the two values "sonnet" or "limerick."
    -->
    
<pattern>
    <rule context="tei:div">
        <assert test="(@type='sonnet') or (@type='limerick')">Poem type must either be a "sonnet" or "limerick"</assert>
    </rule>    
</pattern>
    
    
    <!-- 
        6. This one is advanced! Write a rule to check that the lines in any sonnet have a @rhyme attribute
         Ex: <l n="0001" rhyme="a"><lb/>poetic line</l> 
         The limerick shouldn't have @rhyme attributes. HINT: think about XPath axes.
    -->
    
<pattern>
    <rule context="tei:l[ancestor::tei:div[@type='sonnet']]">
        <assert test="@rhyme">Lines in sonnet must have a @rhyme attribute</assert>
    </rule>         
</pattern>
    
    
    
    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    
<pattern>
    <rule context="tei:l">
        <assert test="child::*=tei:lb">Each L element must immediately be followed by an LB element</assert>
    </rule>
</pattern>
    
   
   <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->

        <!--Matt: Having a bit of trouble with this one, using "substring-before" affects <l n="000x"> - "The first word in the line of a poem must begin with a capital letter"-->

<pattern>
    <rule context="tei:l">
        <assert test="matches(normalize-space(text()),'[A-Z]')">The first word in a line must begin with a capital letter</assert>
    </rule>
</pattern>

        
</sch:schema>