---
name: lint
description: Controleer de wiki/ van de actieve vault op structuurfouten, ontbrekende frontmatter en index-afwijkingen.
---

Controleer de wiki/ van de actieve vault op structuur en kwaliteit.

De vault-root en structuurregels staan in de CLAUDE.md van de actieve vault.
Lees die CLAUDE.md altijd eerst voor je begint.

1. Bepaal de actieve vault als die niet duidelijk is (Notive, Resolph of Personal).
2. Lees de vault-CLAUDE.md en wiki/index.md.
3. Controleer:
   - Ontbrekende of onvolledige frontmatter (title, type, created, updated, source);
     een leeg `source:`-veld op een inhoudelijke pagina (type: person|concept|project|note)
     is een expliciete bevinding — elke inhoudelijke pagina hoort een bron te hebben
     (upload in raw/ óf gespreksbron in raw/ingested/)
   - Wiki-pagina's met een source-veld dat naar een niet-bestaand raw/-bestand wijst
   - Stubs in wiki/sources/ met een `file:` dat naar een niet-bestaand
     raw/-bestand wijst
   - Niet-markdown bronnen in raw/ waarnaar een wiki-pagina direct verwijst
     zonder bijbehorende stub in wiki/sources/ (signaleer als ontbrekende stub)
   - Pagina's in wiki/ die niet in index.md staan
   - Pagina's in index.md die niet als bestand bestaan
   - Broken wikilinks (verwijzingen naar niet-bestaande pagina's)
   - Weespagina's zonder enige inbound link
   - Groepen (people/, concepts/, projects/) met minder dan 3 pagina's
   - Bestanden buiten de bedoelde structuur
   - Pagina's die elkaar inhoudelijk lijken tegen te spreken (als observatie —
     geen markering, geen actie; alleen signaleren)
   - Wachtrij: bestanden in raw/inbox/ die nog niet zijn verwerkt (geef lijst)
   - Bestanden in raw/ingested/ waarnaar geen enkele wiki-pagina verwijst via
     source:-veld of [[wikilink]] (mogelijke wees-ingest of verweesde writeback-bron)
4. Rapporteer bevindingen per categorie. Geen goedkeuringen, alleen wat
   niet klopt.
5. Stel concrete fixes voor maar voer ze niet automatisch uit — wacht op
   bevestiging.

Raak raw/ nooit aan.
