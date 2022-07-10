\version "2.14.2"
myStaffSize = #16
#(set-global-staff-size myStaffSize)
\header {
  title="Armando's Rhumba"
  composer="Chick COREA"
  subtitle = "Version L. FRANCOIS"
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
  \time 2/2
  \tempo 4=176
  \key ees \major

  %% intro
  c8_\markup { \italic \bold Unisson} des4 b8 c des4 b8
  c4. g8~ g4 ees'8 c
  g4 c8 g ees4 g8 ees8
  c4 r4 r4 <c'c'> -> |
  <c c'>4.-> <c c'>8->~ <c c'>2-> |
  \bar "||"
  \repeat volta 2 {
    r8 g c ees g4 ees |
    fis4. d8~ d2 |
    \times 2/3 { r4 f4 d4 } f8 d4 ees8~
    \times 2/3 { ees4 aes, g } ees'4 r4
    \break
    r8 g, c ees g4 ees |
    fis4. d8~ d2 |
    \times 2/3 { r4 f4 ees4 } d8 f4 ees8~ |
    ees1 |
    \break
    %% TODO METTRE CODA
    g4 e 8 g bes aes4 g8
    aes4. g8 aes4. a8~
    a4. fis8~ fis c'4 a8 |

    bes8 a bes c d4 r4 \break
    b4. c8 \times 2/3 { d4 c b }
    c8 b4 c8~ c d4 ees8~ |

    ees4. bes8~ bes2~
    bes4. g8 fis4 g \break
    bes8 aes4 b8~ b4. f8 |

    aes8 f ees b <aes d g>4. <g bes ees>8
    r4 r8 gis'8 a8 r ais8 r
    b4. <ees g>8~ <ees g>2 |
  } %% fin repeat     

}

lower=
\relative c{
  \clef bass
  \time 2/2
  \tempo 4=176
  \key ees \major
  %% intro
  c8 des4 b8 c des4 b8
  c4. g8~ g4 ees'8 c
  g4 c8 g ees4 g8 ees8
  c4 r4 r4 <c c'>-> |
  <c c'>4.-> <c c'>8->~ <c c'>2-> |
  \bar "||"

  \repeat volta 2{
    c'4. g'4. c4
    d,4. a' aes4
    g4. b d4
    c4. g c4 |

    c,4. g'4. c4
    d,4. a' aes4
    g4. b d4
    c4. g c4 |

    c,4. g'4. c4
    f,4. c' aes4
    fis4. c' fis,4
    g,1

    <aes f'>1
    <a fis'>
    bes4. bes' ees,4
    bes4. bes' ees,4 |
    bes4. aes' f4
    bes,2 bes
    ees,4. ees8 ees f~ f fis |
    g2 g,
  } %% fin repeat


}

accords = \chordmode {
  \small{
    r1
    r
    r
    r
    r
    c1:m7
    d:7.9-
    g:7.9-
    c:m7

    c1:m7
    d:7.9-
    g:7.9-
    c:m7

    c:7.9-
    f:m7
    fis:dim7
    fis:dim7

    aes:dim7
    a:dim7
    bes:sus4
    bes:sus4
    bes:7
    bes:7
    ees
    g:7


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
