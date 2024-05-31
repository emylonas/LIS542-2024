# Encoding Diaries and Journals

## About
This documentation describes the process and workflow used to encode diaries and journals using the UW LIS Diaries schema. The workflow utilizes XML, RelaxNG, Schematron, and XSLT to produce HTML versions of diary entries with accompanying CSS. 

This approach highlights the names, dates, places, and numbers that are present in diary entries in an attempt to make digital versions of these texts more easily searchable.

### Files
- diaries.rng
- diaries.sch
- diary-to-html.xsl
- diary.css


## Encoding Guide

Encoding is done in XML using the UW LIS Diaries schema. The document consists of a `<journal>` element which encases a `<metadata>` element, an `<entries>` element and a `<authorityList>` element. The basic structure of the document is as follows: 

```xml=
<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="diaries.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="diaries.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>

<journal xmlns="http://UW-LIS-diaries/ns/1.0">
    <metadata>
    </metadata>
    <entries>
        <entry></entry>
    </entries>
    <authorityList>
    </authorityList>
</journal>
```

### The Metadata

The metadata element must include: 
* A `<sourceInfo>` element containing 
   * `<title>` - the title of the text (e.g. "Emma Wormwood Diaries")
   * `<author>` - the author of the text (e.g. "Emma Wormwood")
   * `<publisher>` - optionally, the publisher of the text

* A `<revisions>` element, which may contain `<change>` elements as needed. 
   * `<change>` elements are used to indicate that a file has been updated, and should include a `@when` attribute with the date of the change and a `@who` attribute with the initials of the person who made these changes. Any `<change>` element should also include a brief description of the changes made to the document. 

### The Entries
The `<entries>` element consists of `<entry>` elements and page break elements (`<pb>`).

#### Page breaks
Page breaks, seen as `<pb>` elements, are empty elements with the attribute `@n`. These elements are used to indicate a new page, and may be used within the `<entry>` or `<p>` levels. 

The `@n` attribute indicates the page number and is in the format "pageXX". Page numbers must begin with "page01" and should appear in order. 

#### `<entry>` elements and children
`<entry>` elements surround the text of the journal or diary. Within the entry, the following elements are used: 
* `<date>` - used for dated journal or diary entries, with an `@when` attribute where the date should appear in ISO date format
* `<p>` - used to indicate paragraphs. `<p>` may include `<pb>` and the descriptive elements below. 
* `<marginalia>` - see the description below.
#### Descriptive elements
The following elements are used to encode and highlight specific aspects of the text. 

* `<alternates>` - used to indicate spelling differences (with `<sic>` and `<corr>`) or abbreviations (with `<abbr>` and `<expan>`)
* `<name>` - used to identify a name within the text. Each name must have an `@xml:id` which matches the `@xml:id` of a `<nameAuthority>` within the `<authorityList>` (see The Authority List section below). 
* `<marginalia>` - used to indicate any marginalia or text outside of the standard paragraphs. This element can appear within `<entry>` or `<p>` elements. This element may include any other descriptive elements, along with a `<note>` with any additional information. 

* `<place>` - used to identify a place. 
* `<number>` - used to identify a number. Numbers must have a `@value` attribute with the numeric value of the number represented.`@type` is optional, but may only be "quantity", "time", or "age". 

### The Authority List
Names are an important aspect that are highlighted within this schema, using an `<authorityList>` with `<nameAuthority>` elements. 

Each `<nameAuthority>` must have a unique `@xml:id` and a `<standard>` child element containing a standard version of the name. Additional `<alternate>` elements are used to record other versions of this person's name as they appear within the text. 
