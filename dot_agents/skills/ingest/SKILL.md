---
name: ingest
description: Verwerk een bron naar wiki/-pagina's in de actieve vault. Bron kan een bestand in raw/ zijn of content direct uit de chat.
---

Verwerk een bron naar wiki/ in de actieve vault.

De vault-root en structuurregels staan in de CLAUDE.md van de actieve vault.
Lees die CLAUDE.md altijd eerst voor je begint.

1. Bepaal de actieve vault als die niet duidelijk is (Notive, Resolph of Personal).
2. Lees de vault-CLAUDE.md.
3. Bepaal de bron:
   - Chat-content meegestuurd → schrijf eerst weg naar
     `raw/inbox/YYYY-MM-DD-<naam>.md`, verwerk dan dat bestand.
   - Specifiek bestand in raw/ opgegeven → verwerk dat.
   - Niets opgegeven → verwerk alle bestanden in raw/inbox/.

4. Dubbel-werk-check: controleer of de bron al eerder is verwerkt.
   - Staat het bestand al in `raw/ingested/`? → overgeslagen (al gedaan).
   - Staat er al een wiki-pagina met dit bestand als `source:`? → signaleer
     en vraag bevestiging voor herverwerking.

5. Bepaal het bron-type en stel de link in:
   - **Markdown** (.md-bestand in raw/): link vanuit de wiki-pagina('s) direct
     met een `[[wikilink]]` naar de bron in de body.
   - **Niet-markdown** (PDF, afbeelding als zelfstandige bron, data-dump):
     maak een stub aan in `wiki/sources/<naam>.md` (als die nog niet bestaat):
     ```
     ---
     type: source
     file: ../../raw/<submap>/<bestandsnaam>
     ingested: <YYYY-MM-DD>
     ---
     Bron: <korte omschrijving> (<bestandstype>).

     ![[<bestandsnaam>]]
     ```
     Link de wiki-pagina('s) naar de stub, niet naar het raw-bestand.
   - **Asset onderdeel van markdown-bron**: geen eigen stub. De `![[...]]` in
     de markdown-bron volstaat. (Verwerk eerst tekst, bekijk daarna afbeeldingen
     apart.)

6. Verwerk:
   - Bespreek de takeaways.
   - Schrijf of werk wiki-pagina('s) bij met correcte frontmatter
     (`source:` verwijst naar de primaire bron).
   - Zet de body-link naar de bron (directe wikilink of link naar stub).
   - Werk index.md bij (één regel per nieuwe of gewijzigde pagina).
   - Append log-regel: `## [YYYY-MM-DD] ingest | <titel>`

7. Verplaats bronnen van `raw/inbox/` naar `raw/ingested/`:
   - Geldt voor alle bestanden in raw/inbox/ die je zojuist hebt verwerkt
     (markdown én niet-markdown zoals PDFs).
   - Uitzondering: bestanden die thuishoren in `raw/assets/` verhuizen nooit.
   - Werk daarna eventuele expliciete paden in `source:`-velden of
     stub-`file:`-velden bij naar `raw/ingested/<bestandsnaam>`.

Stubs gaan in `wiki/sources/`, niet in raw/.
Append alleen — overschrijf nooit bestaande wiki-content.
Raak raw/ niet aan behalve de inbox→ingested verplaatsing in stap 7 en
het aanmaken van een nieuw bestand in raw/inbox/ voor chat-content (stap 3).
