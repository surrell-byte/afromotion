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
const brand=`<a class="brand" href="index.html"><img src="assets/logo.webp" alt="" width="720" height="720"><span>Afromotion</span></a>`;
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
  ['assets/gallery-dancefloor.webp','Dancefloor moments','Afromotion nights','',1200,1214],
  ['assets/gallery-crowd.webp','Together on the dancefloor','Afromotion nights','',1200,1214],
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
if($('cf')){
  const params=new URLSearchParams(location.search),event=params.get('e'),type=params.get('type');
  if(event){$('type').value='Attend an event';$('msg').value=`I'd like to reserve a spot for ${event}.`}
  else if(type==='merch'){$('type').value='Merch enquiry';$('msg').value='I am interested in Afromotion merch. Please let me know about available sizes, stock and delivery.'}
  $('cf').onsubmit=e=>{e.preventDefault();
    const s=`${$('type').value} - ${$('name').value}`,b=`${$('msg').value}\n\nFrom: ${$('name').value} (${$('email').value})`;
    location.href=`mailto:hello@afromotion.my?subject=${encodeURIComponent(s)}&body=${encodeURIComponent(b)}`};
}
