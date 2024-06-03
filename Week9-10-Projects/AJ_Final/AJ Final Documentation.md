# AJ Final Documentation
**About:**
- I approached encoding Emily Wormwood's diary with a focus on the diary entries basic format and topics (dates, weather, people), as well as special attention to the topic of religion. Wormwood details her experience of Christianity, both mundane routine and philosophical pondering, in late 1800s America.  I encoded this project with History, Social Science, and Religious Studies students and scholars in mind, to easily highlight sections where she mentions religious topics as well as other details of daily life.
- I use @ to indicate attributes and I omit pointy brackets where they would be in XML.
- Certain elements were chosen to more accurately convey the handwritten journal, such as style, which includes attribute @type to indicate values such as underlining that are present in the digitized scans but not the transcribed text.

**Encoding Guide:**
1. This file was associated with a Relax.ng schema for diary and journal entries. Additional rules were created using Schematron.
2. The basic tree structure is:
	- journal (root)
		- metadata
		- entries
			- page
				- descriptive, topical, and stylistic elements
			- pagebreak
3. The available elements used to mark up the document, as well as their associated attributes, are as follows:
	- elements within metadata:
		- metadata, sourceInfo, title, author (choice of name-element), publisher, and revisions (oneOrMore change elements @when).
	- elements within entries:
		- entry (with @xml:id), and oneOrMore with choice: date, page (p), and page break (pb)
	- elements within pages (p):
		- pagebreak (pb)
		- alternates (include elements like abbr, expan, sic, and corr for editorial notes) 
		- name (optional @role)
		- deletion (for lines that have been crossed out or partially erased) 
		- quote (for non-conversational quotes such as from published works. @cite for the citation information)
		- convo (for conversation and dialogue quotes. use @ref to indicate who is being spoken about, by or to.)
		- place (use @state)
		- weather
		- profession
		- margin (use @where to specify left, right, top, or bottom of page)
		- date (@when should use YYYY-MM-DD)
		- religion (use @aspect to specify one or more: meeting, scripture, theology, holiday, or calling)
		- style (for punctuation styling, such as italics, bold, underlining, diacritics, etc. use @type to specify -- might require modification to xslt.)
- 3. Transformations with XSLT
	- (again, pointy brackets are omitted)
	- basic templates with HTML span class="value" to allow for compatibility with CSS, which was used to adjust the output web formatting.
	- for quotes, the citation link was added using a href="{@cite}". I did some research and found the original author; the link is to her wikipedia. 
	- to remove the intial pb00 from the page break numbers, I used: xsl:value-of select =replace(@n, 'pb00?', 'page break  ')"/ 
	- the only CSS modifications were adding colors to margin and religion and beginning to reflect the style element with underlining. More elaborate formatting was forgone to enhance readability, function, and clarity.
	