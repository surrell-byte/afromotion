#!/usr/bin/env bash
# Builds the Afromotion multipage website.
# Usage: bash setup-afromotion.sh [target-folder]   (default: ./afromotion)
set -euo pipefail

DIR="${1:-afromotion}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$DIR"/{css,js,assets}

if ! command -v cwebp >/dev/null 2>&1; then
  echo "Error: cwebp is required to optimize site images. Install WebP tools and rerun." >&2
  exit 1
fi

if [ -f "$HERE/assets/images/am-logo.png" ]; then
  rm -f "$DIR/assets/logo.png" "$DIR/assets/favicon.png" \
    "$DIR/assets/merch-back.png" "$DIR/assets/merch-front.png" \
    "$DIR/assets/gallery-dancefloor.png" "$DIR/assets/gallery-crowd.png" \
    "$DIR/assets/gallery-vuka-poster.png" "$DIR/assets/gallery-vuka-tables.png"
  cwebp -resize 720 0 -q 88 "$HERE/assets/images/am-logo.png" -o "$DIR/assets/logo.webp" >/dev/null
  cwebp -resize 128 0 -q 88 "$HERE/assets/images/am-favicon.png" -o "$DIR/assets/favicon.webp" >/dev/null
  cwebp -resize 900 0 -q 82 "$HERE/assets/images/Screenshot 2026-10-16 at 01.28.45.png" -o "$DIR/assets/merch-back.webp" >/dev/null
  cwebp -resize 900 0 -q 82 "$HERE/assets/images/Screenshot 2026-10-16 at 01.29.05.png" -o "$DIR/assets/merch-front.webp" >/dev/null
  cwebp -resize 1200 0 -q 82 "$HERE/assets/images/Screenshot 2026-10-16 at 01.30.11.png" -o "$DIR/assets/gallery-dancefloor.webp" >/dev/null
  cwebp -resize 1200 0 -q 82 "$HERE/assets/images/Screenshot 2026-10-16 at 01.30.22.png" -o "$DIR/assets/gallery-crowd.webp" >/dev/null
  cwebp -resize 900 0 -q 88 "$HERE/assets/images/Screenshot 2026-10-16 at 01.31.27.png" -o "$DIR/assets/gallery-vuka-poster.webp" >/dev/null
  cwebp -resize 900 0 -q 88 "$HERE/assets/images/Screenshot 2026-10-16 at 01.31.42.png" -o "$DIR/assets/gallery-vuka-tables.webp" >/dev/null
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/darling sabrina.png" -o "$DIR/assets/artist-darling-sabrina.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/dj pedro.png" -o "$DIR/assets/artist-dj-pedro.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/novxlist.png" -o "$DIR/assets/artist-novxlist.webp" >/dev/null 2>&1
  cwebp -resize 1100 0 -q 82 "$HERE/assets/images/founders.png" -o "$DIR/assets/founders.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/chley.jpeg" -o "$DIR/assets/guest-chley.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/leemckrazy.jpg" -o "$DIR/assets/guest-leemckrazy.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/eemoh.jpeg" -o "$DIR/assets/guest-eemoh.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/031 Choppa.jpeg" -o "$DIR/assets/guest-031-choppa.webp" >/dev/null 2>&1
  cwebp -resize 900 0 -q 84 "$HERE/assets/images/Fido.jpeg" -o "$DIR/assets/guest-fido.webp" >/dev/null 2>&1
  cwebp -resize 1000 0 -q 80 "$HERE/assets/images/having fun 1.png" -o "$DIR/assets/gallery-event-1.webp" >/dev/null 2>&1
  cwebp -resize 1000 0 -q 80 "$HERE/assets/images/having fun 2.png" -o "$DIR/assets/gallery-event-2.webp" >/dev/null 2>&1
  cwebp -resize 1000 0 -q 80 "$HERE/assets/images/having fun 3.png" -o "$DIR/assets/gallery-event-3.webp" >/dev/null 2>&1
  cwebp -resize 1800 0 -q 82 "$HERE/assets/images/kl-bg-desktop.png" -o "$DIR/assets/kl-bg-desktop.webp" >/dev/null 2>&1
  cwebp -resize 1200 0 -q 82 "$HERE/assets/images/kl-bg-phone.png" -o "$DIR/assets/kl-bg-phone.webp" >/dev/null 2>&1
else
  echo "Note: put am-logo.png next to this script and re-run to add the logo."
  exit 1
fi

# ---------------------------------------------------------------- CSS
cat > "$DIR/css/style.css" <<'EOF'
:root{color-scheme:dark;--ink:#000;--paper:#fff;--ring:#2b3037;--mute:#9aa1aa;--mist:#eceef0;--section-muted:#4b525b;--btn-hover:var(--paper);--d:'Big Shoulders Display',Impact,sans-serif;--b:'Archivo',system-ui,sans-serif}
:root[data-theme="light"]{color-scheme:light;--ink:#f4f1eb;--paper:#171717;--ring:#d6d0c7;--mute:#625f59;--mist:#e8e3dc;--section-muted:#aaa59c;--btn-hover:var(--ink)}
:root{--accent:#a51c24;--event-feature-bg:#7c1015;--event-feature-fg:#fff;--event-feature-eyebrow:#ffd6d6}
:root[data-theme="light"]{--accent:#a51c24;--event-feature-bg:#7c1015;--event-feature-fg:#fff;--event-feature-eyebrow:#ffd6d6}
:root[data-theme="ocean"]{
  color-scheme:dark;
  --ink:#102A43;--paper:#BEE9F7;--ring:#32647D;--mute:#A4C7D8;--mist:#1B4965;--section-muted:#8CB7CB;--btn-hover:#102A43;
  --accent:#62B6CB;--accent-soft:#1B4965;--surface:#163B55;--glow:rgba(98,182,203,.18);
  --event-feature-bg:var(--accent-soft);--event-feature-fg:var(--paper);--event-feature-eyebrow:var(--accent)
}
:root[data-theme="sunset"]{
  color-scheme:dark;
  --ink:#392B52;--paper:#FFF3E8;--ring:#755B82;--mute:#D0B9D8;--mist:#523D69;--section-muted:#C7ACCE;--btn-hover:#392B52;
  --accent:#FFC18B;--accent-soft:#74558F;--surface:#48345F;--glow:rgba(233,139,131,.18);
  --event-feature-bg:var(--accent-soft);--event-feature-fg:var(--paper);--event-feature-eyebrow:var(--accent)
}
*{box-sizing:border-box;margin:0}
body{background:var(--ink);color:var(--paper);font:400 1.0625rem/1.6 var(--b)}
:root[data-theme="ocean"] body{background:radial-gradient(ellipse at 80% 5%,rgba(98,182,203,.13),transparent 45%),var(--ink)}
:root[data-theme="sunset"] body{background:radial-gradient(ellipse at 85% 5%,rgba(233,139,131,.16),transparent 40%),radial-gradient(ellipse at 10% 85%,rgba(255,193,139,.09),transparent 40%),var(--ink)}
img{max-width:100%;display:block}
a{color:inherit}
:focus-visible{outline:3px solid currentColor;outline-offset:3px}
.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;border:0}
.wrap{width:min(1120px,100% - 2.5rem);margin-inline:auto}
h1,h2,h3{font-family:var(--d);font-weight:800;line-height:.95;letter-spacing:.01em}
h1{font-size:clamp(3.2rem,9vw,7rem)}
h2{font-size:clamp(2.4rem,6vw,4.2rem);margin-bottom:1.25rem}
h3{font-size:1.9rem;line-height:1;margin-bottom:.4rem}
p{max-width:62ch}
header{position:sticky;top:0;z-index:9;background:var(--ink);border-bottom:1px solid var(--ring)}
.bar{display:flex;align-items:center;justify-content:space-between;gap:1rem;padding-block:.5rem}
.brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;font:800 1.6rem var(--d);letter-spacing:.04em}
.brand img{flex:none;width:44px;height:44px;aspect-ratio:1;object-fit:contain;border-radius:50%}
#nav{display:flex;align-items:center;gap:1.5rem}
#nav a:not(.btn){text-decoration:none;color:var(--mute);padding-block:.5rem}
#nav a:not(.btn):hover,#nav a[aria-current]{color:var(--paper)}
#nav a[aria-current]{box-shadow:0 2px 0 var(--paper)}
.menu{display:none}
.theme-picker select{min-height:2.75rem;padding:.45rem .65rem;border:2px solid var(--ring);background:var(--ink);color:var(--paper);font:600 .95rem var(--b);cursor:pointer}
.btn{display:inline-block;background:var(--paper);color:var(--ink);font:600 1rem var(--b);text-decoration:none;padding:.85rem 1.6rem;border:2px solid var(--paper);cursor:pointer}
.btn:hover{background:transparent;color:var(--btn-hover)}
:root[data-theme="ocean"] .btn:not(.ghost),:root[data-theme="sunset"] .btn:not(.ghost){background:var(--accent);color:var(--ink);border-color:var(--accent)}
:root[data-theme="ocean"] .btn:not(.ghost):hover,:root[data-theme="sunset"] .btn:not(.ghost):hover{background:transparent;color:var(--accent)}
.btn.ghost{background:transparent;color:inherit;border-color:currentColor}
.btn.ghost:hover{color:var(--paper)}
.dark .btn.ghost:hover{background:var(--paper);color:var(--ink)}
.light .btn{background:var(--ink);color:var(--paper);border-color:var(--ink)}
.light .btn:hover{background:transparent;color:var(--ink)}
.light .btn.ghost{background:transparent;color:var(--ink)}
.light .btn.ghost:hover{background:var(--ink);color:var(--paper)}
.btn.sm{padding:.55rem 1.1rem;font-size:.95rem}
.hero{position:relative;isolation:isolate;width:100%;padding-inline:max(calc((100% - 1120px)/2),1.25rem);display:grid;grid-template-columns:1.2fr .8fr;align-items:center;gap:2rem;min-height:calc(100svh - 62px);padding-block:3rem;background:linear-gradient(90deg,rgba(0,0,0,.62),rgba(0,0,0,.22)),url('../assets/kl-bg-desktop.webp') center/cover no-repeat;color:#fff}
.hero p{font-size:1.25rem;color:rgba(255,255,255,.88);margin:1.5rem 0 2rem}
.acts{display:flex;gap:1rem;flex-wrap:wrap}
.hero img{width:min(100%,520px);height:auto;aspect-ratio:1;object-fit:contain;border-radius:50%;margin-inline:auto;animation:rise 1.2s cubic-bezier(.2,.7,.2,1) both}
@keyframes rise{from{opacity:0;transform:scale(.88) rotate(-6deg)}}
section{padding-block:5rem}
.head{padding-block:4rem 5rem}
.head p{color:var(--mute);font-size:1.2rem;margin-top:1.25rem}
.light{background:var(--paper);color:var(--ink);clip-path:polygon(0 4vw,50% 0,100% 4vw,100% 100%,0 100%);padding-top:calc(4vw + 4rem)}
.event-feature{background:var(--event-feature-bg);color:var(--event-feature-fg);padding-block:clamp(2.5rem,7vw,5rem)}
.event-feature .wrap{display:grid;grid-template-columns:minmax(0,.8fr) minmax(0,1.2fr);gap:clamp(2rem,5vw,4rem);align-items:center}
.event-feature img{width:min(100%,390px);height:auto;justify-self:center}
.event-feature .eyebrow{color:var(--event-feature-eyebrow)}
.event-feature h2{margin-top:.5rem}
.event-feature p{margin-top:1rem}
.event-feature .lineup{font-weight:600}
.ev{display:grid;grid-template-columns:5.5rem 1fr auto;gap:1.5rem;align-items:center;padding-block:1.5rem;border-top:2px solid var(--ink)}
.ev:last-child{border-bottom:2px solid var(--ink)}
.date{font-family:var(--d);text-align:center;line-height:.9}
.date b{display:block;font-size:3.6rem}
.date span{font-size:1.4rem;font-weight:700}
.meta{font-size:.95rem;color:var(--section-muted);margin-top:.4rem}
.light .meta,.light .note{color:inherit}
.chips{display:flex;gap:.6rem;flex-wrap:wrap;margin-bottom:2rem}
.chip{font:inherit;background:none;color:var(--ink);border:2px solid var(--ink);padding:.4rem 1rem;cursor:pointer}
.chip[aria-pressed=true]{background:var(--ink);color:var(--paper)}
.more{margin-top:2rem}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(230px,1fr));gap:2.5rem 2rem}
.mono{aspect-ratio:1;border-radius:50%;border:8px double var(--ring);display:grid;place-items:center;font:800 4.5rem var(--d);margin-bottom:1.1rem}
:root[data-theme="ocean"] .mono,:root[data-theme="sunset"] .mono{border-color:var(--accent)}
.art p{color:var(--mute);font-size:.98rem}
.art .g{color:var(--paper);font-weight:600}
.art>img{width:100%;aspect-ratio:4/5;object-fit:cover;margin-bottom:1.1rem;background:var(--ring)}
.resident-note{margin-bottom:2rem;color:var(--mute)}
.founders{display:grid;grid-template-columns:minmax(0,1fr) minmax(0,1fr);gap:3rem;align-items:center}
.founders>img{width:100%;max-height:650px;object-fit:cover}
.profile-copy p+p{margin-top:1rem}
.profile-copy p+h3{margin-top:1.25rem}
.contributors{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:2rem;margin-top:2rem}
.contributors article{border-top:2px solid var(--ring);padding-top:1rem}
.gallery{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1.5rem}
.gallery figure{position:relative;overflow:hidden;background:var(--ring)}
.gallery figure.poster{background:#240404}
.gallery img{width:100%;height:100%;aspect-ratio:4/3;object-fit:cover;transition:transform .3s ease}
.gallery figure.poster img{height:auto;aspect-ratio:900/1272;object-fit:contain}
.gallery figure:hover img{transform:scale(1.03)}
.gallery figure.guest{background:var(--ink)}
.gallery figure.guest img{aspect-ratio:4/5;object-fit:cover}
.gallery figcaption{position:absolute;inset:auto 0 0;padding:2.5rem 1rem 1rem;background:linear-gradient(transparent,rgba(0,0,0,.8));font-weight:600}
.merch-grid{display:grid;grid-template-columns:minmax(0,760px);justify-content:center;gap:2rem}
.merch-card{border:1px solid var(--ring);padding:1rem}
.merch-photos{display:grid;grid-template-columns:1fr 1fr;gap:.5rem;margin-bottom:1rem}
.merch-photos img{width:100%;height:auto;aspect-ratio:900/1135;object-fit:cover;background:var(--ring)}
.merch-card p{color:var(--mute)}
.merch-card .btn{margin-top:1rem}
.eyebrow{text-transform:uppercase;letter-spacing:.12em;font-size:.85rem;font-weight:600;color:var(--mute)}
:root[data-theme="ocean"] .eyebrow,:root[data-theme="sunset"] .eyebrow{color:var(--accent)}
.two{display:grid;grid-template-columns:1fr 1fr;gap:3rem}
.two h3{font-size:2.3rem}
.two p+h3{margin-top:2rem}
form{display:grid;gap:1.1rem}
label{display:grid;gap:.35rem;font-weight:600}
input,select,textarea{font:inherit;padding:.8rem;border:2px solid var(--ink);background:var(--paper);color:var(--ink);border-radius:0}
textarea{min-height:9rem}
.note{font-size:.9rem;color:var(--section-muted)}
.quiz-shell{max-width:760px;margin-inline:auto}
.quiz-progress{display:block;width:100%;height:.75rem;margin:1rem 0 2rem;accent-color:var(--accent)}
.quiz-round{color:var(--mute);font-weight:600;text-transform:uppercase;letter-spacing:.1em}
.quiz-options{display:grid;gap:.75rem;margin:1.5rem 0;border:0}
.quiz-option{display:flex;grid-template-columns:auto 1fr;align-items:center;gap:.75rem;border:2px solid var(--ring);padding:.9rem 1rem;cursor:pointer}
.quiz-option:has(input:checked){border-color:currentColor;background:color-mix(in srgb,var(--paper) 10%,transparent)}
.quiz-option input{accent-color:var(--accent)}
.quiz-feedback{min-height:2rem;margin-block:1rem}
.quiz-actions{display:flex;gap:1rem;flex-wrap:wrap}
.quiz-result{text-align:center}
.quiz-result strong{display:block;font:800 clamp(4rem,12vw,7rem)/1 var(--d)}
.merch-price{font:800 2rem/1 var(--d);margin-block:.75rem}
@media(max-width:1100px){
.menu{display:block;background:none;color:inherit;border:2px solid var(--ring);padding:.4rem .9rem;font:inherit;cursor:pointer}
#nav{display:none;position:absolute;left:0;right:0;top:100%;background:var(--ink);flex-direction:column;align-items:flex-start;padding:1rem 1.25rem 1.5rem;border-bottom:1px solid var(--ring)}
#nav.open{display:flex}
}
footer{border-top:1px solid var(--ring);padding-block:3rem;color:var(--mute)}
footer .wrap{display:flex;justify-content:space-between;gap:1.5rem 2.5rem;flex-wrap:wrap;align-items:center}
footer .brand{color:var(--paper)}
footer nav{display:flex;gap:1.25rem;flex-wrap:wrap}
footer nav a{text-decoration:none}
footer nav a:hover{color:var(--paper)}
@media(max-width:800px){
.hero,.two,.founders{grid-template-columns:1fr}
.hero{min-height:0}
.hero{background-image:linear-gradient(rgba(0,0,0,.5),rgba(0,0,0,.58)),url('../assets/kl-bg-phone.webp')}
.hero img{width:min(70%,320px);order:-1}
.head{padding-bottom:.75rem}
.head+section{padding-top:calc(4vw + 2.5rem)}
.event-feature .wrap{grid-template-columns:1fr}
.event-feature img{width:min(75%,320px)}
.gallery{grid-template-columns:1fr}
.ev{grid-template-columns:4rem 1fr;gap:1rem}
.ev .btn{grid-column:2;justify-self:start}
.menu{display:block;background:none;color:inherit;border:2px solid var(--ring);padding:.4rem .9rem;font:inherit;cursor:pointer}
.bar{gap:.5rem}
.brand{gap:.4rem;font-size:1.3rem}
.brand img{width:36px;height:36px}
.theme-picker select{min-height:2.5rem}
.menu{padding:.35rem .6rem}
#nav{display:none;position:absolute;left:0;right:0;top:100%;background:var(--ink);flex-direction:column;align-items:flex-start;padding:1rem 1.25rem 1.5rem;border-bottom:1px solid var(--ring)}
#nav.open{display:flex}
}
@media(max-width:520px){
.merch-photos{grid-template-columns:1fr;gap:1rem}
.merch-photos img{width:min(100%,360px);justify-self:center}
}
@media(prefers-reduced-motion:reduce){*{animation:none!important}}
EOF

# ---------------------------------------------------------------- JS
cat > "$DIR/js/main.js" <<'EOF'
// Edit the events and artists below. These are placeholders.
const EVENTS=[
{title:'Lagos to KL Night',date:'2026-11-14',area:'Bukit Bintang, KL',genre:'Afrobeats',price:'RM 60',blurb:'A full night of Afrobeats, from Lagos classics to the newest hits, with DJs and live vocals.'},
{title:'Amapiano Sundowner',date:'2026-11-22',area:'Bangsar, KL',genre:'Amapiano',price:'RM 45',blurb:'Log drums and golden hour on a rooftop. Doors open at 4 pm.'},
{title:'Afro Fusion Live Sessions',date:'2026-12-05',area:'KLCC, KL',genre:'Live music',price:'RM 80',blurb:'Three artists, one band and an intimate room built for listening.'},
{title:'Dancehall and Soca Carnival',date:'2026-12-12',area:'Chow Kit, KL',genre:'Dancehall',price:'RM 55',blurb:'Island rhythms, costumes welcome, and a dance floor that does not stop.'},
{title:'Afromotion Countdown',date:'2026-12-31',area:'Venue to be announced, KL',genre:'Afrobeats',price:'RM 120',blurb:'Ring in the new year with our biggest lineup yet.'},
{title:'Rising Voices Open Mic',date:'2027-01-09',area:'Petaling Street, KL',genre:'Live music',price:'Free entry',blurb:'New singers, rappers and instrumentalists take the stage. Sign up at the door.'}];
const ARTISTS=[
{name:'Darling Sabrina',ini:'DS',genre:'Founder · Resident DJ · Amapiano',image:'assets/artist-darling-sabrina.webp',alt:'Darling Sabrina, Afromotion founder and resident DJ',blurb:'Singaporean DJ known as the #1 Amapiano Loving Queen.'},
{name:'DJ Pedro OIE',ini:'PO',genre:'Resident DJ · Events',image:'assets/artist-dj-pedro.webp',alt:'DJ Pedro OIE, Afromotion resident DJ',blurb:'A resident DJ, key contributor and long-term member of Afromotion.'},
{name:'Novxlist',ini:'N',genre:'DJ · Producer',image:'assets/artist-novxlist.webp',alt:'Novxlist, Afromotion roster artist',blurb:'Afromotion roster artist bringing a distinct sound to the stage.'}];
const NAV=[['index.html','Home'],['events.html','Events'],['artists.html','Artists'],['gallery.html','Gallery'],['merch.html','Merch'],['quiz.html','Quiz'],['about.html','About'],['contact.html','Contact']];
const QUIZ=[
['Chley','Which music genre is Chley primarily associated with?',['Maskandi','Gospel','Amapiano','Kwaito'],2],
['Chley','Which Tanzanian artist collaborated with Chley on “Komasava (Comment Ça Va)”?',['Diamond Platnumz','Burna Boy','Davido','Wizkid'],0],
['Chley','Which of these tracks features Chley alongside Pcee and EeQue?',['Awolowo','Vula Sekele','Joy Is Coming','Yahyuppiyah'],3],
['Chley','Which song features Chley alongside Ceeka RSA, Shakes & Les and DBN Gogo?',['Areyeng','Funk 55','Awolowo','Vula Sekele'],1],
['Chley',"Which country is Chley's music career most closely associated with?",['South Africa','Nigeria','Tanzania','Ghana'],0],
['031 Choppa',"What does 031 refer to in 031 Choppa's name?",['A Johannesburg postcode','A record label','His debut album number',"Durban's telephone area code"],3],
['031 Choppa','Which Costa Titch track is associated with 031 Choppa’s production work?',['Big Flexa','Areyeng','SuperStar','Nkalakatha'],1],
['031 Choppa','Which skill is 031 Choppa particularly known for?',['Classical violin','Opera singing','Beat-making and music production','Orchestral conducting'],2],
['031 Choppa','Which country is 031 Choppa associated with as a music producer?',['South Africa','Nigeria','Ghana','Kenya'],0],
['031 Choppa','Which artist is associated with South African hip-hop and has worked in the same music scene as 031 Choppa?',['Kizz Daniel','Diamond Platnumz','Blxckie','Fido'],2],
['Fido','Which song brought Nigerian singer Fido widespread attention?',['Eloyi','Awolowo','Vula Sekele','Yahyuppiyah'],1],
['Fido','Which country is Fido, the singer of “Awolowo” and “Joy Is Coming,” from?',['South Africa','Ghana','Tanzania','Nigeria'],3],
['Fido','Which artist joined Fido on the remix of “Joy Is Coming”?',['Kizz Daniel','Focalistic','Costa Titch','Uncle Waffles'],0],
['Fido','Which Fido song became widely known for its uplifting message?',['Areyeng','Funk 55','Joy Is Coming','Vula Sekele'],2],
['Fido','Which of these is another song associated with Fido?',['Komasava','Awolowo','Eloyi','Yahyuppiyah'],1],
['Eemoh','Which artist collaborated with Eemoh on “Vula Sekele”?',['Harry Cane','Diamond Platnumz','Blxckie','Kizz Daniel'],0],
['Eemoh','Which genre is Eemoh best known for?',['Heavy metal','Country music','Classical music','Amapiano'],3],
['Eemoh',"What is Eemoh's real name?",['Linda Mnisi','Awosika Olayemi Josiah','Nqubeko Mbuliso Shangase','Minenhle Lesley Mnguni'],2],
['Eemoh',"Which country is Eemoh's music career associated with?",['Nigeria','South Africa','Tanzania','Ghana'],1],
['Eemoh','Which song title is associated with Eemoh?',['Awolowo','Areyeng','Big Flexa','Masithokoze'],3],
['LeeMcKrazy',"What is LeeMcKrazy's real name?",['Nqubeko Mbuliso Shangase','Awosika Olayemi Josiah','Linda Mnisi','Minenhle Lesley Mnguni'],2],
['LeeMcKrazy','Which South African township is LeeMcKrazy closely associated with?',['Soweto','KwaMashu','Mdantsane','Alexandra'],0],
['LeeMcKrazy','Which song helped LeeMcKrazy break through in 2021?',['Joy Is Coming','Eloyi','Awolowo','Komasava'],1],
['LeeMcKrazy','Which catchphrase is LeeMcKrazy famous for?',['Joy Is Coming!','Areyeng!','Vula Sekele!','Bare ke Leemecke!'],3],
['LeeMcKrazy','Which music genre is LeeMcKrazy primarily associated with?',['Amapiano','Reggae','Country','Heavy metal'],0]
];
const $=id=>document.getElementById(id),page=document.body.dataset.page;
const links=NAV.map(([h,l])=>`<a href="${h}"${h.startsWith(page)?' aria-current="page"':''}>${l}</a>`).join('');
const brand=`<a class="brand" href="index.html"><img src="assets/logo.webp" alt="" width="720" height="720"><span>Afromotion</span></a>`;
$('top').innerHTML=`<div class="wrap bar">${brand}<button class="menu" aria-expanded="false" aria-controls="nav">Menu</button><nav id="nav">${links}<label class="theme-picker"><span class="sr-only">Choose a theme</span><select id="theme-picker" aria-label="Choose a theme"><option value="dark">Dark</option><option value="light">Light</option><option value="ocean">Ocean Breeze</option><option value="sunset">Sunset Serenity</option></select></label><a class="btn sm" href="contact.html">Book with us</a></nav></div>`;
$('foot').innerHTML=`<div class="wrap">${brand}<p>Events and artists in Kuala Lumpur, Malaysia.</p><small>&copy; ${new Date().getFullYear()} Afromotion</small></div>`;
const mb=document.querySelector('.menu'),nv=$('nav');
mb.onclick=()=>mb.setAttribute('aria-expanded',nv.classList.toggle('open'));
const themePicker=$('theme-picker');
const setTheme=theme=>{
  document.documentElement.dataset.theme=theme;
  themePicker.value=theme;
};
setTheme(['dark','light','ocean','sunset'].includes(document.documentElement.dataset.theme)?document.documentElement.dataset.theme:'dark');
themePicker.onchange=()=>{
  const theme=themePicker.value;
  localStorage.setItem('afromotion-theme',theme);
  setTheme(theme);
};

const evRow=e=>{const d=new Date(e.date+'T00:00');return `<article class="ev"><div class="date"><b>${d.getDate()}</b><span>${d.toLocaleDateString('en-MY',{month:'short'})}</span></div><div><h3>${e.title}</h3><p>${e.blurb}</p><p class="meta">${e.area}. ${e.genre}. ${e.price}</p></div><a class="btn ghost sm" href="contact.html?e=${encodeURIComponent(e.title)}">Reserve a spot</a></article>`};
const artTile=a=>`<article class="art"><img src="${a.image}" alt="${a.alt}" loading="lazy" decoding="async"><h3>${a.name}</h3><p class="g">${a.genre}</p><p>${a.blurb}</p></article>`;

if($('next'))$('next').innerHTML=EVENTS.slice(0,3).map(evRow).join('');
if($('feat'))$('feat').innerHTML=ARTISTS.slice(0,4).map(artTile).join('');
if($('artists'))$('artists').innerHTML=ARTISTS.map(artTile).join('');
if($('gallery'))$('gallery').innerHTML=[
  ['assets/guest-chley.webp','Chley performing at an Afromotion event','Guest artist · Chley','guest',900,1125],
  ['assets/guest-leemckrazy.webp','LeeMcKrazy at an Afromotion event','Guest artist · LeeMcKrazy','guest',900,900],
  ['assets/guest-eemoh.webp','Eemoh at an Afromotion event','Guest artist · Eemoh','guest',900,900],
  ['assets/guest-031-choppa.webp','031 Choppa at an Afromotion event','Guest artist · 031 Choppa','guest',900,613],
  ['assets/guest-fido.webp','Fido at an Afromotion event','Guest artist · Fido','guest',900,900],
  ['assets/gallery-dancefloor.webp','Dancefloor moments','Afromotion nights','',1200,1214],
  ['assets/gallery-crowd.webp','Together on the dancefloor','Afromotion nights','',1200,1214],
  ['assets/gallery-event-1.webp','Afromotion event moments','Afromotion nights','',1000,1005],
  ['assets/gallery-event-2.webp','Afromotion event moments','Afromotion nights','',1000,1005],
  ['assets/gallery-event-3.webp','Afromotion event moments','Afromotion nights','',1000,1042],
  ['assets/gallery-vuka-poster.webp','Vuka 4.0 event poster','Event artwork','poster',900,1272],
  ['assets/gallery-vuka-tables.webp','Vuka 4.0 table layout','Event artwork','poster',900,1272]
].map(([src,alt,caption,style,width,height])=>`<figure class="${style}"><img src="${src}" alt="${alt}" loading="lazy" decoding="async" width="${width}" height="${height}"><figcaption>${caption}</figcaption></figure>`).join('');
if($('events')){
  const genres=['All',...new Set(EVENTS.map(e=>e.genre))];
  const show=g=>{$('events').innerHTML=EVENTS.filter(e=>g==='All'||e.genre===g).map(evRow).join('');
    $('chips').querySelectorAll('button').forEach(b=>b.setAttribute('aria-pressed',b.textContent===g))};
  $('chips').innerHTML=genres.map(g=>`<button class="chip" type="button">${g}</button>`).join('');
  $('chips').onclick=e=>{if(e.target.matches('button'))show(e.target.textContent)};
  show('All');
}
if($('quiz')){
  let questionIndex=0,score=0;
  const renderQuestion=()=>{
    const [round,question,options]=QUIZ[questionIndex];
    $('quiz').innerHTML=`<form id="quiz-form">
      <p class="quiz-round">Round ${Math.floor(questionIndex/5)+1}: ${round}</p>
      <progress class="quiz-progress" max="${QUIZ.length}" value="${questionIndex+1}" aria-label="Question ${questionIndex+1} of ${QUIZ.length}"></progress>
      <p>Question ${questionIndex+1} of ${QUIZ.length}</p>
      <h2>${question}</h2>
      <fieldset class="quiz-options"><legend>Choose one answer</legend>
        ${options.map((option,i)=>`<label class="quiz-option"><input type="radio" name="answer" value="${i}" required><span><strong>${String.fromCharCode(65+i)}.</strong> ${option}</span></label>`).join('')}
      </fieldset>
      <p class="quiz-feedback" id="quiz-feedback" role="status"></p>
      <div class="quiz-actions"><button class="btn" type="submit">Check answer</button></div>
    </form>`;
    const form=$('quiz-form');
    form.onsubmit=e=>{
      e.preventDefault();
      const selected=Number(new FormData(form).get('answer'));
      if(!Number.isInteger(selected))return;
      const correct=selected===QUIZ[questionIndex][3];
      if(correct)score++;
      form.querySelectorAll('input').forEach(input=>input.disabled=true);
      $('quiz-feedback').textContent=correct
        ?'Correct!'
        :`Not quite. The answer is ${String.fromCharCode(65+QUIZ[questionIndex][3])}. ${options[QUIZ[questionIndex][3]]}.`;
      const next=form.querySelector('button[type="submit"]');
      next.type='button';
      next.textContent=questionIndex===QUIZ.length-1?'See your score':'Next question';
      next.onclick=()=>{
        if(questionIndex===QUIZ.length-1){
          $('quiz').innerHTML=`<div class="quiz-result"><p class="quiz-round">Quiz complete</p><h2>Your score</h2><strong>${score}/${QUIZ.length}</strong><p>You got ${score} of ${QUIZ.length} questions right.</p><button class="btn" id="quiz-restart" type="button">Play again</button></div>`;
          $('quiz-restart').onclick=()=>{questionIndex=0;score=0;renderQuestion()};
        }else{questionIndex++;renderQuestion()}
      };
    };
  };
  renderQuestion();
}
if($('cf')){
  const params=new URLSearchParams(location.search),event=params.get('e'),type=params.get('type');
  if(event){$('type').value='Attend an event';$('msg').value=`I'd like to reserve a spot for ${event}.`}
  else if(type==='merch'){$('type').value='Merch enquiry';$('msg').value='I am interested in Afromotion merch. Please let me know about available sizes, stock and delivery.'}
  $('cf').onsubmit=e=>{e.preventDefault();
    const s=`${$('type').value} - ${$('name').value}`,b=`${$('msg').value}\n\nFrom: ${$('name').value} (${$('email').value})`;
    location.href=`mailto:hello@afromotion.my?subject=${encodeURIComponent(s)}&body=${encodeURIComponent(b)}`};
}
EOF

# ---------------------------------------------------------------- HTML
HEAD1='<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>'
HEAD2='</title><script>const t=localStorage.getItem("afromotion-theme");document.documentElement.dataset.theme=["dark","light","ocean","sunset"].includes(t)?t:"dark"</script><link rel="icon" href="assets/favicon.webp" type="image/webp"><link rel="preconnect" href="https://fonts.googleapis.com"><link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;600&family=Big+Shoulders+Display:wght@800&display=swap" rel="stylesheet"><link rel="stylesheet" href="css/style.css?v=13"><script src="js/main.js?v=13" defer></script></head>'

{ printf '%s' "$HEAD1"; printf '%s' 'Afromotion | Afro sound, live in Kuala Lumpur'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="index"><header id="top"></header><main>
<div class="wrap hero">
  <div>
    <h1>Afro sound, live in Kuala Lumpur.</h1>
    <p>Afromotion hosts events and artists across KL, from rooftop sundowners to full-night shows.</p>
    <div class="acts"><a class="btn" href="events.html">See upcoming events</a><a class="btn ghost" href="contact.html">Book an artist</a></div>
  </div>
  <img src="assets/logo.webp" alt="Afromotion circular logo" width="720" height="720" fetchpriority="high">
</div>
<section class="event-feature" aria-labelledby="featured-event-title"><div class="wrap">
  <img src="assets/gallery-vuka-poster.webp" alt="Vuka 4.0 event poster for Thursday, 22 October 2026" width="900" height="1272" fetchpriority="high">
  <div>
    <p class="eyebrow">Upcoming · Thursday, 22 October 2026 · 10 PM till late</p>
    <h2 id="featured-event-title">Vuka 4.0</h2>
    <p>S3R Management and Afromotion present a night of Afrobeats, Amapiano, Afrohouse, 3 Step, Gqom, Bacardi, Hiplife, Azonto and Afroswing.</p>
    <p class="lineup">Darling Sabrina · DJ Pedro · DJ Jacob · The Novxlist · MC Popolly</p>
    <p><a class="btn" href="contact.html?e=Vuka%204.0">Ask about the event</a></p>
  </div>
</div></section>
<section class="light"><div class="wrap">
  <h2>Coming up</h2>
  <div id="next"></div>
  <p class="more"><a class="btn" href="events.html">See all events</a></p>
</div></section>
<section class="dark"><div class="wrap">
  <h2>On the roster</h2>
  <div class="grid" id="feat"></div>
  <p class="more"><a class="btn ghost" href="artists.html">Meet every artist</a></p>
  <p class="more"><a class="btn ghost" href="gallery.html">See the gallery</a> <a class="btn ghost" href="merch.html">Shop merch</a> <a class="btn ghost" href="quiz.html">Play the quiz</a></p>
</div></section>
<section class="light"><div class="wrap">
  <h2>Planning a night in KL?</h2>
  <p>Tell us the date, the crowd and the sound you want. We will match you with the right artist.</p>
  <p class="more"><a class="btn" href="contact.html">Book with us</a></p>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/index.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Events | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="events"><header id="top"></header><main>
<div class="wrap head"><h1>Events</h1><p>Nights hosted by Afromotion across Kuala Lumpur. Pick a sound to filter the list.</p></div>
<section class="light"><div class="wrap">
  <div class="chips" id="chips" aria-label="Filter events by genre"></div>
  <div id="events"></div>
  <p class="more"><a class="btn" href="https://docs.google.com/forms/d/e/1FAIpQLSfQC8eCt1DEnzn9hhphoHPb_hJdFJa59De1ORRLXdsypekGtw/closedform?pli=1" target="_blank" rel="noopener noreferrer">Register for an event</a></p>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/events.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Artists | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="artists"><header id="top"></header><main>
<div class="wrap head"><h1>Artists</h1><p>Meet our resident DJs and featured Afromotion roster. Book an artist for your event, or join the roster.</p></div>
<section class="dark"><div class="wrap">
  <p class="resident-note"><strong>Resident DJs:</strong> Darling Sabrina (DJ Sabrina) and DJ Pedro OIE.</p>
</div></section>
<section class="dark"><div class="wrap"><div class="grid" id="artists"></div></div></section>
<section class="light"><div class="wrap">
  <h2>Want to perform with us?</h2>
  <p>Send us a link to your music and a few lines about your sound.</p>
  <p class="more"><a class="btn" href="https://docs.google.com/forms/d/e/1FAIpQLSfWT_cY_lCKaKW-yvIfQasSVsxBiD6dR3Fmvhb6MfXSwaF3MQ/viewform" target="_blank" rel="noopener noreferrer">Join the team</a> <a class="btn ghost" href="contact.html">Get in touch</a></p>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/artists.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Quiz | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="quiz"><header id="top"></header><main>
<div class="wrap head"><h1>Quiz</h1><p>Take the Afromotion quiz: 25 questions across five rounds. See how well you know the artists who have hosted our events.</p></div>
<section class="light"><div class="wrap quiz-shell">
  <div id="quiz" aria-live="polite"></div>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/quiz.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Gallery | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="gallery"><header id="top"></header><main>
<div class="wrap head"><h1>Gallery</h1><p>Artists who have performed at Afromotion, plus scenes and artwork from our nights in Kuala Lumpur.</p></div>
<section class="dark"><div class="wrap">
  <div class="gallery" id="gallery"></div>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/gallery.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Merch | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="merch"><header id="top"></header><main>
<div class="wrap head"><h1>Wear the rhythm.</h1><p>Afromotion gear for the dancefloor and everywhere after.</p></div>
<section class="dark"><div class="wrap merch-grid">
  <article class="merch-card">
    <div class="merch-photos">
      <img src="assets/merch-front.webp" alt="Front of the black Afromotion logo T-shirt" loading="lazy" decoding="async" width="900" height="1135">
      <img src="assets/merch-back.webp" alt="Back of the black Afromotion T-shirt with a large circular print" loading="lazy" decoding="async" width="900" height="1135">
    </div>
    <p class="eyebrow">Afromotion essentials</p>
    <h2>Logo T-shirt</h2>
    <p class="merch-price">RM 120 MYR</p>
    <p>Black tee with the Afromotion mark on the front and a bold culture print on the back. Ask us about available sizes and current stock.</p>
    <a class="btn" href="contact.html?type=merch">Ask about this tee</a>
  </article>
</div></section>
<section class="light"><div class="wrap">
  <h2>Want one?</h2>
  <p>Send us a message and we will confirm availability, sizing and delivery options. This preview does not take payment or reserve stock.</p>
  <p class="more"><a class="btn" href="contact.html?type=merch">Enquire about merch</a></p>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/merch.html"

{ printf '%s' "$HEAD1"; printf '%s' 'About | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="about"><header id="top"></header><main>
<div class="wrap head"><h1>Built on Afro rhythm. Made in KL.</h1><p>Afromotion is shaped by the people who build the nights, champion the music and bring the community together.</p></div>
<section class="light"><div class="wrap founders">
  <img src="assets/founders.webp" alt="Afromotion founders Darling Sabrina and Saint Ben" loading="lazy" decoding="async" width="1100" height="1385">
  <div class="profile-copy">
    <p class="eyebrow">Afromotion founders &amp; business partners</p>
    <h2>Darling Sabrina &amp; Saint Ben</h2>
    <h3>Darling Sabrina</h3>
    <p>Singaporean DJ, Afromotion co-founder and resident DJ, known as the #1 Amapiano Loving Queen.</p>
    <h3>Saint Ben</h3>
    <p>Afromotion co-founder, international events manager and entrepreneur.</p>
    <h3>Olivia Thompson</h3>
    <p>Key contributor and long-term member of Afromotion.</p>
  </div>
</div></section>
<section class="dark"><div class="wrap">
  <p class="eyebrow">Resident DJs</p><h2>Setting the sound</h2>
  <div class="contributors">
    <article><h3>DJ Pedro OIE</h3><p>Resident DJ, key contributor and long-term member of Afromotion.</p></article>
    <article><h3>DJ Sabrina</h3><p>Resident DJ and Afromotion co-founder Darling Sabrina.</p></article>
  </div>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/about.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Contact | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="contact"><header id="top"></header><main>
<div class="wrap head"><h1>Book with us</h1><p>Reserve a spot, book an artist or ask about working together. We reply within two working days.</p></div>
<section class="light"><div class="wrap two">
  <form id="cf">
    <label>Your name<input id="name" required autocomplete="name"></label>
    <label>Email<input id="email" type="email" required autocomplete="email"></label>
    <label>What do you need?<select id="type"><option>Attend an event</option><option>Book an artist</option><option>Perform with us</option><option>Partnerships</option><option>Merch enquiry</option></select></label>
    <label>Message<textarea id="msg" required></textarea></label>
    <button class="btn" type="submit">Send message</button>
    <p class="note">This opens your email app with the message ready to send.</p>
  </form>
  <div>
    <h3>Email</h3><p>hello@afromotion.my</p>
    <h3>Instagram</h3><p><a href="https://www.instagram.com/afromotion.my/" target="_blank" rel="noopener noreferrer">@afromotion.my</a></p>
    <h3>WhatsApp</h3><p><a href="https://chat.whatsapp.com/IAi0Buv0yiCJoQYsTALhwL?utm_source=ig&amp;utm_medium=social&amp;utm_content=link_in_bio&amp;fbclid=PAZXh0bgNhZW0CMTEAcGRvZgJzcnRjBmFwcF9pZA85MzY2MTk3NDMzOTI0NTkAAafCaODB1TxM9svgQGRpdqAD9LkDrig98skl8z3MPXJZ6Cp0n85NGxgqR4tW1A_aem_Nq_6H8v2apRK1310I6hDLg" target="_blank" rel="noopener noreferrer">Join the Afromotion WhatsApp community</a></p>
    <p class="more"><a class="btn" href="https://docs.google.com/forms/d/e/1FAIpQLSfWT_cY_lCKaKW-yvIfQasSVsxBiD6dR3Fmvhb6MfXSwaF3MQ/viewform" target="_blank" rel="noopener noreferrer">Join the team</a></p>
    <h3>Based in</h3><p>Kuala Lumpur, Malaysia</p>
  </div>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/contact.html"

echo "Done. Site created in: $DIR"
echo "Preview it with:  cd $DIR && python3 -m http.server 8000   then open http://localhost:8000"
