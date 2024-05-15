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
        <assert test="tei:lb">No lb in l?!?  What were you thinking? </assert>
    </rule>
    
</pattern>
<!--  Returns flag on line 4 in the sonnet where no "line begining" element is present --> 
    
    
    <!-- 
        2. Write a rule to flag the @n attribute on <div> if its value doesn't begin with the string "poem." 
        In your example, the first poem is correct, but the second one is not.  
        -->
    
    <pattern>
        <rule context="tei:div">
            <assert test="starts-with(@n,'poem')">Aye, lad.  You've fumbled on poem leading your n-attribute.  </assert>
        </rule>
        
    </pattern>
    
    <!-- This captures the lamentable limitations of the limerick's mediocre mark-up at line 46 -->
    
    <!-- 
        3. Write a rule to flag line numbers that are not contain 3 digits. 
        That is, n="0001" is correct. n="1" or n="02" are wrong 
    -->
    
    <pattern>
        <rule context="tei:l/@n">
            <assert test="string-length() eq 4">Digital dithering degrades and digresses desseminating divisiveness and despair</assert>
        </rule>
        
    </pattern>
    <!-- Wellll, this flagged the n attribute values that were less than 4 characters but my efforts to match with 4 digits via "matches (@n, dddd)" would have been more specific to the task if I could have stumbled upon the correct syntax.  Not sure what I was doing incorrectly, but I'll move ahead after trying for the last hour. -->
    
    
    <!-- 
        4. Write a rule to flag when a <change> element in <RevisionDesc> has no content.
        HInt: One way to figure out if there is any text content in an element is to measure the length of the content. 
     -->
   
    <pattern>
        <rule context="tei:revisionDesc/tei:change">
            <assert test="string-length() ne 0">If you be so bold as to revise, leave some words for future's eyes</assert>
        </rule>
        
    </pattern>
    
   <!-- This worked but only after getting the precise name of the element as "revisionDisc" rather than the "RevisionDesc" that you offered in the set up to the question (for the want of a nail)  -->
    
    <!-- 
        5. Write a rule that checks if the @type attribute on the <div> element has one of the two values "sonnet" or "limerick."
    -->
    
    <pattern>
      <rule context="tei:div/@type">
          <assert test="contains(.,'limerick')">Drop the dime on the type of rhyme</assert>
      </rule>
        
    </pattern>
    <!-- I can not, for the life of me, figure out how to make a compound test for the type attribute.  I look at the tutorials and don't know what references I am not seeing or too quickly forgetting... Sorry I can't take it any further.   -->
    
    <!-- 
        6. This one is advanced! Write a rule to check that the lines in any sonnet have a @rhyme attribute
         Ex: <l n="0001" rhyme="a"><lb/>poetic line</l> 
         The limerick shouldn't have @rhyme attributes. HINT: think about XPath axes.
    -->
    
    <pattern>
        
        
    </pattern>
    
    
    
    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
   -->
    
    <pattern>
        
        
    </pattern>
    
   
   <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->
   
    <pattern>
        
        
    </pattern>
    
    
    
</sch:schema>