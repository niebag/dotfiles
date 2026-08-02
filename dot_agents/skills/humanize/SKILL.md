---
name: humanize
description: >-
  Controleer of herschrijf proza om AI-schrijfpatronen te verwijderen en de persoonlijke schrijfstijl van de gebruiker te volgen. Use when the user invokes /humanize, asks "humanize dit", "schrijf dit zoals ik", "haal de AI-tells eruit", "maak dit minder AI", "klinkt dit als AI?" or equivalent, or when finalizing user-facing prose that will be sent, published, or delivered, including messages, emails, Slack posts, tickets, reports, proposals, documentation, PRDs, and documents. Do not use for the agent's ordinary conversational replies, status updates, explanations, or internal reasoning.
---

# Humanize

## Invoer

Werk op tekst die de gebruiker aanlevert of aanwijst, of op een werktekst die de
agent binnen de huidige taak opstelt. Maak bij een externe schrijfopdracht eerst
de inhoudelijke werktekst en pas daar vóór oplevering rewrite-modus op toe.

Ontbreken bij een losse humanize-opdracht zowel tekst als schrijfdoel, antwoord
dan exact: `Plak de tekst die je wilt laten controleren of herschrijven.`

## Modus

- **Check**: gebruik bij een vraag of tekst als AI leest. Rapporteer zonder te
  herschrijven. Geef geen score of waarschijnlijkheidspercentage.
- **Rewrite**: gebruik bij een expliciet herschrijfverzoek of wanneer een
  hogere instructie humanize verplicht voor een extern werkproduct.

Een beoordeling is geen toestemming om te herschrijven, tenzij een hogere
instructie rewrite voor dit externe werkproduct verplicht. Pas de skill nooit
toe op gewone conversationele antwoorden van de agent.

## Referenties

- Lees in check-modus `references/ai-tells.md` volledig; §6 tegen
  overcorrectie is verplicht.
- Lees in rewrite-modus de routing, het relevante register en §9–§10 in
  `references/stijlprofiel.md`. Lees de volledige AI-veldgids alleen bij een
  expliciete AI-audit of als de werktekst meerdere onduidelijke tells bevat.
- Gebruik Wikipedia-signalen als algemene detectiekennis en het stijlprofiel
  als persoonlijke rewritevoorkeur. Presenteer die voorkeuren niet als
  AI-bewijs.

## Workflow

1. **Bepaal bereik.** Humanize alleen het zelfstandige proza dat de gebruiker
   gaat kopiëren, versturen, publiceren of opleveren; niet de begeleidende chat.
2. **Bepaal modus en register.** Volg expliciete sturing zoals `formeler`,
   `korter` of `minder informeel` boven het stijlprofiel. Pas zakelijke regels
   niet mechanisch toe op persoonlijke of intieme tekst.
3. **Bescherm inhoud.** Wijzig geen citaten of tekst van de ontvanger, code,
   identifiers, commando's, foutmeldingen, juridische formuleringen, exacte
   cijfers, data, toezeggingen of bewust gekozen aanspreekvormen.
4. **Analyseer de inhoud.** Zoek patronen, geen losse verboden woorden. Een
   signaal alleen bewijst niets; benoem het concrete inhoudelijke of
   stilistische probleem.
5. **Herschrijf indien nodig.** Los vage, opgeblazen of contentloze inhoud
   op. Pas daarna het relevante register toe. Behoud feiten, nuance,
   beleefdheidsniveau, onzekerheid en betekenis.
6. **Controleer.** Vergelijk met de bron of werktekst. Verwijder niets dat
   nodig is, verzin niets en maak exacte informatie niet bij benadering.

## Persoonlijke voorkeuren met extra risico

- Vermijd in rewrite nieuwe retorische em-dashes in eigen proza. Behoud ze in
  beschermde tekst en als label-, kop- of informele ondertekeningsscheider. Een
  em-dash alleen is in check-modus geen AI-signaal.
- Gebruik `denk ik`, verkleinwoorden, schuine strepen en informele afsluiters
  alleen als ze natuurlijk bij betekenis en register passen.
- Gebruik doorgaans `je`, `jij` of `jullie`, maar behoud een bewust formele
  aanspreekvorm.
- Behoud de taal van het origineel en vertaal gangbaar technisch jargon niet.
- Voeg geen opzettelijke typo's toe.

## Output

**Check**

- Rapporteer per bevinding: citaat, signaal, inhoudelijk probleem en concreet
  voorstel.
- Schrijf `Geen bevindingen.` als geen patroon voldoende onderbouwd is.

**Rewrite**

- Begin direct met de herschreven tekst; gebruik geen meta-inleiding of
  slotvraag.
- Geef bij automatische toepassing geen toelichting en noem de skill niet.
- Houd bij een expliciet herschrijfverzoek een eventuele toelichting feitelijk
  en maximaal vijf regels.
