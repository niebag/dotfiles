## LLM-Wiki

Kenniskluis parent:
~/Library/Mobile Documents/iCloud~md~obsidian/Documents/

Drie losse vaults, elk een eigen root en eigen CLAUDE.md:
- Notive/   — Notive-werkcontext
- Resolph/  — Resolph-werkcontext
- Personal/ — persoonlijke context

Elke vault is volledig geïsoleerd: geen cross-vault links, geen gedeelde data.

Bij het openen van een vault:
1. Lees ALTIJD eerst de CLAUDE.md in de vault-root van díe vault.
2. Beperk je strikt tot die vault. Ken de andere vaults niet.

Detecteer de actieve vault op basis van werkdirectory of gespreksonderwerp.
Fallback: vraag welke vault.

## Proactieve kennisopslag

Beoordeel tijdens en aan het einde van elk inhoudelijk gesprek of er duurzame
kennis voor de actieve vault is ontstaan, bijvoorbeeld besluiten, technische
inzichten, werkafspraken, oplossingspaden, onderzoek, of belangrijke
concepten.

Als de actieve vault duidelijk is en de inhoud waardevol genoeg is:
1. Gebruik direct de `ingest`-skill met een beknopte, feitelijke samenvatting
   van de relevante recente conversatie als bron.
2. Bewaar alleen duurzame kennis; sla losse vragen, tijdelijke statusupdates,
   herhaling en persoonlijke details zonder blijvende waarde over.
3. Meld na afloop kort welke wiki-pagina's zijn gemaakt of bijgewerkt.

Als de vault niet duidelijk is of de inhoud mogelijk privé of cross-vault is,
stel eerst één gerichte vraag. Sla nooit cross-vault inhoud op.

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
