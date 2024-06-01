# Wormwood Diary Final Project

This was a project to build out a simple HTML publication using [Emma Wormwood's diary] (https://archive.org/details/mms_221/page/n67/mode/1up) as the XML source file in LIS 542: Information Structures Using XML, Spring 2024, at University of Washington, taught by Prof. Elli Mylonas.

## About

Through this project I aimed to created a digital edition of the letters of Emma Wormwood using XML (eXtensible Markup Language), Relax NG for schema, Schematron for validation, XSLT to handle the transformation to HTML, and CSS for adding additional formatting. The goal was to facilitate improved access, analysis, and insights from Wormwood's life as well as 19th Century America more generally.

Through modeling elements such as names, we are able to see the family, friends, and students, Wormwood interacted with through the time she documented. Similarly quotes show us language in use. As more diary entries are encoded, we'll be able to better analyze the ebb and flow of people through her life. Weather encoding helps us track historic weather patterns and compare to current ones. Food, clothing, and places allow us to analyze the common goods and places of interest during her time. Color coding these elements makes it easier for users to quickly see and differentiate them, as well as connect them with analysis on them.

## Getting Started

These instructions will give users a way to continue the project on a local machine and provide guidance on encoding.

### Prerequisites

Requirements for the software and other tools 
- [Oxygen XML Editor Version 25.1](https://www.oxygenxml.com/xml_editor/software_archive_editor.html)
- [GitHub](https://github.com/)
- Browser of your choice. Initially built testing on [Edge](https://www.microsoft.com/en-us/edge)

### Encoding Guide

This guide provides guidance for encoding Emma Wormwood's letters using XML, with the goal of consistent and accurate markup.

Generally, aim to be true to the original text and preserve it's structure and content; be consistent in the application of tags throughout; and make sure your code is readable and able to be maintained.

Diary Content

    Entries (<entry>): The main content of the diary is divided into entries.
    Paragraphs (<p>): The diary entries are divided into paragraphs.
    Page Breaks (<pb/>): Use for indicating page breaks.

Elements

    Dates (<date>): The date at the beginning of each entry.
    Names (<name>): For all personal names.
    Places (<place>): For all place names.
    Margin Notes (<note>): For all notes that take place in the margins of the diary.
    Weather (<weather>): For all weather-related terms.
    Clothing (<clothing>): For all articles of clothing or accessories.
    Food (<food>): For all food.
    Original/Abbreviations (<original>/<abbr>): Use to indicate both original and abbreviated spellings, to allow hiding and showing either.
    Corrected/Expanded (<corr>/<expan>): Use to indicate both corrected and expanded spellings, to allow hiding and showing either.
    Quotes (<quote>): For quotations.

Attributes

    Numbers (<n>): To indicate Page Breaks in the format of PageX and paragraphs in the format of p0X.
    When (<when>): To indicate ISO compliant dates in format YYYY-MM-DD.
    Regions (<region>): For all place names include its region as: africa, americas, asia, europe, or oceania
    Type (<top-margin>): To indicate placement of margin notes.

## Testing

Use Schematron for validation. Regularly use XSLT to transform to HTML to further validate the recently encoded results are as expected.

## Built With

  - [GitHub README Templates](https://www.readme-templates.com/) - Used to find README file
    template
  - [PurpleBooth / Billie Thompson](https://github.com/PurpleBooth) - Built README Template used
  - [Oxygen XML Editor Version 25.1] 
    (https://www.oxygenxml.com/xml_editor/software_archive_editor.html)
  - [Emma Wormwood's diary] (https://archive.org/details/mms_221/page/n67/mode/1up)
  - [LIS542-2024 Templates] (https://github.com/emylonas/LIS542-2024)	

## Authors

  - [Sara Hruska](https://github.com/sarahruska)
  - [Elli Mylonas](https://github.com/emylonas) - Provided initial templates and instruction

## Acknowledgments

  - Elli Mylonas
  - Internet Archive
  - Newberry Library
