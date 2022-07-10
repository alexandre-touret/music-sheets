\version "2.18.2"
\language "english"

date = #(strftime "%d/%m/%Y" (localtime (current-time)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
partie_melodie_a=
\relative c''{
  \repeat volta 2{
    \mark \markup { \box \bold { "A" } }
    \acciaccatura{ c16 cs} d8  f4.-^~ f2 |
    r8  \acciaccatura{d16 df} c8 bf8 bf8 g4-^ bf8 g |
    c8 bf~ bf8  g8~-^ g2~ |

  }
  \alternative{
    { g2. r4  |  }
    { g4 r \times 2/3{g4 gs4 a} | \break}
  }
}

partie_accords_a=
\chordmode {
  g1:m7 |
  ef:7.11+
  d:7.9+.5+
  g1:m7|
  g2:m7 e:7.9-|

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

partie_melodie_b=
\relative c''{
  \repeat volta 2{
    \mark \markup { \box \bold { "B" } }
    r8  bf c bf c4 bf8 c8~ |
    c2 bf8 g bf g |
  }
  \alternative {
    {bf8 g8~ g2.~ | g1| }
    {bf8 a8~ a2.~ | a1 |}
  }
  \break
}

partie_accords_b=
\chordmode {
  \repeat volta 2{
    a1:m7.5-|
    d1:aug7|
  }
  \alternative {{g1:m7 g1:m7}{g1:m7 f:7 }}
}



partie_accords_c=
\chordmode {
  bf1:7 |
  bf1:7|
  ef:7|
  ef:7|
  c:7|
  c:7|
  f:7|
  f:7
}


upper=
\relative c''{
  \clef treble
  \time 4/4
  %%\tempo 4=1
  \tempo \markup {


   %  \concat {
%       \smaller \general-align #Y #DOWN \note #"4" #1
%       " = "
%       " 150-170 "
% 
%       (
%       \smaller \general-align #Y #DOWN \note #"8" #1
%       \smaller \general-align #Y #DOWN \note #"8" #1
%       " = "
%       \smaller \general-align #Y #DOWN \note #"8." #1
%       " "
%       \smaller \general-align #Y #DOWN \note #"16" #1
%       )
%     }
  }
  \key bf \major
  \partie_melodie_a |
  \partie_melodie_b |
  %%\partie_melodie_a |
  %%\partie_melodie_b |
  \break

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \mark \markup { \box \bold { "C" } }
  g8 bf g df'~ df c bf c |
  bf c~ c2.
  bf8 g bf g bf g4.~
  g2. \times 2/3 {g8 bf df}  \break
  \times 2/3 {c16 df ef} \times 2/3 {c16 df ef} g4. ef8 c r8 |
  \times 2/3 {c16 df ef} \times 2/3 {c16 df ef} gf4. ef8 c r8 |
  \times 2/3 {c16 df ef} f4. ef8 c~ c a |
  c a4 c2  r8
  \break
  |

  \partie_melodie_a

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%B fin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \repeat volta 2{
    \mark \markup { \box \bold { "B" } }
    r8  bf c bf c bf8 c4~ |
    c4 bf8 g bf g bf8 g8|
    %g1 g1|
  }  \alternative {
    {bf8 g8~ g2.~ | g1| }
    {bf8\> a8~ a2.~ | a1\! |}
  }

}


accords = \chordmode {
  \small{
    \partie_accords_a
    \partie_accords_b
    \partie_accords_c
    \partie_accords_a
    \partie_accords_b

}}
\book {
  \paper {
    print-all-headers = ##t
  }
  \header {
    title="Swing for CC"
    composer="Alexandre Touret"
    arranger = "Kind of Friends"
    meter=\markup {\bold {"Swing"}}
    style = "Jazz"
    maintainer = "Alexandre Touret"
    maintainerEmail = "alexandre.touret@free.fr"
    maintainerWeb = "http://blog.touret.info"
    lastupdated = "\date"
    source = "Composition"
    tagline= \markup {"Gravé le " \date}
    copyright = "Copyright"
  }
  \markup { \vspace #1 }

  \score {
    <<

      \new Staff   = "upper" \with {
        instrumentName = #"Piano"
        shortInstrumentName = #""
      }
      {\upper  \pageBreak}

      \context ChordNames {
        \set chordChanges = ##t
        {\accords}
      }
    >>
    \layout{
      \context {
        \ChordNames
        alignAboveContext = #"upper"
        \override VerticalAxisGroup  #'minimum-Y-extent = #'(-0 . 0)
      }
    }
    \midi { \tempo 4=170}
    \header {
      title = ##f
      composer = ##f
      % Pas de sous-titre pour ce morceau
      subtitle = "Piano"
      meter =##f
      arranger = ##f
    }
  }
  \score {
    \header {
      title = "Swing for CC"
      % Pas de sous-titre pour ce morceau
      subtitle = "Saxophone Ténor"
      meter = ##f
      copyright = "Creative Commons"
      composer = ##f
      arranger = ##f
    }
    <<
      \new Staff   = "upper" \with {
        instrumentName = #"Sax. Ténor"
        shortInstrumentName = #""
      }  {\transpose g a \upper \pageBreak}

      \context ChordNames {
        \set chordChanges = ##t
        {\transpose g a \accords}
      }
    >>
    \layout{
      \context {
        \ChordNames
        alignAboveContext = #"upper"
        \override VerticalAxisGroup  #'minimum-Y-extent = #'(-0 . 0)
      }
    }
  }
}


