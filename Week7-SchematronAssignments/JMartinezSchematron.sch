<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">
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
            <assert test="tei:lb">There must be an lb element inside an l element</assert>
            <assert test="following-sibling::*[tei:lb]"> the l element must be followed by lb</assert>
        </rule>
    </pattern>

    <!-- 
        2. Write a rule to flag the @n attribute on <div> if its value doesn't begin with the string "poem." 
        In your example, the first poem is correct, but the second one is not.  
        -->

    <pattern>
        <rule context="tei:div">
            <assert test="starts-with(@n, 'poem')">Attributes of the n element must start with
                'poem'</assert>
        </rule>
    </pattern>

    <!-- 
        3. Write a rule to flag line numbers that are not contain 3 digits. 
        That is, n="0001" is correct. n="1" or n="02" are wrong 
    -->

    <pattern>
        <rule context="tei:l/@n">
            <assert test="string-length() = 4">Line numbers must contain 4 digits</assert>
        </rule>
    </pattern>

    <!-- 
        4. Write a rule to flag when a <change> element in <RevisionDesc> has no content.
        HInt: One way to figure out if there is any text content in an element is to measure the length of the content. 
     -->

    <pattern>
        <rule context="tei:revisionDesc/tei:change">
            <assert test="string-length() != 0">change element within revisionDesc must have
                content</assert>
        </rule>
    </pattern>

    <!-- 
        5. Write a rule that checks if the @type attribute on the <div> element has one of the two values "sonnet" or "limerick."
    -->

    <pattern>
        <rule context="tei:div/@type">
            <assert test="matches(.,'sonnet') or matches(.,'limerick')">This type attribute does not have the value 'sonnet'
                or 'limerick'</assert>
        </rule>
    </pattern>

    <!-- 
        6. This one is advanced! Write a rule to check that the lines in any sonnet have a @rhyme attribute
         Ex: <l n="0001" rhyme="a"><lb/>poetic line</l> 
         The limerick shouldn't have @rhyme attributes. HINT: think about XPath axes.
         
         I cannot get this rule to work properly. I do not understand axes, I read all the different guides and even looked for some on my own, it does not make sense to me. I do not understand the difference between the axes and using XPath notation. Any guidance is appreciated.
    -->

    <pattern>
        <rule context="attribute::*[@type = 'sonnet']/tei:l">
            <assert test="@rhyme">The l element must contain a rhyme attribute</assert>
        </rule>
    </pattern>



    <!-- 
      7. This one is also advanced! Write a rule to check that each line in a poem is immediately followed by an lb element 
      You can add a second rule inside pattern 1 above, which checks that there is an <lb> inside each <l>element. 
      
    I cannot get this rule to work properly either, same problem with axes. 
    -->

    <pattern> 
    </pattern>


    <!-- 
       8. If you are enjoying this so far, think of something else that you might want to check using Schematron. Try to write the rule.
   -->

    <pattern> </pattern>



</sch:schema>
