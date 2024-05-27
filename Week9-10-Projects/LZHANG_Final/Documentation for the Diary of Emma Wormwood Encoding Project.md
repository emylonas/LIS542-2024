# Documentation for the Diary of Emma Wormwood Encoding Project

## About This Project

### Introduction
The Diary of Emma Wormwood, dating from January to February 1896, is a valuable historical document that provides insight into the daily life and social interactions of its diarist, Emma Wormwood. This project aims to digitize and encode the diary entries to ensure their preservation and accessibility for future researchers.

### Modeling Approach and Rationale
The encoding project utilizes XML (eXtensible Markup Language) with the Relax NG schema for validation, complemented by Schematron rules for additional constraints. This approach was chosen for its flexibility and wide adoption in digital humanities projects.

- **XML Encoding:** XML provides a structured format that can represent complex data hierarchies and relationships, making it ideal for encoding detailed diary entries.
- **Relax NG Schema:** The Relax NG schema is used to define the structure and allowable content of the XML document. It ensures that the encoded diary entries adhere to a predefined format.
- **Schematron Rules:** Schematron rules are employed to enforce specific constraints that are not easily expressed in the schema. These rules help ensure the consistency and quality of the encoded data.
- **XSLT Stylesheet:** An XSLT stylesheet is used to transform the XML data into HTML, making it easily viewable in web browsers.

The goal of this project is to create a digital representation of the diary that is both accurate and useful for researchers, while ensuring the data remains accessible and understandable even if the software used becomes obsolete.

## Encoding Guide

### XML Structure
The XML document is structured as follows:

- `<journal>`: The root element containing metadata and entries.
- `<metadata>`: Provides bibliographic details and revision history.
- `<sourceInfo>`: Contains the title, author, and publisher information.
- `<revisions>`: Tracks changes made to the document.
- `<entries>`: Contains multiple `<entry>` elements.
- `<entry>`: Represents a single diary entry, identified by xml:id and containing attributes for mood, weather, people, and time.
- `<p>`: Paragraph elements, each with a line attribute for easy reference.
- `<date>`: Provides the date of the entry.
- `<theme>`: Identifies significant topics or themes discussed.
- `<person>`: Enriches the text by providing details about individuals mentioned.
- `<quote>`: Captures direct speech or significant statements.
- `<note>`: Adds additional context or clarifications.

### Metadata Encoding
- **Title:** Encoded in the `<title>` element within `<sourceInfo>`.
- **Author:** Encoded using the `<name>` element within `<author>`, with a role attribute set to "diarist".
- **Publisher:** Encoded in the `<publisher>` element within `<sourceInfo>`.
- **Revisions:** Each change is recorded in the `<change>` element within `<revisions>`, with when and who attributes.

### Entry Encoding
**`<entry>` Element:**
- **Attributes:**
  - xml:id: Unique identifier for the entry.
  - complete: Indicates if the entry is complete (true or false).
  - mood: Describes the diarist's mood.
  - weather: Describes the weather conditions.
  - people: Lists people mentioned in the entry.
  - time: Indicates the time of day.

### Paragraph Encoding
**`<p>` Element:**
- **Attributes:**
  - line: Line number within the entry.

### Specialized Tags
- `<date>`: Encodes the date of the entry with a when attribute.
- `<theme>`: Encodes significant themes with a term attribute.
- `<person>`: Encodes details about individuals with name, relation, and gender attributes.
- `<quote>`: Encodes direct speech with speaker and context attributes.
- `<note>`: Encodes additional context with placement and optional possibleName attributes.

### XSLT Transformation
An XSLT stylesheet is used to transform the XML document into HTML format. This stylesheet ensures that the diary entries are presented in a readable and structured manner on the web.

**Key Features of the XSLT Stylesheet**
- **HTML Structure:** Generates a complete HTML document with head and body sections.
- **Diary Entries:** Iterates through each `<entry>` element and formats its content for display.
- **Styling:** Applies CSS classes to elements based on their content (e.g., highlight, italic).
- **Page Breaks:** Clearly indicates page breaks within the diary.

## Contribution Information
- **Contributor:** LZ
- **Date:** 2024-05-23
