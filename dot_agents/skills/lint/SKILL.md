---
name: lint
description: Controleer de wiki in ~/Obsidian/Hermes op structuurfouten, ontbrekende frontmatter en index-afwijkingen.
---

Controleer de wiki in ~/Obsidian/Hermes op structuur en kwaliteit.

De structuurregels staan in ~/Obsidian/Hermes/SCHEMA.md. Lees die altijd eerst.

1. Lees ~/Obsidian/Hermes/SCHEMA.md en index.md.
2. Controleer:
   - Ontbrekende of onvolledige frontmatter (title, type, created, updated, source);
     een leeg `source:`-veld op een inhoudelijke pagina (type: person|concept|project|note)
     is een expliciete bevinding — elke inhoudelijke pagina hoort een bron te hebben
     (upload in raw/ óf gespreksbron in raw/ingested/)
   - Wiki-pagina's met een source-veld dat naar een niet-bestaand raw/-bestand wijst
   - Stubs in sources/ met een `file:` dat naar een niet-bestaand
     raw/-bestand wijst
   - Niet-markdown bronnen in raw/ waarnaar een wiki-pagina direct verwijst
     zonder bijbehorende stub in sources/ (signaleer als ontbrekende stub)
   - Wiki-pagina's buiten raw/ en sources/ die niet in index.md staan
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
3. Rapporteer bevindingen per categorie. Geen goedkeuringen, alleen wat
   niet klopt.
4. Stel concrete fixes voor maar voer ze niet automatisch uit — wacht op
   bevestiging.

Raak raw/ nooit aan.
