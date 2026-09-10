---
name: llm-wiki
description: Werk met de LLM-wiki in ~/obsidian/llm-wiki — bronnen ingesten naar wiki-pagina's, vragen beantwoorden uit de wiki, en de wiki linten op structuur en kwaliteit. Gebruik bij "ingest deze bron", "wat weet ik over X", "lint de wiki", of elke andere verwijzing naar de wiki of kennisbank.
---

# LLM wiki

De wiki staat in `~/obsidian/llm-wiki`: een map met markdown-bestanden, te openen
in Obsidian of een editor. Gebaseerd op het [LLM Wiki-patroon van Andrej
Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f):
kennis wordt één keer gecompileerd en actueel gehouden, in plaats van per vraag
opnieuw afgeleid.

## Structuur

```
~/obsidian/llm-wiki/
├── SCHEMA.md      # conventies, frontmatter, tag-taxonomie, thresholds
├── index.md       # catalogus: elke pagina met één regel samenvatting
├── log.md         # chronologisch actielog, append-only
├── raw/           # bronmateriaal (articles/ papers/ transcripts/ assets/) — immutable
├── entities/      # personen, projecten, klanten
├── concepts/      # concepten, technieken, learnings
├── comparisons/   # side-by-side analyses
└── queries/       # bewaarde query-antwoorden
```

`SCHEMA.md` is leidend voor alle inhoudelijke regels. Deze skill beschrijft
alleen de werkwijze.

Op een verse machine zet `run_after_05-initialize-llm-wiki.sh` de lege structuur
neer. Staan `Domain` of `Tag Taxonomy` in `SCHEMA.md` nog op TODO, vul die dan
eerst samen met de gebruiker in — zonder domein en taxonomie is elke ingest gokwerk.

## Oriëntatie — altijd eerst

Voor elke operatie, elke sessie:

1. Lees `SCHEMA.md` — domein, conventies, tag-taxonomie.
2. Lees `index.md` — welke pagina's bestaan al.
3. Lees de laatste ~30 regels van `log.md` — wat is recent gebeurd.

Zonder oriëntatie ontstaan duplicaten en gemiste cross-references.

## Ingest

1. Bepaal de bron:
   - Chat-content meegestuurd → schrijf eerst weg onder `raw/` (`raw/articles/`
     voor webartikelen/clippings, `raw/papers/` voor PDFs/papers,
     `raw/transcripts/` voor gesprekken/meetings), bestandsnaam
     `YYYY-MM-DD-<naam>.md`. Verwerk dan dat bestand.
   - Specifiek bestand in `raw/` opgegeven → verwerk dat.
   - Niets opgegeven → verwerk bestanden in `raw/` die nog niet als `sources:`
     in een wiki-pagina voorkomen.

2. Dubbel-werk-check: staat er al een pagina met dit bestand in `sources:`?
   Signaleer en vraag bevestiging voor herverwerking.

3. Raw-frontmatter: geef het bronbestand een blok met `source_url` (indien van
   toepassing), `ingested: YYYY-MM-DD` en `sha256` van de body. Bij her-ingest
   van dezelfde URL: hercomputeer, sla over bij gelijke hash, signaleer drift
   bij verschil.

4. Verwerk naar pagina's:
   - **Nieuwe entiteit/concept**: alleen aanmaken als de Page Thresholds in
     `SCHEMA.md` dat rechtvaardigen (2+ bronnen, of centraal in één bron).
     Entiteiten → `entities/`, concepten/learnings → `concepts/`.
   - **Bestaande pagina**: info toevoegen, `updated`-datum ophogen. Bij
     tegenstrijdige info: volg de Update Policy in `SCHEMA.md`.
   - **Cross-reference**: elke nieuwe/gewijzigde pagina linkt naar minstens 2
     andere pagina's via `[[wikilinks]]`.
   - **Tags**: alleen uit de taxonomie in `SCHEMA.md`.
   - **Frontmatter**: `sources:` is een array, bijv.
     `sources: [raw/papers/bestand.pdf, raw/articles/ander.md]`.
   - **Provenance**: bij 3+ bronnen op één pagina, `^[raw/.../bestand.md]`-markers
     op de betreffende alinea's.
   - **Confidence**: bij opiniegedreven of single-source claims
     `confidence: medium` of `low` zetten.

5. Update navigatie:
   - Nieuwe pagina's in `index.md` onder de juiste sectie, alfabetisch.
   - "Total pages" en "Last updated" in de index-header bijwerken.
   - Append aan `log.md`: `## [YYYY-MM-DD] ingest | <titel>`, met alle
     aangemaakte en gewijzigde bestanden.

6. Rapporteer welke bestanden zijn aangemaakt of gewijzigd. Eén bron die 5-15
   pagina's raakt is normaal — dat is het compounding-effect.

Bij meerdere bronnen tegelijk: lees eerst alles, inventariseer alle entiteiten
in één zoekslag, schrijf dan in één pass, en sluit af met één index-update en
één logregel.

## Query

1. Gebruik `index.md` om relevante pagina's te vinden; grep over alle
   `.md`-bestanden als de index het antwoord niet dekt.
2. Beantwoord op basis van wiki-pagina's en `raw/`-bronnen. Verwijs naar wat je
   gebruikt hebt: "Op basis van [[page-a]] en [[page-b]]...".
3. Schrijf waardevolle antwoorden terug — een nieuw inzicht, beslissing of
   synthese die pijnlijk is om opnieuw af te leiden:
   - Naar de juiste bestaande pagina, of een nieuwe pagina in `queries/`
     (of `comparisons/` bij een side-by-side analyse).
   - Werk `index.md` bij bij een nieuwe pagina.
   - Append: `## [YYYY-MM-DD] query | <onderwerp>`.
   - Triviale lookups niet opslaan.

## Lint

Controleer en rapporteer, gegroepeerd op ernst (broken links > orphans > source
drift > contested > stale > style):

- Ontbrekende of onvolledige frontmatter (title, type, created, updated, tags,
  sources); een lege `sources:` op een inhoudelijke pagina is een expliciete
  bevinding
- `sources:`-paden naar een niet-bestaand `raw/`-bestand
- Tags buiten de taxonomie van `SCHEMA.md`
- Pagina's die niet in `index.md` staan, en index-entries zonder bestand
- Broken wikilinks en weespagina's zonder inbound link
- Pagina's boven ~200 regels (kandidaat voor splitsen)
- Pagina's die elkaar tegenspreken; ook `contested: true` en `contradictions:`
- Pagina's met `confidence: low`, en single-source pagina's zonder confidence
- `raw/`-bestanden met `sha256:`: hercomputeer, signaleer drift
- `raw/`-bestanden waarnaar geen enkele pagina verwijst (wees-ingest)
- Bestanden buiten de bedoelde structuur
- `log.md` boven 500 entries → adviseer rotatie naar `log-YYYY.md`

Geen goedkeuringen, alleen wat niet klopt. Stel concrete fixes voor maar voer ze
niet automatisch uit — wacht op bevestiging. Append:
`## [YYYY-MM-DD] lint | N issues found`.

## Valkuilen

- Raak `raw/` nooit aan, behalve nieuwe bronbestanden en hun frontmatter.
  Correcties horen op wiki-pagina's.
- Vul bestaande content aan, overschrijf niet zonder reden.
- `index.md` en `log.md` altijd bijwerken — dat is de navigatie-backbone.
- Geen pagina's zonder minstens 2 uitgaande wikilinks; geïsoleerde pagina's zijn
  onvindbaar.
- Geen pagina's voor terloopse vermeldingen.
- Bij een ingest die 10+ bestaande pagina's raakt: eerst scope bevestigen.
- Tegenstrijdigheden expliciet noteren met datum en bron, niet stil overschrijven.
