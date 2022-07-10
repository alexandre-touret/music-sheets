\version "2.18.2"
\header {
  title="Everything Happens To Me"
  composer="Matt Dennis"
  subtitle = ""
  %%poet = "Tom Adair"
  instrument = "Piano"
  meter=\markup {\bold {"Medium Ballad"}}
  style = "Jazz"
  maintainer = "Alexandre Touret"
  maintainerEmail = "alexandre.touret@free.fr"
  maintainerWeb = "http://blog.touret.info"
  lastupdated = ""
  source = "RealBook"
  footer = "Footer"
}

%%%% RELATIVE A MODIFIER + TEMPO+ CLE

upper=
\relative c''{
  \clef treble
  \time 4/4
  \tempo 4=80
  \key bes \major

  \partial 8 g8 |
  \bar "||"
   \mark \markup { \box \bold { "A" } }
  d' d d ees c c bes a 
  c c c d bes4 r8 g
  bes bes bes c a a g f 
  aes aes aes bes g4 r8 d \break
  f f f g ees fis a bes
  c c \times 2/3 { c8 c a~ } a2
  g8 g g a~ a a a f~ 
  f2. r8 g \break
  d' d d ees c c bes a 
  c c c d bes4 r8 g
  bes bes bes c a a g f 
  aes aes aes bes g4 r8 d \break
  f f f g ees fis a bes
  c c \times 2/3 { c c a~ } a2
   g8 g g a~ a a a bes~ 
   bes2. r8 bes \break
   \mark \markup { \box \bold { "B" } }
  bes bes bes bes des des ces des
  bes bes bes2 r8 bes
  bes8 bes bes bes ces ges f ees
  bes'2. r8 bes \break
  a8 a a a c c bes c
  a a a2 r8 a
  bes bes bes bes bes bes a bes 
  c2. r8 g \break
   \mark \markup { \box \bold { "C" } }
  d' d d ees c c bes a 
  c c c d bes4 r8 g
  bes bes bes c a a g f 
  aes aes aes bes g4 r8 d \break
  f f f g ees fis a bes
  c c \times 2/3 {c c a~ } a2
  g8 g g d'~ d d d bes~ bes2. r4
  %% fin 

}


accords = \chordmode {
  \small{
    \partial 8 r8
   c2:m9 f:7
   d:m7 cis:dim
  c:m7 f:7 
  d:m7.5- g:7
  b:dim c:m7.5-
  d:m7 g:9
  c:m7 f:7
  bes1:maj7
  c2:m9 f:7 
  d:m7 cis:dim
  c:m7 f:7
  d:m7.5- g:7
  b:dim c:m7
  d:m7 g:9 
  c:m7 f:7
  bes1:6
  f2:m7.11 bes:7.9+.5+
  ees1:maj7
  f2:m7.11 bes:7.9-.5+ 
  ees1:maj7
  e2:m7.11 a:7.9+.5+
  d1:maj7
  g2:m7 c:7
  f:9 f:7
  c:m9 f:7 d:m7 cis:dim
  c:m7 f:7
  d:m7 g:7 
  b:dim c:m7.5-
  d:m7 g:9
  c:m7 f:13
  bes1:6
  }
}
\score {

  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Piano"
    
    
    %%\new Staff = "upper"  \transpose c f \upper 
    %%\new Staff = "lower"  \transpose c f \lower
      \new Staff = "upper"  \transpose bes ees \upper 
    \context ChordNames {
      \set chordChanges = ##t
      \transpose bes ees \accords
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
