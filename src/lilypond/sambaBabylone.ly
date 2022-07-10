\version "2.18.2"

date = #(strftime "%d/%m/%Y" (localtime (current-time)))



accords = \chordmode {
  \small{
    c1:m7
    d:m7.5-
    g:7
    c:m7
    c1:m7
    d2:m7.5-     g:7
    c1:m7
    c1:m7
    f:m7 bes:7 ees:7+ aes:7+
    f:m aes:7 g:7 g:7.5+
    c1:m7
    d:m7.5-
    g:7
    c:m7
    c1:m7
    d2:m7.5-     g:7
    c1:m7
    c1:m7
    
}}
\book {
  \paper {
    print-all-headers = ##t
  }
  \header {
    title="Samba Bilone"
    composer="Michel Ducarne"
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

  \score {
    <<

      \new Staff   = "upper" \with {
        instrumentName = #"Piano"
        shortInstrumentName = #""
      }
      {}

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
}

