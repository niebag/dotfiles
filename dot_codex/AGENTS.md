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
