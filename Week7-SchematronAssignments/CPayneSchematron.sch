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
    
    
    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    <pattern>
        <rule context="tei:l">
            <assert test="tei:lb">l elements must have an lb element inside it</assert>
            <assert test="child::node()[position() = 1] = tei:lb">l elements must start with lb elements</assert>
        </rule>
    </pattern>
    
    <!-- 
        2. Write a rule to flag the @n attribute on <div> if its value doesn't begin with the string "poem." 
        In your example, the first poem is correct, but the second one is not.  
        -->
    
    <pattern>
       <rule context="tei:div">
           <assert test="starts-with(@n, 'poem')">div @n attribute must start with "poem"</assert>
       </rule> 
        
    </pattern>
    
    
    
    <!-- 
        3. Write a rule to flag line numbers that do not contain 4 digits. 
        That is, n="0001" is correct. n="1" or n="02" are wrong 
    -->
    <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->
    <!-- I divided the rules between the very first line and the following lines and added more detailed rules -->
    <!-- The first line number must be "0001" and the following line numberss must increase the number by 1 -->
    <pattern>
        <rule context="tei:l[not(preceding-sibling::tei:l)]/@n">
            <assert test="matches(., '\d\d\d\d')">line numbers must contain 4 digits</assert>
            <assert test="number(.) eq 1">line numbers must start at "0001"</assert>
        </rule>
        <rule context="tei:l[preceding-sibling::tei:l]/@n">
            <assert test="matches(., '\d\d\d\d')">line numbers must contain 4 digits</assert>
            <assert test="number(.) eq number(../preceding-sibling::tei:l[1]/@n) + 1">line numbers must be sequential</assert>
        </rule>
    </pattern>
    
    
    
    <!-- 
        4. Write a rule to flag when a <change> element in <RevisionDesc> has no content.
        HInt: One way to figure out if there is any text content in an element is to measure the length of the content. 
     -->
   
    <pattern>
        <rule context="tei:revisionDesc/tei:change">
            <report test="string-length(.) eq 0">revisionDesc/change element cannot be blank</report>
        </rule>
    </pattern>
    
   
    
    <!-- 
        5. Write a rule that checks if the @type attribute on the <div> element has one of the two values "sonnet" or "limerick."
    -->
    
    <pattern>
        <rule context="tei:div">
            <assert test="@type = 'sonnet' or @type = 'limerick'">div @type must be "sonnet" or "limerick"</assert>
        </rule>
        
    </pattern>
    
    
    <!-- 
        6. This one is advanced! Write a rule to check that the lines in any sonnet have a @rhyme attribute
         Ex: <l n="0001" rhyme="a"><lb/>poetic line</l> 
         The limerick shouldn't have @rhyme attributes. HINT: think about XPath axes.
    -->
    
    <pattern>
        <rule context="tei:l[ancestor::tei:div[@type='sonnet']]">
            <assert test="@rhyme">lines in sonnets must have @rhyme attributes</assert>
        </rule>
    </pattern>
    
    
    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    <!-- see pattern 1 -->

   
   <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->
    <!-- see pattern 3 -->
    
    
</sch:schema>