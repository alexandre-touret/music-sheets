\version "2.18.2"
myStaffSize = #16
#(set-global-staff-size myStaffSize)
\header {
  title="Summertime"
  composer="G. GERSHWIN"
  subtitle = ""
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
\relative c'{
  \clef treble
  \time 4/4
  \tempo 4=80
  \key c \major
<<
  %% anacrouse
  \new Voice {
    \voiceOne
  \partial 2 e'4 c |
    \bar "||"
    e1
    e8 r d8. c16 d8. e16 c4
    
    a2 r
    r e'4 (c)
    
    d8 d4.~ d2
    r4  c8. a16 c8. a16 c4
    b8 b, e ees d b fis' f
    e2~  e8 e'4 (c8)
    e8 e4 e8~ e2
    r4 d8. c16 d8. e16 c4
    a2 r
    c,8. d16 \times 2/3 { e8 fis gis } g4 a
    g4 e8 (g a4 <a c>
    e'8 d4. r2
    r4) g8 fis g a fis4
    e r r2
    
    
  }
  \new Voice {
    \voiceTwo
    \dynamicDown
    \partial 2  r2 |
    \bar "||"
  
    fis,2\pp (gis)
    fis ( gis)
    <c, e>2 <d e>
    <c e> gis'4 ( fis ) 
    f4 \times 2/3 { f8 g gis} a4~ \times 2/3 { a8 bes b}
    <d, f c'>2 e4 dis
    r8 b4.  (a2)
    <gis b> (<g cis e>8) r4 r8
    fis'2 (gis)
    fis (gis)
    <c e> (<d e>)
    c2 c
    c <c e>4 e
    <fis, a>2 <c f a c>
   \appoggiatura c8 <c e a>1 (
    <c e a>2 gis)
    
  }
>>
  
  
  %% fin 

}

lower=
\relative c{
  \clef bass
  \time 4/4
  \tempo 4=80
  \key c \major
  <<
   \new Voice {
    \voiceThree
    \partial 2 gis'2
  \bar "||"
   
  <a, e' a>2\arpeggio <b e b'>\arpeggio
   <a e' a>2\arpeggio <b e b'>\arpeggio
  <a fis'> 2 ( <b gis'> )
  <a fis'> <b e b'>4\arpeggio <a e' a>\arpeggio
  a'4~ \times 2/3 { a8 bes b} c4~ \times 2/3 {c4 cis8}
  d,4 ( e f fis )
  e2 (dis)
  e8 (e, cis' c b) <bes gis' d'>4.\arpeggio 
  <a e' c'>2\arpeggio <b e d'>\arpeggio
  <a e' c'>2\arpeggio <b e d'>\arpeggio
   <a fis'> 2 ( <b gis'> )
   <a e'> (<d, a'>)
   <g e'>4. e'8 (c4 a)
   <d, a'>2 (<g d'>)
   e'2 e~ 
   e4 d8 c d e c4
   }
  
  \new Voice {
    \voiceFour
    \partial 2 r2
  \bar "||"
   r1
   r 
   r
   r
  d2~ d
  a1
  gis2 (b)
  r1
  r1
  r1
  r
  r
  r
  r
  a1~
  a4 r r2
   }
  >>
  
  
  
  
}

accords = \chordmode {
  \small{
    \partial 2 e2:aug
    a2:m6 e:7
    a2:m6 e:7
    a2:m6 e:7
    a2:m6 e4:7 a:m6
    d2:m f:6
    d2:m7 f4:maj7 dis:min 
    e2 b:7.9+
    e2 e4:m6 e:7.5-
    a2:m6 e:7
    a:m6 e:7
    a:m6 e:7
    a:m d:7
    c a:m 
    d d:m7
    a1:m
    a2.:m c:aug
  }
}
\score {

  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Piano"
    
    
    \new Staff = "upper"  \transpose c f \upper 
    \new Staff = "lower"  \transpose c f \lower
    \context ChordNames {
      \set chordChanges = ##t
      \transpose c f \accords
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
