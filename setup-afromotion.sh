#!/usr/bin/env bash
# Builds the Afromotion multipage website.
# Usage: bash setup-afromotion.sh [target-folder]   (default: ./afromotion)
set -euo pipefail

DIR="${1:-afromotion}"
HERE="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$DIR"/{css,js,assets}

if [ -f "$HERE/assets/images/am-logo.png" ]; then
  cp "$HERE/assets/images/am-logo.png" "$DIR/assets/logo.png"
  cp "$HERE/assets/images/am-favicon.png" "$DIR/assets/favicon.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.28.45.png" "$DIR/assets/merch-back.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.29.05.png" "$DIR/assets/merch-front.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.30.11.png" "$DIR/assets/gallery-dancefloor.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.30.22.png" "$DIR/assets/gallery-crowd.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.31.27.png" "$DIR/assets/gallery-vuka-poster.png"
  cp "$HERE/assets/images/Screenshot 2026-10-16 at 01.31.42.png" "$DIR/assets/gallery-vuka-tables.png"
else
  echo "Note: put am-logo.png next to this script and re-run to add the logo."
fi

# ---------------------------------------------------------------- CSS
cat > "$DIR/css/style.css" <<'EOF'
:root{color-scheme:dark;--ink:#000;--paper:#fff;--ring:#2b3037;--mute:#9aa1aa;--mist:#eceef0;--section-muted:#4b525b;--btn-hover:var(--paper);--d:'Big Shoulders Display',Impact,sans-serif;--b:'Archivo',system-ui,sans-serif}
:root[data-theme="light"]{color-scheme:light;--ink:#f4f1eb;--paper:#171717;--ring:#d6d0c7;--mute:#625f59;--mist:#e8e3dc;--section-muted:#aaa59c;--btn-hover:var(--ink)}
*{box-sizing:border-box;margin:0}
body{background:var(--ink);color:var(--paper);font:400 1.0625rem/1.6 var(--b)}
img{max-width:100%;display:block}
a{color:inherit}
:focus-visible{outline:3px solid currentColor;outline-offset:3px}
.wrap{width:min(1120px,100% - 2.5rem);margin-inline:auto}
h1,h2,h3{font-family:var(--d);font-weight:800;line-height:.95;letter-spacing:.01em}
h1{font-size:clamp(3.2rem,9vw,7rem)}
h2{font-size:clamp(2.4rem,6vw,4.2rem);margin-bottom:1.25rem}
h3{font-size:1.9rem;line-height:1;margin-bottom:.4rem}
p{max-width:62ch}
header{position:sticky;top:0;z-index:9;background:var(--ink);border-bottom:1px solid var(--ring)}
.bar{display:flex;align-items:center;justify-content:space-between;gap:1rem;padding-block:.5rem}
.brand{display:flex;align-items:center;gap:.75rem;text-decoration:none;font:800 1.6rem var(--d);letter-spacing:.04em}
#nav{display:flex;align-items:center;gap:1.5rem}
#nav a:not(.btn){text-decoration:none;color:var(--mute);padding-block:.5rem}
#nav a:not(.btn):hover,#nav a[aria-current]{color:var(--paper)}
#nav a[aria-current]{box-shadow:0 2px 0 var(--paper)}
.menu{display:none}
.theme-toggle{width:2.75rem;height:2.75rem;display:grid;place-items:center;background:transparent;color:inherit;border:2px solid var(--ring);font:600 1.25rem var(--b);cursor:pointer}
.btn{display:inline-block;background:var(--paper);color:var(--ink);font:600 1rem var(--b);text-decoration:none;padding:.85rem 1.6rem;border:2px solid var(--paper);cursor:pointer}
.btn:hover{background:transparent;color:var(--btn-hover)}
.btn.ghost{background:transparent;color:inherit;border-color:currentColor}
.btn.ghost:hover{color:var(--paper)}
.dark .btn.ghost:hover{background:var(--paper);color:var(--ink)}
.light .btn{background:var(--ink);color:var(--paper);border-color:var(--ink)}
.light .btn:hover{background:transparent;color:var(--ink)}
.light .btn.ghost{background:transparent;color:var(--ink)}
.light .btn.ghost:hover{background:var(--ink);color:var(--paper)}
.btn.sm{padding:.55rem 1.1rem;font-size:.95rem}
.hero{display:grid;grid-template-columns:1.2fr .8fr;align-items:center;gap:2rem;min-height:calc(100svh - 62px);padding-block:3rem}
.hero p{font-size:1.25rem;color:var(--mute);margin:1.5rem 0 2rem}
.acts{display:flex;gap:1rem;flex-wrap:wrap}
.hero img{width:min(100%,520px);margin-inline:auto;animation:rise 1.2s cubic-bezier(.2,.7,.2,1) both}
@keyframes rise{from{opacity:0;transform:scale(.88) rotate(-6deg)}}
section{padding-block:5rem}
.head{padding-block:4rem 5rem}
.head p{color:var(--mute);font-size:1.2rem;margin-top:1.25rem}
.light{background:var(--paper);color:var(--ink);clip-path:polygon(0 4vw,50% 0,100% 4vw,100% 100%,0 100%);padding-top:calc(4vw + 4rem)}
.ev{display:grid;grid-template-columns:5.5rem 1fr auto;gap:1.5rem;align-items:center;padding-block:1.5rem;border-top:2px solid var(--ink)}
.ev:last-child{border-bottom:2px solid var(--ink)}
.date{font-family:var(--d);text-align:center;line-height:.9}
.date b{display:block;font-size:3.6rem}
.date span{font-size:1.4rem;font-weight:700}
.meta{font-size:.95rem;color:var(--section-muted);margin-top:.4rem}
.chips{display:flex;gap:.6rem;flex-wrap:wrap;margin-bottom:2rem}
.chip{font:inherit;background:none;color:var(--ink);border:2px solid var(--ink);padding:.4rem 1rem;cursor:pointer}
.chip[aria-pressed=true]{background:var(--ink);color:var(--paper)}
.more{margin-top:2rem}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(230px,1fr));gap:2.5rem 2rem}
.mono{aspect-ratio:1;border-radius:50%;border:8px double var(--ring);display:grid;place-items:center;font:800 4.5rem var(--d);margin-bottom:1.1rem}
.art p{color:var(--mute);font-size:.98rem}
.art .g{color:var(--paper);font-weight:600}
.gallery{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:1.5rem}
.gallery figure{position:relative;overflow:hidden;background:var(--ring)}
.gallery figure.poster{background:#240404}
.gallery img{width:100%;height:100%;aspect-ratio:4/3;object-fit:cover;transition:transform .3s ease}
.gallery figure.poster img{object-fit:contain}
.gallery figure:hover img{transform:scale(1.03)}
.gallery figcaption{position:absolute;inset:auto 0 0;padding:2.5rem 1rem 1rem;background:linear-gradient(transparent,rgba(0,0,0,.8));font-weight:600}
.merch-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,280px),1fr));gap:2rem}
.merch-card{border:1px solid var(--ring);padding:1rem}
.merch-photos{display:grid;grid-template-columns:1fr 1fr;gap:.5rem;margin-bottom:1rem}
.merch-photos img{width:100%;aspect-ratio:4/5;object-fit:cover;background:var(--ring)}
.merch-card p{color:var(--mute)}
.merch-card .btn{margin-top:1rem}
.eyebrow{text-transform:uppercase;letter-spacing:.12em;font-size:.85rem;font-weight:600;color:var(--mute)}
.two{display:grid;grid-template-columns:1fr 1fr;gap:3rem}
.two h3{font-size:2.3rem}
.two p+h3{margin-top:2rem}
form{display:grid;gap:1.1rem}
label{display:grid;gap:.35rem;font-weight:600}
input,select,textarea{font:inherit;padding:.8rem;border:2px solid var(--ink);background:var(--paper);color:var(--ink);border-radius:0}
textarea{min-height:9rem}
.note{font-size:.9rem;color:var(--section-muted)}
footer{border-top:1px solid var(--ring);padding-block:3rem;color:var(--mute)}
footer .wrap{display:flex;justify-content:space-between;gap:1.5rem 2.5rem;flex-wrap:wrap;align-items:center}
footer .brand{color:var(--paper)}
footer nav{display:flex;gap:1.25rem;flex-wrap:wrap}
footer nav a{text-decoration:none}
footer nav a:hover{color:var(--paper)}
@media(max-width:800px){
.hero,.two{grid-template-columns:1fr}
.hero{min-height:0}
.hero img{width:min(70%,320px);order:-1}
.gallery{grid-template-columns:1fr}
.ev{grid-template-columns:4rem 1fr;gap:1rem}
.ev .btn{grid-column:2;justify-self:start}
.menu{display:block;background:none;color:inherit;border:2px solid var(--ring);padding:.4rem .9rem;font:inherit;cursor:pointer}
.bar{gap:.5rem}
.brand{gap:.4rem;font-size:1.3rem}
.brand img{width:36px;height:36px}
.theme-toggle{flex:none;width:2.5rem;height:2.5rem}
.menu{padding:.35rem .6rem}
#nav{display:none;position:absolute;left:0;right:0;top:100%;background:var(--ink);flex-direction:column;align-items:flex-start;padding:1rem 1.25rem 1.5rem;border-bottom:1px solid var(--ring)}
#nav.open{display:flex}
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
{name:'Kemi Adaeze',ini:'KA',genre:'Afro-soul vocalist',blurb:'Warm, unhurried vocals over live keys and guitar.'},
{name:'DJ Sahara K',ini:'SK',genre:'Amapiano DJ',blurb:'Deep log drums and long, patient builds.'},
{name:'Tobi and The Drift',ini:'TD',genre:'Afrobeats band',blurb:'A seven-piece live band that keeps the floor moving.'},
{name:'Zuri Mbeki',ini:'ZM',genre:'Dancehall and Afro-fusion',blurb:'High-energy sets that blend island and African rhythms.'},
{name:'Olu Kairo',ini:'OK',genre:'Percussionist',blurb:'Live percussion that joins DJs and bands on stage.'},
{name:'Nia Tembo',ini:'NT',genre:'Spoken word and host',blurb:'Hosts the night and holds the room together.'}];
const NAV=[['index.html','Home'],['events.html','Events'],['artists.html','Artists'],['gallery.html','Gallery'],['merch.html','Merch'],['about.html','About'],['contact.html','Contact']];
const $=id=>document.getElementById(id),page=document.body.dataset.page;
const links=NAV.map(([h,l])=>`<a href="${h}"${h.startsWith(page)?' aria-current="page"':''}>${l}</a>`).join('');
const brand=`<a class="brand" href="index.html"><img src="assets/logo.png" alt="" width="44" height="44"><span>Afromotion</span></a>`;
$('top').innerHTML=`<div class="wrap bar">${brand}<button class="theme-toggle" type="button" aria-label="Switch to light mode" aria-pressed="false">☼</button><button class="menu" aria-expanded="false" aria-controls="nav">Menu</button><nav id="nav">${links}<a class="btn sm" href="contact.html">Book with us</a></nav></div>`;
$('foot').innerHTML=`<div class="wrap">${brand}<p>Events and artists in Kuala Lumpur, Malaysia.</p><nav>${NAV.map(([h,l])=>`<a href="${h}">${l}</a>`).join('')}</nav><small>&copy; ${new Date().getFullYear()} Afromotion</small></div>`;
const mb=document.querySelector('.menu'),nv=$('nav');
mb.onclick=()=>mb.setAttribute('aria-expanded',nv.classList.toggle('open'));
const themeToggle=document.querySelector('.theme-toggle');
const setTheme=theme=>{
  document.documentElement.dataset.theme=theme;
  const light=theme==='light';
  themeToggle.textContent=light?'☾':'☼';
  themeToggle.setAttribute('aria-label',`Switch to ${light?'dark':'light'} mode`);
  themeToggle.setAttribute('aria-pressed',String(light));
};
setTheme(document.documentElement.dataset.theme==='light'?'light':'dark');
themeToggle.onclick=()=>{
  const theme=document.documentElement.dataset.theme==='dark'?'light':'dark';
  localStorage.setItem('afromotion-theme',theme);
  setTheme(theme);
};

const evRow=e=>{const d=new Date(e.date+'T00:00');return `<article class="ev"><div class="date"><b>${d.getDate()}</b><span>${d.toLocaleDateString('en-MY',{month:'short'})}</span></div><div><h3>${e.title}</h3><p>${e.blurb}</p><p class="meta">${e.area}. ${e.genre}. ${e.price}</p></div><a class="btn ghost sm" href="contact.html?e=${encodeURIComponent(e.title)}">Reserve a spot</a></article>`};
const artTile=a=>`<article class="art"><div class="mono" aria-hidden="true">${a.ini}</div><h3>${a.name}</h3><p class="g">${a.genre}</p><p>${a.blurb}</p></article>`;

if($('next'))$('next').innerHTML=EVENTS.slice(0,3).map(evRow).join('');
if($('feat'))$('feat').innerHTML=ARTISTS.slice(0,4).map(artTile).join('');
if($('artists'))$('artists').innerHTML=ARTISTS.map(artTile).join('');
if($('gallery'))$('gallery').innerHTML=[
  ['assets/gallery-dancefloor.png','Dancefloor moments','Afromotion nights'],
  ['assets/gallery-crowd.png','Together on the dancefloor','Afromotion nights'],
  ['assets/gallery-vuka-poster.png','Vuka 4.0 event poster','Event artwork','poster'],
  ['assets/gallery-vuka-tables.png','Vuka 4.0 table layout','Event artwork','poster']
].map(([src,alt,caption,style])=>`<figure class="${style||''}"><img src="${src}" alt="${alt}" loading="lazy"><figcaption>${caption}</figcaption></figure>`).join('');
if($('events')){
  const genres=['All',...new Set(EVENTS.map(e=>e.genre))];
  const show=g=>{$('events').innerHTML=EVENTS.filter(e=>g==='All'||e.genre===g).map(evRow).join('');
    $('chips').querySelectorAll('button').forEach(b=>b.setAttribute('aria-pressed',b.textContent===g))};
  $('chips').innerHTML=genres.map(g=>`<button class="chip" type="button">${g}</button>`).join('');
  $('chips').onclick=e=>{if(e.target.matches('button'))show(e.target.textContent)};
  show('All');
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
HEAD2='</title><script>document.documentElement.dataset.theme=localStorage.getItem("afromotion-theme")==="light"?"light":"dark"</script><link rel="icon" href="assets/favicon.png"><link rel="preconnect" href="https://fonts.googleapis.com"><link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;600&family=Big+Shoulders+Display:wght@800&display=swap" rel="stylesheet"><link rel="stylesheet" href="css/style.css"><script src="js/main.js" defer></script></head>'

{ printf '%s' "$HEAD1"; printf '%s' 'Afromotion | Afro sound, live in Kuala Lumpur'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="index"><header id="top"></header><main>
<div class="wrap hero">
  <div>
    <h1>Afro sound, live in Kuala Lumpur.</h1>
    <p>Afromotion hosts events and artists across KL, from rooftop sundowners to full-night shows.</p>
    <div class="acts"><a class="btn" href="events.html">See upcoming events</a><a class="btn ghost" href="contact.html">Book an artist</a></div>
  </div>
  <img src="assets/logo.png" alt="Afromotion logo" width="520" height="520">
</div>
<section class="light"><div class="wrap">
  <h2>Coming up</h2>
  <div id="next"></div>
  <p class="more"><a class="btn" href="events.html">See all events</a></p>
</div></section>
<section class="dark"><div class="wrap">
  <h2>On the roster</h2>
  <div class="grid" id="feat"></div>
  <p class="more"><a class="btn ghost" href="artists.html">Meet every artist</a></p>
  <p class="more"><a class="btn ghost" href="gallery.html">See the gallery</a> <a class="btn ghost" href="merch.html">Shop merch</a></p>
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
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/events.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Artists | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="artists"><header id="top"></header><main>
<div class="wrap head"><h1>Artists</h1><p>The vocalists, DJs, bands and hosts we work with. Book one for your event, or join the roster.</p></div>
<section class="dark"><div class="wrap"><div class="grid" id="artists"></div></div></section>
<section class="light"><div class="wrap">
  <h2>Want to perform with us?</h2>
  <p>Send us a link to your music and a few lines about your sound.</p>
  <p class="more"><a class="btn" href="contact.html">Get in touch</a></p>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/artists.html"

{ printf '%s' "$HEAD1"; printf '%s' 'Gallery | Afromotion'; printf '%s' "$HEAD2"; cat <<'EOF'
<body data-page="gallery"><header id="top"></header><main>
<div class="wrap head"><h1>Gallery</h1><p>Scenes, sounds and artwork from Afromotion nights in Kuala Lumpur.</p></div>
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
      <img src="assets/merch-front.png" alt="Front of the black Afromotion logo T-shirt" loading="lazy">
      <img src="assets/merch-back.png" alt="Back of the black Afromotion T-shirt with a large circular print" loading="lazy">
    </div>
    <p class="eyebrow">Afromotion essentials</p>
    <h2>Logo T-shirt</h2>
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
<div class="wrap head"><h1>Built on Afro rhythm. Made in KL.</h1><p>Afromotion is an entertainment company that hosts events and artists in Kuala Lumpur, Malaysia.</p></div>
<section class="light"><div class="wrap two">
  <div><h2>What we do</h2><p>We bring Afro sound to KL audiences and give artists a stage that treats them well. Every night we run is built around the music first.</p></div>
  <div>
    <h3>We host events</h3><p>Club nights, rooftop sessions, live shows and festivals, planned and run by our team.</p>
    <h3>We host artists</h3><p>We book, manage and present vocalists, DJs, bands and hosts, for our events and for yours.</p>
  </div>
</div></section>
<section class="dark"><div class="wrap two">
  <div><h3>Artists come first</h3><p>Clear terms, good sound and a proper welcome backstage.</p></div>
  <div><h3>Open to everyone in KL</h3><p>Our nights are for the whole city, whether you know the music or are hearing it for the first time.</p></div>
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
    <h3>Instagram</h3><p>@afromotion.my</p>
    <h3>Based in</h3><p>Kuala Lumpur, Malaysia</p>
  </div>
</div></section>
</main><footer id="foot"></footer></body></html>
EOF
} > "$DIR/contact.html"

echo "Done. Site created in: $DIR"
echo "Preview it with:  cd $DIR && python3 -m http.server 8000   then open http://localhost:8000"
