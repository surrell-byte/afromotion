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
      const correctAnswer=QUIZ[questionIndex][3];
      const correct=selected===correctAnswer;
      if(correct)score++;
      form.querySelectorAll('.quiz-option').forEach((option,i)=>{
        const input=option.querySelector('input');
        input.disabled=true;
        if(i===correctAnswer)option.classList.add('is-correct');
        else if(i===selected)option.classList.add('is-incorrect');
      });
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
