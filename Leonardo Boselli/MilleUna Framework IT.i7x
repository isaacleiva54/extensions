Version 1/140813 of MilleUna Framework IT by Leonardo Boselli begins here.

Part I - Main Settings

Chapter 1 - Includes

Include Basic Help IT by Leonardo Boselli.
Include Tutorial Mode Hyperlinks IT by Leonardo Boselli.
Include Creative Commons Public License IT by Leonardo Boselli.
Include Hyperlink Interface IT by Leonardo Boselli.
Include Written Inventory IT by Leonardo Boselli.
Include Command Line IT by Leonardo Boselli.
Include Automap IT by Leonardo Boselli.
Include Bulk Limiter IT by Leonardo Boselli.
Include Suggested Actions IT by Leonardo Boselli.
Include Conversation Package IT by Leonardo Boselli.

Chapter 2 - Highlighting

First when play begins:
	now topic hyperlink highlighting is true;

Chapter 3 - Title & Help

Table of Basic Help Options (continued)
title	subtable	description 
"[bold type]Collegamenti ipertestuali[fixed letter spacing]"	--	"[show-interf-message]"
"Per contattare l[']autore"	--	"[ask-for-help]"
"Ringraziamenti"	--	"[ringraziamenti]"

To say show-interf-message:
	 follow the Hyperlink Interface showing the hyperlink introduction text rule.

To say author's email: say "indisponibile".
To say ask-for-help:
	say "[paragraph break]Hai bisogno di aiuto?[line break]Il mio indirizzo è [bold type][author's email][roman type]".

To say ringraziamenti:
	say "[paragraph break]Si ringraziano:[paragraph break][ringrazia-news][ringrazia-gente]";
	
To say ringrazia-news:
	say "Il newsgroup italiano [bold type]it.comp.giochi.avventure.testuali[roman type]".

To say ringrazia-gente:
	say "[line break][bold type]Massimo Stella[roman type] per l[']estensione 'Italian language'[line break][bold type]Leonardo Boselli[roman type] per l[']estensione 'MilleUna Framework'[line break][bold type]Graham Nelson[roman type] per lo sviluppo di Inform7[line break][bold type]Mark Tilford[roman type] per varie estensioni[line break][bold type]Aaron Reed[roman type] per varie estensioni[line break][bold type]Emily Short[roman type] per varie estensioni[line break][bold type]Jon Ingold[roman type] per varie estensioni[line break][bold type]Eric Eve[roman type] per varie estensioni"

Chapter 4 - Status Line

Understand the command "uscite" as something new.

Include Exit Lister IT by Leonardo Boselli.

Table of Beginning Status
left	central	right 
""	"'[story title]'"	"" 
""	"di [story author]"	"" 

Table of No Exits Status
left		central				right 
" [if map region of the location is not nothing][map region of the location] - [end if][location]"	"| Punti: [score]/[maximum score]"	"| Passi: [turn count] | Stanze: [number of visited rooms]/[number of rooms]" 

Table of Exits Status
left	central				right 
" Punti: [score]/[maximum score]"	"| Passi: [turn count]"	"| Stanze: [number of visited rooms]/[number of rooms]" 
" [if map region of the location is not nothing][map region of the location] - [end if][if in darkness]nell[']oscurità[otherwise][location][end if]"	""	"| [exit list]" 

Instead of going nowhere:
	say "Non puoi andare in quella direzione.";
	list the exits.

First when play begins:
	now standard status table is Table of No Exits Status;
	now status exit table is Table of Beginning Status;
	now right alignment depth is 30.

Section W (for use with Release for Quixe by Leonardo Boselli)

Rule for constructing the status line (this is the automap exits status line rule):
	if exit listing is enabled:
		fill status bar with status exit table and map;
	otherwise:
		fill status bar with the standard status table and map;
	rule succeeds.

Section G (for use with Release for Gargoyle by Leonardo Boselli)

Rule for constructing the status line (this is the automap exits status line rule):
	if exit listing is enabled:
		fill status bar with status exit table and map;
	otherwise:
		fill status bar with the standard status table and map;
	[follow the window-drawing rules for the side-window;]
	rule succeeds.

Chapter 5 - The Map

The automap standard status line rule is not listed in any rulebook.
The exit lister status line rule is not listed in any rulebook.

[
Use automap hyperlinks.

Current autowalk destination is a room that varies.  Autowalk destination set is a truth state that varies.
	
Autowalking is an action applying to one topic.  Understand "vai al punto della mappa" as autowalking.
			
Carry out autowalking:
	if autowalk destination set is true begin;
		now autowalk destination set is false;
		try hyperlink moving to room current autowalk destination;
		follow the window-drawing rules for the command-window;
	otherwise;
		say "(Questo comando viene generato dalla mappa, altrimenti non è attivo)[line break]";
	end if.

A clicking hyperlink rule (this is the default map hyperlinks rule):  
	if (current hyperlink ID minus 10000) codes a glulx object:
		now current autowalk destination is glulx equivalent of (current hyperlink ID minus 10000);
		now autowalk destination set is true;
		now glulx replacement command is "vai al punto della mappa";
		rule succeeds;
	otherwise:
		continue the action.
]

Chapter 6 - The Score

Use scoring.

[workaround per evitare un errore con il sistema standard di notifica punteggi]
When play begins:
	silently try switching score notification off.
	
To award (pts - a number):
	increase the score by pts;
	say "[bracket]Il tuo punteggio è [if pts >= 0]aumentato di [pts][otherwise]diminuito [0 minus pts][end if] punti[close bracket][paragraph break]".

Part II - Multimedia

Chapter 1 - Pictures

Use full-length room descriptions.

[
A room has a figure-name called room-illustration.

The figure of icon is a figure-name that varies.
	
The image-setting rule is listed first in the carry out looking rules. 

This is the image-setting rule:
	show-bottom the room-illustration of the location.
]

Chapter 2 - Windows

Section W (for use with Release for Quixe by Leonardo Boselli)

[
To show-bottom (figure - a figure-name):
	say "$<callbrowser( 'T [figure]' );>$";

To show-side (figure - a figure-name):
	say "$<callbrowser( 'L [figure]' );>$";

First when play begins:
	say "$<playsound( 'soundtrack' );>$";
]

Section G (for use with Release for Gargoyle by Leonardo Boselli)

[
The main-window has back-colour g-light-grey;

The bottom-window is a g-window spawned by the main-window.
The type is g-graphics. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 150. The back-colour is g-silver.
The current bottom-window figure is a figure-name that varies.
A window-drawing rule for the bottom-window:
	if bottom-window is g-unpresent, rule fails;
	move focus to bottom-window, clearing the window;
	draw the current bottom-window figure in bottom-window with width 600 and height 150;
	return to main screen.

The corner-window is a g-window spawned by the bottom-window.
The type is g-graphics. The position is g-placeleft. The scale method is g-fixed-size. The measurement is 150. The back-colour is g-silver.
The current corner-window figure is a figure-name that varies.
A window-drawing rule for the corner-window:
	if corner-window is g-unpresent, rule fails;
	move focus to corner-window, clearing the window;
	draw the figure of icon in corner-window with width 150 and height 150;
	return to main screen.

The side-window is a g-window spawned by the main-window.
The type is g-graphics. The position is g-placeleft. The scale method is g-fixed-size. The measurement is 150. The back-colour is g-silver.
The current side-window figure is a figure-name that varies.
A window-drawing rule for the side-window:
	if side-window is g-unpresent, rule fails;
	move focus to side-window, clearing the window;
	draw the current side-window figure in side-window with width 150 and height 300;
	return to main screen.

To show-bottom (figure - a figure-name):
	now the current bottom-window figure is the figure;
	follow the window-drawing rules for the bottom-window.

To show-side (figure - a figure-name):
	now the current side-window figure is the figure;
	follow the window-drawing rules for the side-window.

To draw the (f - a figure-name) in (g - a g-window) with width (w - a number) and height (h - a number):
	(- glk_image_draw_scaled({g}.ref_number, ResourceIDsOfFigures-->{f}, 0, WindowSize({g}, 1)-{h}, {w}, {h}); -) .

When play begins:
	open up the bottom-window;
	open up the corner-window;
	open up the side-window;
	follow the window-drawing rules for the corner-window.

First when play begins:
		play sound of colonna sonora.
]

Part III - Conversation

Chapter 1 - Discussions

A thing can be discussable or speakable or unspeakable. A thing is usually unspeakable.

Instead of examining a speakable thing (called the argument) when the current interlocutor is a person:
	if the argument is listed in the ask-suggestions of the node of the current interlocutor:
		try quizzing the current interlocutor about the argument;
	otherwise if the argument is listed in the tell-suggestions of the node of the current interlocutor:
		try informing the current interlocutor about the argument;
	otherwise:
		continue the action.

Instead of examining a discussable thing (called the argument):
	if the current interlocutor is a person:
		if the argument is listed in the ask-suggestions of the node of the current interlocutor:
			try quizzing the current interlocutor about the argument;
		otherwise if the argument is listed in the tell-suggestions of the node of the current interlocutor:
			try informing the current interlocutor about the argument;
		otherwise:
			say "[arg-discusso argument]";
	otherwise:
		say "[arg-discusso argument]".

To say arg-discusso (argument - a discussable thing):
	say "Hai già parlato [dip the argument].[list-topics]"

To say list-topics:
	try silently listing suggested topics.

To say nothing specific:
   say "Non hai nient[']altro in mente da discutere [conp the current interlocutor]. Puoi congedarti con un [t]addio[x]."

To say parla:
	say "[one of]sta conversando[or]sta parlando[or]sta discutendo[or]sta chiacchierando[or]parla[or]conversa[or]discute[or]chiacchiera[at random]".

To say cita-salve:
	say "Se vuoi [one of]parlargli[or]discutere con lui[or]chiedergli qualcosa[or]interpellarlo[or]parlare con lui[or]domandargli qualcosa[at random], [one of]salutalo[or]prova prima a salutarlo[or]attira l[']attenzione[or]presentati[at random] con un [t]salve[x]".

Check hailing (this is the new check what's being hailed rule):
	if the current interlocutor is a visible person:
		if the current interlocutor is the nearest-person:
			say "Stai già  parlando [conp the current interlocutor]." instead;
		otherwise:
			now the farewell type is implicit;
			try silently leavetaking;
			now the farewell type is explicit;
	now the noun is the nearest-person;
	if the nearest-person is not a person,
		now the noun is a random visible person who is not the player;
	if the noun is a person:
		say "(rivolgendoti [ap the noun])";
	otherwise:
		say "Qui ci sei solo tu." instead.

The check what's being hailed rule is not listed in any rulebook.


Chapter END

MilleUna Framework IT ends here.

---- Documentation ----

Questo framework contiene tutto quanto è necessario per creare narrativa interattiva standard. Prova l'esempio che segue per avere maggiori dettagli.

	*: "Titolo" by Autore (in Italian)

	Part I - Impostazioni

	Chapter 1 - Pubblicazione

	Include Release for Quixe by Leonardo Boselli.

	Release along with cover art, a file of "Introduzione alle Avventure Testuali" called "Introduzione alle Avventure Testuali.pdf", a "MilleUna" website and a "MilleUna" interpreter.

	Chapter 2 - Includes

	Include Milleuna Framework IT by Leonardo Boselli.

	Chapter 2 - Titolo

	The story headline is "Sottotitolo".
	The story genre is "Genere".
	The release number is 1.
	The story description is "La storia in breve...".
	The story creation year is 2014.

	To say author's email: say "nome.cognome@email.it".

	Chapter 4 - Title & Help

	To say quotation:
		say "[italic type]Una breve citazione...[roman type] - Autore".

	Chapter 5 - Il punteggio

	The maximum score is 100.

	Chapter 6 - Azioni suggerite aggiuntive

	[
	Carry out suggesting actions for a thing (called the O):
		if the O is worn by the player:
			now txt is "togliti";
			say "[suggest single-action txt on O]";
		otherwise if the O is wearable:
			now txt is "indossa";
			say "[suggest single-action txt on O]";
		say "[run paragraph on]".
	]

	Part II - L'avventura

	Chapter 1 - Geografia

	Section 1a - Il tutorial

	example-thing è il mestolo.
	example-worn sono gli occhiali.
	example-talker è la cuoca.
	example-argument è il semolino.
	example-contained è il pollo.
	example-container è la pentola.

Section 1b - Il mondo

	La cucina è una stanza. La description è "Un[']ampia cucina. A [d]nord[x] [regarding nothing][ci sei] il salotto."
	Il salotto è una stanza. La description è "Un elegante salotto. A [d]sud[x] [regarding nothing][ci sei] la cucina."
	Il salotto è a nord della cucina.
	La cuoca è una donna dentro la cucina. La description è "Un[']abile [cuoca] intenta a cucinare[if the current interlocutor is not the cuoca]. Se vuoi parlarle, di[']: '[t]cuoca, buongiorno[x]'[end if]."
	Il tavolo è un supporto dentro la cucina.
	Il mestolo è una cosa sopra il tavolo. Il bulk è 2.
	La pentola è un contenitore aperto chiudibile sopra il tavolo. La bulk capacity è 10.
	Il pollo è una cosa commestibile dentro la pentola. Il bulk è 8. La description è "Un [pollo] appetitoso."
	La poltrona è un supporto accessibile dentro il salotto.
	L' attaccapanni è un supporto dentro il salotto.
	Il cappello, la sciarpa sono una cosa indossabile sopra l' attaccapanni.
	Il tavolino è un supporto dentro il salotto.
	La tabacchiera è un contenitore sopra il tavolino.
	Il tabacco è una cosa dentro la tabacchiera. The indefinite article of tabacco is "del".
	Gli occhiali sono una cosa indossabile.
	Il player indossa gli occhiali.

	Chapter 2 - Introduzione

	When play begins:
		say "Un testo introduttivo...";
		now status exit table is Table of Exits Status;
		now current zoom is map absent;

	Chapter 3 - NPC

	cuoca-node is a closed convnode.
	The node of the cuoca is cuoca-node.

	The semolino is a discussable.
	The semolino is part of the cuoca.

	The pollo_arrosto is a discussable.
	The pollo_arrosto is part of the cuoca.

	After saying hello to the cuoca when the greeting type is explicit:
		say "'Buongiorno' esordisci.[paragraph break]La cuoca ti osserva e ti chiede: 'Lei sembra affamato. Cosa vuole mangiare?'[add semolino ask suggestion][add pollo_arrosto ask suggestion]".

	After saying hello to the cuoca when the greeting type is implicit:
		say "La cuoca si accorge di te.[add semolino ask suggestion][add pollo_arrosto ask suggestion]".

	After saying goodbye to the cuoca when the farewell type is explicit:
		say "'Addio!' concludi.[paragraph break]'Addio' ti risponde e torna a cucinare."

	After saying goodbye to the cuoca when the farewell type is implicit:
		say "La cuoca ti saluta e torna a cucinare."

	Default Response of cuoca-node:
		say "'Ha qualcosa di cui parlare o da chiedere? Altrimenti torno a cucinare' dice la cuoca con impazienza.[list-topics][run paragraph on]".

	Response of cuoca-node when asked about the semolino:
		say "'Vorrei del semolino, grazie' chiedi con gentilezza.[paragraph break]'Vuole mangiare del semolino di prima mattina? De gustibus!' replica stupita.[paragraph break][remove semolino ask suggestion][list-topics][run paragraph on]".

	Response of cuoca-node when asked about the pollo_arrosto:
		say "'Vorrei del [pollo], grazie' chiedi affamato.[paragraph break]'[if the pollo is in the pentola]Il pollo è nella [pentola]. Si serva[otherwise if the player carries the pollo]Ce l[']ha in mano. Si serva[otherwise if the pollo is offstage]Il pollo era nella [pentola], ma ora non ne so più nulla[otherwise]Il pollo è [inp the location of the pollo]. Se lo cerchi[end if]'.[paragraph break][remove pollo_arrosto ask suggestion][list-topics][run paragraph on]".
