\version "2.14.2"
myStaffSize = #16
#(set-global-staff-size myStaffSize)
\header {
  title="Footprints"
  composer="Wayne Shorter"
  subtitle = "Solo Herbie Hancock"
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
  \time 6/4
  \tempo 4=100
  \key c \minor

  c8 r16 c
  r8 c 
  r16 c r8 
  c r16 c 
  r8 c 
  r16 c r8 
  
}

lower=
\relative c{
  \clef bass
  \time 6/4
  \tempo 4=100
  \key c \minor
   
   < ees bes >4 r8 < ees bes > r16 < ees bes >8. < ees bes >4 r8 < ees bes > r16 < ees bes >8.

  }


accords = \chordmode {
  \small{
    c4:m7 c4:m7 c4:m7 c4:m7 c4:m7 c4:m7 
 
  }
}

\score {

  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Piano"
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
    \context ChordNames {
      \set chordChanges = ##t
      \accords
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
