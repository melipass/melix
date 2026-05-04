---
title: How my team won the OAS Cyberwomen Challenge — twice
date: 2023-11-10 10:00:00 -0300
categories: [Cybersecurity, Events]
tags: [oas, cyberwoman-challenge, ctf, bogota, women-in-tech, latin-america]
lang: en
description: How signing up for a six-hour CTF the night before — to avoid a class I didn't want to attend — turned into back-to-back wins at the OAS Cyberwomen Challenge and a trip to a regional final at Colombia's MinTIC.
image:
  path: /assets/img/posts/2023-11-10-hero.png
  alt: Botero-inspired illustration of three women working on laptops on a balcony in a futuristic Bogotá — La Candelaria brick rooftops, the Cerros Orientales rising behind them, a maglev TransMilenio gliding through the middle distance.
---

In September 2022 I signed up for a cybersecurity competition the night before it happened. I had a class I didn't want to attend that morning — a remote cybersecurity class, ironically — and I was honestly pretty down and looking for any excuse not to log in. The flyer for the *OAS Cyberwomen Challenge* showed up at the right time: a six-hour online CTF for women in cybersecurity, run by the OAS, Chile's CSIRT de Gobierno, the Interior Ministry, the Inter-American Committee against Terrorism (CICTE), and Trend Micro. A perfect alibi. I'd spent eight months working at Evernote in security and many years before that being the kind of internet kid who learned to defend by understanding how to attack. I'd done several AWS courses. I figured I could wing it.

The competition assigned us into teams of three at random and pointed us at a Discord server. I sat there for a few minutes before mustering the will to join the call — I was shy with strangers in 2022 — and met two women I would not have picked out of a profile-photo lineup but who turned out to be exactly the right people to be in a six-hour fight with. One of them brought infrastructure and compliance experience. Another brought OSINT and a background as a SOC analyst. I came in from the dev side, which mattered earlier than I expected: the first set of challenges had us pulling flags out of git logs and deploying things via gitops, and I'd just spent my Evernote internship doing intelligence work on git history that went back to 2008. So in the first challenge, honestly, I kind of carried us. By the second, the strengths balanced out and we settled into a rhythm.

The competition was fully remote, so I sat through it from my mom's place — I still live with her — making tea between rounds because Santiago in late September is still cold enough for it. Most of the day we had a vague sense we were doing well, but we didn't realize *how* well until late in the afternoon, when we finally checked the leaderboard and found ourselves comfortably in first. Some of that was us; some of it was that other teams had hit technical issues bad enough that the organizers ended up running the Chilean edition twice — which is why, when the regional final rolled around the next year, two Chilean teams qualified instead of one. We won fair and square; the other teams' bad luck just made it less of a photo finish than it should have been.

The prizes for the Chilean edition were AWS credits and a *diploma in cybersecurity from USACH* — the kind of postgraduate-style certificate program that runs over a year. The AWS credits I used right away. The USACH diploma turned into a small saga of its own.

## The diploma that wasn't

On October 20, 2022, USACH's executive education office wrote to congratulate me. The email gave me a year to complete the diploma "from the date your first course starts" — those are their exact words, and I want to point that out because it matters later. At the time I was finishing my Computer Engineering degree at Universidad Mayor while working full time at Evernote, and there was no version of reality where I could add a year of postgraduate coursework on top. I waited until I'd graduated.

A year later, in October 2023, I was finally free. I emailed them, picked the DevSecOps diplomado, filled out their form, asked when I could start.

Their reply: the scholarship had expired. The "next available start date" they'd referenced in the original email was November 2022 — over a year prior — and since *that* date had passed, the offer was gone. I read it twice. Then I went to the Wayback Machine.

The terms and conditions in force when they offered me the scholarship — archived October 5, 2022, originally published July 27 — had a *Vigencia* clause stating that any change to the rules had to "respect the benefits already offered." The scholarship-expiration item didn't appear in those conditions until the November 23, 2022 update — over a month after my offer. I wrote back with the link to the archive and the relevant clause. They never replied.

Whatever. The other prize — the regional final the next year — was something they couldn't take back.

## Bogotá

We didn't really stay in touch after the Chilean final. The three of us had a perfectly fine working relationship for six hours and then went back to our lives. A year later, when we knew the regional final was happening at MinTIC in Bogotá in early November, we resurfaced in a small group chat to coordinate flights — and that was about it. No training. No prep. We hadn't even met in person yet. The first time we did was at dinner the night before the competition, in the hotel restaurant. It was a perfect ice-breaker: by the time we walked into MinTIC the next morning, we already felt like a team again.

I traveled with my partner and my mom, which I'd recommend to anyone who wins a trip to a city they've never been to — it makes the in-between days actually fun. I'd looked up Bogotá's weather the day before flying out and noticed rain in every forecast, which is how I ended up packing a parka and laughing at my own ignorance. I'd grown up assuming all Colombian cities were tropically hot, when in fact Bogotá's altitude makes it closer to Santiago, or even further south, like Concepción — just much wetter. We landed at El Dorado in light rain, took a van to an Airbnb we'd rented for a week, and spent that first afternoon walking from museum to museum. There was, I learned later, a thunderstorm record set during our visit. Eating a hot lentil soup with fried plantain after getting soaked through — that's the strongest memory I have from those days.

Museo Botero was my favorite by far. We also did Museo del Oro, Museo de Bogotá, and a handful of others, but Botero's collection — both his own work and the Picassos, Mirós, and Bacons he donated to Colombia — wins. We rode the cable car up Monserrate, ate well, walked through La Candelaria. At Plaza de Bolívar I recognized the exact building where the Pablo Escobar character enters as a politician in *Narcos*, which gave me the kind of disproportionate thrill that minor Netflix-tourism deserves.

## At the ministry

The competition was held inside MinTIC itself — a big conference room divided into tables, one per team, with thirty-three women representing twelve countries: Argentina, Chile (two teams, since we'd had two editions), Colombia, Costa Rica, Ecuador, El Salvador, Guatemala, Mexico, Panama, Paraguay, Dominican Republic, and Uruguay. Some teams had brought their country's flag. Opening remarks came from Trend Micro, the OAS, and Sindey Carolina Bernal, Colombia's Vice Minister of Digital Transformation, who has purple-blue hair and made me think — out loud, in my head — *you can be an authority in tech and look like that.*

The other teams were taking this seriously. Most of them had several years of professional cybersecurity experience; ours had at most one year each, and one of us was just starting her career after transitioning from Nutrition. We were the underdogs on paper. Argentina's team was at our heels for the entire competition — every time I peeked at the standings, they were closing the gap.

The challenges this time were aligned more closely with Trend Micro's XDR philosophy: detection and response, layered visibility, log volume management, the kind of work a security operations team does on a real incident. Roughly thirty challenges across the day. We forgot to check the leaderboard until — once again — they were about to hide it from us late in the afternoon, but we managed to peek just before they did. We knew we'd won. We were nervous anyway.

When they called the results, they did it in reverse order: third place to Argentina, second tied between Mexico and a Chile-Paraguay collaboration, and first to us. We stood up for the photograph alongside Mariana Cardona of the OAS, who'd organized the program. The room felt warm in the right way.

## A note on who gets to be in the room

I'm a trans woman, and one thing I want to put plainly in this post is that nothing about my participation in the OAS Cyberwomen Challenge — registration, team assignment, the trip, the photo on stage — was complicated by that. The system worked. I signed up; they put me on a team; the OAS sent me to Bogotá; we walked onto the stage as the winning team. It is, frankly, the version of how this should always go, and the reason I'm naming it here is that it's still uncommon enough to be worth naming.

The only moment my transness came up at the competition was offstage, between rounds, when one of my teammates asked for advice about an AFAB family member who she suspected was a trans man. I shared what I knew about access to trans health in Chile — the practical things — and pointed her toward resources to keep exploring. I never found out how that conversation continued, but the fact that it happened at all, mid-CTF, between two strangers who'd just been thrown together by a random algorithm, is its own small data point about why these spaces matter.

If you're a trans woman or a femme-identifying non-binary person who's been wondering whether competitions like this are open to you: yes. Sign up.

## What it added up to

The trip's prize is a flight to the OAS Cybersecurity Symposium next year, somewhere in the region — they haven't told us where yet. But the competitions themselves — the Discord call, the rainy week in Bogotá, the team of three near-strangers who managed to win two championships without ever practicing together — taught me something I didn't expect: that some of the best cybersecurity work in Latin America is happening at the *amateur* end of the funnel. Women showing up to a free six-hour CTF on a Tuesday. Teams forming over Discord. People who, like me, signed up the night before to skip class.

The region has a real pipeline problem. We don't have nearly enough professionals, especially women, especially in roles beyond pentesting — and the formal educational paths are slow, expensive, and sometimes (as I learned the hard way) administratively allergic to the people they're meant to serve. Initiatives like the Cyberwomen Challenge sidestep that. They show up, hand you a Discord link and a real challenge, and let you find out what you're actually capable of. I'm grateful to the OAS for funding the kind of program that can pluck a dev having a bad day in Santiago, eight months into her first security job, and put her on a stage in Bogotá a year later. That's pipeline work.

If you fit the demographic, I'd point you at the next edition. Sign up the night before. Don't prepare. See what happens.
