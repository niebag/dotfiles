# LLM-Wiki — Notive

Je beheert uitsluitend de **Notive-vault**. De vault-root is:
`~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notive/`

**Harde context-grens**: deze vault bestaat volledig geïsoleerd. Je kent de
Resolph- en Personal-vaults niet, verwijst er nooit naar, en deelt er geen
data mee. Geen cross-vault links.

---

## Drie lagen

| Laag | Map | Eigenaar |
|------|-----|----------|
| 1 — Bronnen | `raw/` | Alleen de mens — agent leest, schrijft er nooit in |
| 2 — Wiki | `wiki/` | Alleen de agent — agent schrijft, mens leest |
| 3 — Schema | `CLAUDE.md` | Dit bestand |

`raw/` is het archief. Lees er uit als bron. Twee uitzonderingen:
(1) de agent verplaatst bronnen van `inbox/` naar `ingested/` na ingest;
(2) de agent maakt gespreksbronbestanden aan in `raw/ingested/` bij autonoom
write-back. Verwijder of wijzig nooit iets anders.

---

## raw/ — submappen

- `raw/inbox/` — enige ingang. Alle onverwerkte bronnen (markdown én PDFs). Web Clipper schrijft hier.
- `raw/ingested/` — bronnen die de ingest-operatie hebben doorlopen (markdown én PDFs).
- `raw/assets/` — alle afbeeldingen, ongeacht status. Verhuizen nooit.

"Al verwerkt?" staat afleesbaar in de mapstructuur: `inbox/` = onverwerkt,
`ingested/` = verwerkt. Het brontype (transcript, artikel, etc.) wordt NIET
in de mapnaam vastgelegd; de agent leidt het waar nodig af uit de inhoud.

**Markdown met afbeeldingen**: een LLM leest markdown met inline-afbeeldingen
niet in één keer. Verwerk eerst de tekst; bekijk daarna de relevante afbeeldingen
uit `raw/assets/` apart.

---

## wiki/ — regels

- **Platte structuur.** Geen PARA, geen status-mappen.
- **Navigatie** via `index.md` en `[[wikilinks]]`, niet via de mappenboom.
- **Emergente groepen** — maak een submap pas aan bij ~3 pagina's of meer;
  één of twee pagina's staan los in `wiki/`:
  - `people/` — personen (gebruik uitsluitend deze naam, geen `contacts/`)
  - `concepts/` — begrippen en concepten
  - `projects/` — projecten
- **Personen zijn vault-specifiek.** `people/Niels.md` hier beschrijft Niels
  in de Notive-context (rol, samenwerking, projecten). Dit is een andere pagina
  dan Niels in een andere vault. Nooit dedupliceren, nooit cross-vault linken.

---

## Bron-linking

`source:` in de frontmatter is machine-leesbaar maar geeft geen Obsidian
graph-edge. De zichtbare, klikbare herleidbaarheid loopt via de **body** van
de wiki-pagina. Bronnen in raw/ zijn los en "dom" — ze linken nooit naar elkaar.
Verbanden tussen bronnen zijn interpretatie en horen op een wiki-pagina.

### Geval 1 — Markdown-bron

Transcript, clip, inbox-note of ander `.md`-bestand: zet een directe
`[[wikilink]]` naar de bron in de body van de wiki-pagina. Geen stub nodig.

### Geval 2 — Niet-markdown bron

PDF, afbeelding als zelfstandige bron, data-dump: maak automatisch een stub
aan in `wiki/sources/<naam>.md` en link de wiki-pagina naar de stub (niet naar
het raw-bestand zelf).

Stub-formaat:

```yaml
---
type: source
file: ../../raw/<submap>/<bestandsnaam>
ingested: <YYYY-MM-DD>
---
Bron: <korte omschrijving> (<bestandstype>).

![[<bestandsnaam>]]
```

`file:` is het relatieve pad van de stub naar het raw-bestand (machine).
`![[...]]` embedt het bestand op naam in Obsidian.

### Asset als onderdeel van een markdown-bron

Een afbeelding die bij een geclipt artikel hoort krijgt **geen eigen stub** —
de `![[afbeelding]]` staat al in de markdown-bron. Beslisregel: "kan ik de
asset begrijpen zonder de bijbehorende markdown?" Nee → onderdeel, geen stub.
Ja → zelfstandige bron, wel een stub.

### Meerdere bronnen over hetzelfde onderwerp

Bronnen linken **nooit naar elkaar** — ook stubs niet onderling. Elke bron
wordt los gelinkt (direct of via stub). Een wiki-pagina linkt naar alle
betrokken bronnen en legt het verband mét context.

`wiki/sources/` is een **vaste systeemmap**. De 3-pagina-drempel voor emergente
groepen geldt hier niet.

---

## Frontmatter-standaard

```yaml
---
title: <titel>
type: <person|concept|project|note>
created: <YYYY-MM-DD>
updated: <YYYY-MM-DD>
tags: []
source: <relatief pad naar raw/-bestand, of leeg>
---
<één samenvattingsregel>
```

---

## index.md

- Lees dit **altijd als eerste** bij een query of ingest.
- Catalogus per categorie, één regel per pagina:
  `- [[paginanaam]] — korte omschrijving`
- Agent werkt het bij na elke ingest of nieuwe pagina.

---

## log.md

- Chronologisch, append-only. Nooit overschrijven of bewerken.
- Elke entry: `## [YYYY-MM-DD] <operatie> | <titel>`
  - Voorbeelden:
    - `## [2026-06-23] ingest | Artikel over pricing strategy`
    - `## [2026-06-23] writeback | Beslissing over deploymentstrategie`
- Zoeken: `grep "^## \[" log.md | tail -5`

---

## Autonoom write-back (standaardgedrag)

Schrijf **uit jezelf** naar de wiki weg bij:
- Een **genomen beslissing** — iets wat vaststaat en richting geeft
- Een **opgelost probleem** — inclusief hoe het is opgelost
- Een **learning** — iets wat over een maand nog relevant is

Schrijf **niet** weg bij: tussenstappen, denkstappen, open vragen, brainstorm
of triviale/nog-niet-afgeronde uitwisselingen.
**Bij twijfel: niet wegschrijven.**

Geen expliciete trigger nodig; dit is standaardgedrag, maar uitsluitend
binnen deze vault.

### Gespreksbron voor write-backs

Autonome write-backs komen niet uit een bestand in `raw/`. Om herleidbaarheid
intact te houden, maakt de agent zelf een gespreksbron aan:

1. Maak een beknopt markdown-bestand in `raw/ingested/` met de kern van het
   gesprek (beslissing / probleem / learning + datum).
   Naam: `raw/ingested/<YYYY-MM-DD>-<kort-onderwerp>.md`
2. Schrijf of werk de wiki-pagina bij; `source:` wijst naar dit bestand,
   de body bevat een directe `[[wikilink]]` (geval 1, geen stub).
3. Append een log-regel: `## [YYYY-MM-DD] writeback | <onderwerp>`

Het gespreksbronbestand gaat direct naar `raw/ingested/` — niet via
`raw/inbox/`, want het is al verwerkt op het moment van aanmaken.

---

## Ingest-flow

1. Lees de bron in `raw/`
2. Bespreek of log de takeaways
3. Schrijf of werk wiki-pagina('s) bij (frontmatter invullen)
4. Werk `index.md` bij
5. Append log-regel
6. Verplaats het bestand van `raw/inbox/` naar `raw/ingested/` —
   verplaatsen, nooit verwijderen. Geldt voor alle bronnen uit inbox/ (markdown
   én PDFs). Bestanden die thuishoren in `raw/assets/` verhuizen nooit.
   Werk daarna eventuele expliciete paden in `source:`-velden of
   stub-`file:`-velden bij naar de nieuwe locatie.

*Autonoom write-back zonder raw/inbox/-bron werkt anders — zie sectie
"Autonoom write-back".*

---

## Rolverdeling

| Taak | Wie |
|------|-----|
| Ruwe notes dumpen in `raw/inbox/` | Mens |
| Wiki-pagina's schrijven en onderhouden | Agent |
| `index.md` bijwerken | Agent |
| `log.md` appenden | Agent |
| Bronnen verplaatsen van `raw/inbox/` naar `raw/ingested/` | Agent (na ingest) |
| Gespreksbron aanmaken in `raw/ingested/` bij write-back | Agent |
| Bestanden in `raw/` wijzigen of verwijderen | Nooit de agent |

---

## Stijl

Nederlands, bondig. Codevoorbeelden waar nuttig.

