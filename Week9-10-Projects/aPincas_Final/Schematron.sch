<?xml version="1.0" encoding="UTF-8"?>

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns="http://purl.oclc.org/dsdl/schematron">    
    <ns uri="http://UW-LIS-diaries/ns/1.0" prefix="d"/>    

    <!-- BEGIN test enumerated attribute values -->
    
    <pattern>
        <rule context="d:name/@role">
            <assert test=". = ('student','acquaintance','preacher')">
                Name role is not "student," "acquaintance," or "preacher."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:weather/@precip">
            <assert test=". = ('none','rain','sleet','snow')">
                Precip attribute is not "none," "rain," "sleet," or "snow."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:weather/@temp">
            <assert test=". = ('cold','thaw','cool','warm','hot')">
                Temp attribute is not "cold," "thaw," "cool," "warm," or "hot."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:weather/@sky">
            <assert test=". = ('clear','cloudy','partial')">
                Sky attribute is not "clear," "cloudy," or "partial."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:weather/@quality">
            <assert test=". = ('pretty','gloomy')">
                Quality attribute is not "pretty" or "gloomy."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:sobriquet/@type">
            <assert test=". = ('nick','epithet','demonym','initial')">
                Precip attribute is not "nick," "epithet," "demonym," or "initial."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:quote/@type">
            <assert test=". = ('dialog','text')">
                Quote type attribute is not "dialog" or "text."
            </assert>
        </rule>        
    </pattern>
    
    <!-- END test enumerated attribute values / BEGIN test Elements cannot be empty -->
    
    <pattern>
        <rule context="d:trans">
            <assert test="string-length(normalize-space(.)) ge 1">
                Transcription is empty.
            </assert>
        </rule>         
    </pattern>
    
    <pattern>
        <rule context="d:del">
            <assert test="string-length(normalize-space(.)) ge 1">
                Deletion is empty.
            </assert>
        </rule>         
    </pattern>
    
    <pattern>
        <rule context="d:sobriquet">
            <assert test="string-length(normalize-space(.)) ge 1">
                Sobriquet is empty.
            </assert>
        </rule>         
    </pattern>
    
    <pattern>
        <rule context="d:weather">
            <assert test="string-length(normalize-space(.)) ge 1">
                Weather is empty.
            </assert>
        </rule>         
    </pattern>
    
    <pattern>
        <rule context="d:title">
            <assert test="string-length(normalize-space(.)) ge 1">
                Title is empty.
            </assert>
        </rule>         
    </pattern>
    
    <pattern>
        <rule context="d:place">
            <assert test="string-length(normalize-space(.)) ge 1">
                Place is empty.
            </assert>
        </rule>         
    </pattern>
    
    <!-- BEGIN test (certain) Elements must contain text (fyi I put one of these above because context="entry" already existed) (this is confusing me because when I have <marginal><del></del></marginal> it complains that both <del> and <marginal> are empty, but when I add text within <del>, both conditions are satisfied, even though the added text is a child of <del> and only a descendant of <marginal> - IS THIS SOMETHING LIKE I NEED TO DO ONE OF THOSE THINGS LIKE: <assert test="*[self::d:...something...?]"> ?? -->
    
    <pattern>
        <rule context="d:marginal">
            <assert test="string-length(.) ge 1">
                Marginal element is empty.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="d:author">
            <assert test="string-length(.) ge 1"> 
                Author element is empty.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="d:name">
            <assert test="string-length(.) ge 1">
                Name element is empty.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="d:p">
            <assert test="string-length(.) ge 1">
                P element is empty.
            </assert>
        </rule>
    </pattern> 
    
    <pattern>
        <rule context="d:info">
            <assert test="string-length(.) ge 1">
                Info element is empty.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="d:quote">
            <assert test="string-length(.) ge 1">
                Quote element is empty.
            </assert>
        </rule>
    </pattern>
    
    <!-- END test Elements cannot be empty / BEGIN test (certain) attributes must begin with "(something)" CAN I CHECK THAT THE SECOND CHARACTER IS A NUMBER? -->
    
    <pattern>
        <rule context="d:pb/@n">
            <assert test="starts-with(.,'p')">
                Page break number attribute does not begin with "p."
            </assert>
            <assert test="string-length(.) ge 3">
                Page break number attribute is not at least 3 characters long.
            </assert>
        </rule>        
    </pattern>    
    
    <pattern>
        <rule context="d:cite/@source">
            <assert test="starts-with(.,'http')">
                Cite source attribute does not begin with "http."
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:info/@source">
            <assert test="starts-with(.,'http')">
                Info source attribute does not begin with "http."
            </assert>
        </rule>        
    </pattern>
       
    <!-- END test <cite> and <info> "source" attributes must begin with "http" / BEGIN test non-complicated random patterns -->    
  
    <pattern>
        <rule context="d:entry">
            <assert test="d:date">
                Entry does not contain a date element.
            </assert>
            <assert test="@xml:id">
                Entry does not contain an xml:id attribute.
            </assert>
            <assert test="string-length(.) ge 1">
                Entry element is empty.
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="d:quote[@type = 'dialog']">
            <report test="d:cite">
                Dialog has "cite" element as a child.
            </report>            
        </rule>
    </pattern> 
    
    <!-- END test non-complicated random patterns / BEGIN test (certain) attributes are not empty --> 
    
    <pattern>
        <rule context="d:trans/@who">
            <assert test=". != ''">
                Transcription "who" attribute is empty.
            </assert>
        </rule>        
    </pattern>
    
    <pattern>
        <rule context="d:revisions/d:change/@who">
            <assert test=". != ''">
                Revision change "who" attribute is empty.
            </assert>
        </rule>        
    </pattern>
    
    <!-- END test (certain) Attributes are not empty -->     
           
  
    
</sch:schema>