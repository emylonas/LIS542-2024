This readme file was generated on 2024-06-02 by JMartinez

GENERAL INFORMATION

Title of Project: Emma Wormwood Diaries 

Creator Information
Name: Javier Martinez Rodriguez
Institution: University of Washington 
Email: jjmr92@uw.edu

DATA & FILE OVERVIEW

File List:
README.txt
Wormwood.xml
diaries.rng
WWschematron.sch
diary-to-HTML.xsl
diaries.css

ABOUT

This project is a digital publication of pages 3-10 of Emma Wormwood's diary, written in 1896. She was a school teacher in Illinois. The digitized pages and crowdsourced transcription may be found here:  https://archive.org/details/mms_221/page/n67/mode/1up. To carry out this project, a markup model was applied to the journal transcriptions using XML language that was then transformed into HTML using an XSL file. Files are validated using two validation schemas: a .RNG and a .SCH file. All files can be found as part of this folder.

ENCODING USING THIS FILE 

The encoding model for this project aims to be intuitive. These are the best practices for encoding these diary entries.

1. Use <pb> to indicate a page break in the original object. Each page break must include a page code in @n. The value of @n must begin with the word 'page' and followed by at least two digits. 

2. Use <date> for any dates in the document whether inside or outside of <p>. Every instance of <date> must include @when which requires the indicated date in ISO format. The diary was written in 1896 so this is the implied year for all entries.

3. All <p> must contain @id. The value of @id begins with 'p' and includes at least 2 digits.

4. All weather descriptions must be encoded using <weather>. This element requires an attribute, @when, so the time of the day that the weather is being reported can be specified. The available terms for the value of @when are: morning, afternoon, evening, day (for an entire day).

5. Use <quote> anytime quotation marks are used. This element allows for @type to be specified but it is not required.

6. The <name> element is intended to be used for names of people mentioned in the text. This element accepts @type if, for example, a nickname is used. This attribute is not required.

7. <alternates> must be used for any abbreviations or corrections. Abbreviations must be encoded using <abbr> and are immediately followed by a sibling <expan> with the complete form of the abbreviated word. Corrections must be encoded using <sic> and followed by the correct form of the word using <corr>.

8. <act> is intended to be used for school activities.

9. <place> should be used for all mentions of places. Places can be further specified by using <city>, <state>, or <country>.

10. <marginNote> is used for all margin notes in the original object. The position of the margin note in the page must be specified using @position. This attribute accepts the values 'upper', 'lower', 'right', or 'left'.       