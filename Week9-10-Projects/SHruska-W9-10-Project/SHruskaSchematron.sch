<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron" >
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="tei"/>
    
    <!-- 
      The text is green is an XML comment, which means it is for humans to read, but is ignored by any XML processor. 
       You can fill in your Schematron rules below each comment. They are merely there to help. 
    -->
    
    <!-- 
        New rule #1: flag when an entrie doesn't have a date 
    -->
    
    <pattern>
        <rule context="tei:entry">
            <assert test="count(date) lt 1">Each entry element must contain a date element.</assert>
        </rule>
    </pattern>
    
    <!-- 
        New rule #2: flag when a place doesn't have a region attribute 
    -->
    
    <pattern>
        <rule context="tei:place">
            <assert test="matches(@region, 'africa|americas|asia|europe|oceania')">The @region attribute on the place element must be one of the following: africa, americas, asia, europe, oceania.</assert>
        </rule>
    </pattern>
    
    
    <!-- 
        1. Write a rule to flag an <l> element that doesn't have an lb element inside it. 
    -->

<pattern>
    <rule context="tei:l">
        <assert test="count(lb) lt 1">The l element must contain at least one lb element.</assert>
    </rule>
</pattern>

    <!-- 
        2. Write a rule to flag the @n attribute on <div> if its value doesn't begin with the string "poem." 
        In your example, the first poem is correct, but the second one is not.  
        -->
    
    <pattern>
        <rule context="tei:div">
            <assert test="not(starts-with(@n,'poem'))">The @n attribute of the div element must begin with the string "poem."</assert>
        </rule>
    </pattern>
    
    
    
    <!-- 
        3. Write a rule to flag line numbers that are not contain 4 digits. 
        That is, n="0001" is correct. n="1" or n="02" are wrong 
    -->
    
    <pattern>
        <rule context="tei:l[@n]">
            <assert test="string-length(@n) != 4">The line numbers must contain 4 digits</assert>
        </rule>
    </pattern>
    
    
    
    <!-- 
        4. Write a rule to flag when a <change> element in <RevisionDesc> has no content.
        HInt: One way to figure out if there is any text content in an element is to measure the length of the content. 
     -->
   
    <pattern>
        <rule context="tei:revisionDesc/change">
            <assert test="string-length(.) != 0">The change element must have content</assert>
        </rule>        
    </pattern>
    
   
    
    <!-- 
        5. Write a rule that checks if the @type attribute on the <div> element has one of the two values "sonnet" or "limerick."
    -->
    
    <pattern>
        <rule context="tei:div">
            <assert test="matches(@type, 'sonnet') or matches(@type, 'limerick')">The @type attribute on the div element may be sonnet or limerick.</assert>
        </rule>
    </pattern>
    
    
    <!-- 
        6. This one is advanced! Write a rule to check that the lines in any sonnet have a @rhyme attribute
         Ex: <l n="0001" rhyme="a"><lb/>poetic line</l> 
         The limerick shouldn't have @rhyme attributes. HINT: think about XPath axes.
    -->
    
    <pattern>
        <rule context="tei:l[ancestor::tei:div[@type='sonnet']]">
            <assert test="@rhyme"><name/> must have a @rhyme attribute</assert>
        </rule>
    </pattern>
   
    
    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    
    <pattern>
        <rule context="tei:l">
            <assert test="node()[1][self::tei:lb]">first element of <name/> has to be an lb</assert>
        </rule>
    </pattern>
    
   
   <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->
   
    <pattern>
        
        
    </pattern>
    
    
    
</sch:schema>