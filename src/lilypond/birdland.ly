\version "2.18.2"
%%%myStaffSize = #26
%%%#(set-global-staff-size myStaffSize)
\header {
  title="Birdland"
  composer="Joe Zawinul"
  subtitle = "Weather Report"
  %poet = "Poete"
  instrument = "Piano"
  %meter=\markup {\bold {"Remarque sur le rhythme"}}
  style = "Jazz"
  maintainer = "Alexandre Touret"
  maintainerEmail = "alexandre.touret@free.fr"
  maintainerWeb = "http://blog.touret.info"
  lastupdated = ""
  source = "Music room"
  footer = "Footer"
}

%%%% RELATIVE A MODIFIER + TEMPO+ CLE

upper=
\relative c''{

  \clef treble
  \time 4/4
  \tempo 4=160
  \key f \major
  
  R1*23
  
  r2 r4 r8\f <c, f aes>~
  
  <c f aes>4  <bes ees g>8 <bes ees g>8 r4 r8 <bes ees g>~
  <bes ees g>4 <aes des f>8 <aes des f>8 r4 r8 <bes ees g>~
  <bes ees g> <bes ees g> <g bes ees> <g bes ees> r4 r8 <bes ees g>8~ -^
  <bes ees g>4 <aes des f>8 <aes des f> r4 r8 <bes ees g>8~
  <bes ees g>4 <a d f>8-- <a d f>-^ r4 r8 <c f aes>
  r4 <bes ees g>2-> r4
  r8 f'8 ( g gis a4) f
  <c f aes>4 <bes ees g>2~ <bes ees g>8 r8
  
  r1
  r2 r8\mf bes-- c-- <bes ees>~->
  <bes ees>4 c bes r8 bes
  r4 bes r8 bes-- c-- <bes ees>~
  <bes ees>4 c bes r8 a
  r4 a\f r8 bes' c <f, bes ees>~
  <f bes ees>4 <f bes c> <f bes > r8 <f bes >
  r4 <f bes >4 r8 bes c <f, c' ees>~
  <f c' ees>4 <f bes c> <f bes c> r  \bar "||"

  r1\segno
  R1*8
  r2 r4 r8 <ees g a c>8~
  <ees g a c>2 <ees ges>
  <d f>8 <d f> r <d f> r <d f> r c~->
  
  c4 d8. c16 f4 r8 <d f>~->
  <d f>4 <d f a> <d f> r8 <d f a c>~
  <d f a c>1
  <d f>8-- <d f> r <d f> r <d f> r <c f a>~
  <c f a>4 <a d g> <c d f> r8 <c d f>~->
  <c d f>4  <a ees' f>4 <aes d f> r8 <c e g>~->
  <c e g>2 <c ees ges>
  
  <bes d f>8-- <bes d f> r <bes d f> r <bes d f> r <c f a>~
  <c f a>4 <c f a> <c d f> r8 <c d f>~->
  <c d f>4 <a ees' f> <aes ees' f> r8 <c e g>~->
  <c e g>2 \mark \markup "To Coda" <c ees ges>
  
  <bes d f>8 <bes d f> r <bes d f> r <bes d f> r <c f>~
  <c f>1 \>
  r4\! <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 <c f>4~
  <c f> <c f>2 r8 <g' c ees>~
  <g c ees>4 <fis b d> <f b des> <e a c>
  <ees aes ces> <d g bes> <cis f a> r8 <g' c ees>~
  <g c ees>4 <fis b d> <f b des> <e a c>
  <ees aes ces> <d g bes> <cis f a> r8 <g' c ees>~
  <g c ees>4 <fis b d> <f b des> <e a c>
  <ees aes ces> <d g bes> <cis f a> r8 <g' c ees>~->
  <g c ees>4 <fis b d> <f b des> <e a c>
  <ees aes ces> <d g bes> <cis f a> r4
  \compressFullBarRests
  R1*2
  
  R1*8
  
  %%%% CODA
  \break
  
    % Coda on new line, use this:
    %%%\once \override Score.RehearsalMark.extra-offset = #'( -5 . .5 )
    %%%\once \override Score.RehearsalMark.font-size = #5
    %%%\mark \markup { \musicglyph "scripts.coda" }
     
 
 <bes d f>8\coda \mark \markup "Coda" <bes d f> r <bes d f> r <bes d f> r <bes d f>~
  <bes d f>1
  r
  r2 r4 d8\ff f \bar "|."

}

lower=
\relative c{
  \clef bass
  \time 4/4
  \tempo 4=160
  \key f \major
  %% intro
  %%1
  a2 bes4. c8~- >
  c1
  a2 bes4 c8 f~ ->
  f1
  a,2 bes4. c8~->
  c1
  a2 bes4 c8 f~ ->
  %%8
  f2.~ f8 a,~ ->
  a2 bes4. c8~- >
  c2. c8 a~ 
  a2 bes4 c8 f~ ->
  f2.~ f8 a,~ ->
  a2 bes4. c8~->
  %%14
  c2.~ c8 a~ ->
  a2 bes4 c8 f~->
  f2.~ f8 a,~->
  a2  bes4. c8~
  c2. c8 a->
  a2 bes4 c8-- f~->
  %%20
  f2.~ f8 a,~
  a2 bes4. c8~->
  c2.~ c8 a~->
  a2 bes4 c8 f~->
  f2.~ f8 f,~->
  %%25
  f2 f8-- g-^ r aes~
  aes2 aes8-- bes-^ r c~
  c2 f,8-- g-^ r bes~
  %%28
  bes2 bes8 g aes a~ 
  a c d f~ f4. bes,8->
  r8 c des2.->
  f,4-> g-> aes-> a->
  %%32
  bes4-> bes2~-> bes8 f~
  f4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'
  f,4 f' f, f'8\mf f,~-> \bar "||"
  
  f4 a d r8 a~->
  a4 bes b r
  a8-- a r a d-- d-- r d->
  g,-- a r bes r b r c
  
  f4-> a, d r8 bes~->
  bes4 b c r8 f,
  bes-- bes r f bes-- bes r f->
  bes-- g r d r c r f~ 
  
  f4 a d r8 a~->
  a4 bes b r
  a8 a r a d d r d 
  e, f r bes r b r c
  
  
  f,4 a d r8 bes~->
  bes4 b c r8 bes~
  bes1 
  bes8-- g r d r c \f r f~->
  
  f4 a d r8 c~->
  c4 b bes r8 a~->
  a2 d
  
  g,8-- a r bes r c r f~
  f4 e d r8 c~->
  c4 b bes r8 a~->
  a2 d, \bar "||"
  
  g8 a r bes r c r f,~
  f f f' f,~ f f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f' f,~
  f f f' f,~ f f f'\ff f~
  
  f4 e ees d
  des4 c e ees8 f~
  f4 e ees d des c e ees8 f~
  f4 e ees d des c b\mp bes8\ff f'~->
  f4\dim e ees d
  des4 c b\mp r
  \compressFullBarRests
  R1*2
  
  
  a2\mp bes 4. c8~->
  c1
  a2 bes4 c8 f~->
  f1 
  a,2 bes4. c8~->
  c1
  a2 bes4 c8 f~->
  f2. r8 f,\mf
  %% CODA
    
  g8 a r bes r c r <c, c'>~
  <c c'>1 
  r
  r2 r4 d8 f \bar "|."

}

accords = \chordmode {
  \set noChordSymbol = "" 
  \small{
    R1*73
    r2 r4 r8 f:9
    f4:9 e:9 ees:9 d:9
    des:9 c:9 b:9 f:9
    f4:9 e:9 ees:9 d:9
    des:9 c:9 b:9 f:9
    f4:9 e:9 ees:9 d:9
    des:9 c:9 b:9 f:9
    f4:9 e:9 ees:9 d:9
    des:9 c:9 b4:9 r
   R1*10
   %% CODA
   R1*4
  }
}
\score {
  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Piano"
    \new Staff = "upper"  \transpose f g \upper
    \new Staff = "lower" \transpose f g \lower
    \context ChordNames {
      \set chordChanges = ##t
     \transpose f g \accords
    }
  >>
  \layout{
    \context {
      \ChordNames
      alignAboveContext = #"upper"
      \override VerticalAxisGroup  #'minimum-Y-extent = #'(-0 . 0)
    }
  }
  \midi { }
}
