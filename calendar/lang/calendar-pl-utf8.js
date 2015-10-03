// ** I18N

// Calendar PL language
// Author: Dariusz Pietrzak, <eyck@ghost.anime.pl>
// Author: Janusz Piwowarski, <jpiw@go2.pl>
// Encoding: utf-8
// Distributed under the same terms as the calendar itself.

Calendar._DN = new Array
("Niedziela",
 "Poniedzia?ek",
 "Wtorek",
 "?roda",
 "Czwartek",
 "Pi?tek",
 "Sobota",
 "Niedziela");
Calendar._SDN = new Array
("Nie",
 "Pn",
 "Wt",
 "?r",
 "Cz",
 "Pt",
 "So",
 "Nie");
Calendar._MN = new Array
("Stycze?",
 "Luty",
 "Marzec",
 "Kwiecie?",
 "Maj",
 "Czerwiec",
 "Lipiec",
 "Sierpie?",
 "Wrzesie?",
 "Pa?dziernik",
 "Listopad",
 "Grudzie?");
Calendar._SMN = new Array
("Sty",
 "Lut",
 "Mar",
 "Kwi",
 "Maj",
 "Cze",
 "Lip",
 "Sie",
 "Wrz",
 "Pa?",
 "Lis",
 "Gru");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "O kalendarzu";

Calendar._TT["ABOUT"] =
"DHTML Date/Time Selector\n" +
"(c) dynarch.com 2002-2005 / Author: Mihai Bazon\n" + // don't translate this this ;-)
"Aby pobra? najnowsz? wersj?, odwied?: http://www.dynarch.com/projects/calendar/\n" +
"Dost?pny na licencji GNU LGPL. Zobacz szczegó?y na http://gnu.org/licenses/lgpl.html." +
"\n\n" +
"Wybór daty:\n" +
"- U?yj przycisków \xab, \xbb by wybra? rok\n" +
"- U?yj przycisków " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " by wybra? miesi?c\n" +
"- Przytrzymaj klawisz myszy nad jednym z powy?szych przycisków dla szybszego wyboru.";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"Wybór czasu:\n" +
"- Kliknij na jednym z pól czasu by zwi?kszy? jego warto??\n" +
"- lub kliknij trzymaj?c Shift by zmiejszy? jego warto??\n" +
"- lub kliknij i przeci?gnij dla szybszego wyboru.";

//Calendar._TT["TOGGLE"] = "Zmie? pierwszy dzie? tygodnia";
Calendar._TT["PREV_YEAR"] = "Poprzedni rok (przytrzymaj dla menu)";
Calendar._TT["PREV_MONTH"] = "Poprzedni miesi?c (przytrzymaj dla menu)";
Calendar._TT["GO_TODAY"] = "Id? do dzisiaj";
Calendar._TT["NEXT_MONTH"] = "Nast?pny miesi?c (przytrzymaj dla menu)";
Calendar._TT["NEXT_YEAR"] = "Nast?pny rok (przytrzymaj dla menu)";
Calendar._TT["SEL_DATE"] = "Wybierz dat?";
Calendar._TT["DRAG_TO_MOVE"] = "Przeci?gnij by przesun??";
Calendar._TT["PART_TODAY"] = " (dzisiaj)";
Calendar._TT["MON_FIRST"] = "Wy?wietl poniedzia?ek jako pierwszy";
Calendar._TT["SUN_FIRST"] = "Wy?wietl niedziel? jako pierwsz?";
Calendar._TT["CLOSE"] = "Zamknij";
Calendar._TT["TODAY"] = "Dzisiaj";
Calendar._TT["TIME_PART"] = "(Shift-)Kliknij lub przeci?gnij by zmieni? warto??";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "%e %B, %A";

Calendar._TT["WK"] = "ty";

