## LLM-Wiki

De enige wiki-vault staat in `~/Obsidian/llm-wiki`.

Lees bij wiki-werk altijd eerst `~/Obsidian/llm-wiki/AGENTS.md` en werk uitsluitend
binnen die vault.

## Proactieve kennisopslag

Beoordeel tijdens en aan het einde van elk inhoudelijk gesprek of er duurzame
kennis voor deze wiki is ontstaan, bijvoorbeeld besluiten, technische
inzichten, werkafspraken, oplossingspaden, onderzoek, of belangrijke
concepten.

Als de inhoud waardevol genoeg is:
1. Gebruik direct de `ingest`-skill met een beknopte, feitelijke samenvatting
   van de relevante recente conversatie als bron.
2. Bewaar alleen duurzame kennis; sla losse vragen, tijdelijke statusupdates,
   herhaling en persoonlijke details zonder blijvende waarde over.
3. Meld na afloop kort welke wiki-pagina's zijn gemaakt of bijgewerkt.

Als de plaatsing in de wiki onduidelijk is of de inhoud buiten scope kan vallen,
stel eerst één gerichte vraag.

Doe dit proactief; wacht niet tot de gebruiker `/ingest` noemt.
Verwerk een gesprek maximaal één keer, tenzij er daarna wezenlijk nieuwe
duurzame kennis ontstaat.

## Humanize externe output

Gebruik altijd de humanize skill voordat je tekst afrondt die de gebruiker naar
anderen stuurt, publiceert of als werkproduct oplevert. Dit geldt onder andere
voor berichten, e-mails, Slack-berichten, tickets, MR-comments, voorstellen,
rapportages, documentatie, PRD's en andere documenten.

- Gebruik rewrite-modus zonder om bevestiging te vragen en zonder te vermelden
  dat de tekst is gehumanized.
- Behoud feiten, cijfers, citaten, bronnen, code en bewust gekozen formaliteit.
- Pas humanize alleen toe op het proza, niet op code, tabellen met data,
  commando-output of letterlijke citaten.
- Gebruik humanize nooit voor de conversationele chatoutput van de agent:
  antwoorden, uitleg, statusupdates en interne analyse.
- Staat een extern bericht of werkproduct in een chatantwoord, humanize dan
  alleen de zelfstandige tekst die de gebruiker gaat kopiëren, versturen,
  publiceren of opleveren; niet de begeleidende chattekst.
- Actieve stijl-modi zoals caveman gelden alleen voor de conversationele
  chatoutput van de agent, nooit voor externe werkproducten. Stel zulke
  werkproducten altijd op in normaal register, ook als een modus als caveman
  voor de sessie actief staat, en pas daarna pas humanize toe.
