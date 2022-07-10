\version "2.18.2"

date = #(strftime "%d/%m/%Y" (localtime (current-time)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
partie_melodie_a=
\relative c''{
   \repeat volta 2 {   
    \mark \markup { \box \bold { "A" } }
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 

}
    \alternative{
  {
    r8 c ees c4 r8 r4 | c8 ees c4 ees4 r4
  }
  {
    r8 c ees c4 r8 r4 | c8 ees c4 ees4 f8 ges
  } 
}
}


partie_melodie_a_fin=
\relative c''{
   \repeat volta 2 {   
    \mark \markup { \box \bold { "A" } }
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 
    \appoggiatura{ g aes} a8  c4.-^ a8 aes g4  |
    ees8 c ees4 c8 f4 r8 

}
    \alternative{
  {
    r8 c ees c4 r8 r4 | c8 ees c4 ees4 r4
  }
  {
    r8 c ees c4 r8 f4~ | f2 r
  } 
}
}

partie_accords_a=
\chordmode {
   
    g2:m7 c:m7| f:7 bes:7+ |
    
    
  
}


partie_accords_a_fin=
\chordmode {
 
    g2:m7 c:m7| f1:7 |
  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

partie_melodie_b=
\relative c''{
    \mark \markup { \box \bold { "B" } }
    g8 a4 g8 r2 | r1 |
    aes8 bes4 aes8 r2 | r1|
    a8 b4 a8 r2 | r1
    bes8 c4 bes8 r2 |r8 c ees4 c8 f4 r8 
  
}

partie_accords_b=
\chordmode {
  a1:m7 |a1:m7 | bes:m7 |bes:m7 |b:m7| b:m7 | c:m7 |d:7.5+.9+
}





upper=
\relative c''{
  \clef treble
  \time 4/4
  %%\tempo 4=1
  \tempo \markup {
%     \concat {
%       \smaller \general-align #Y #DOWN \note #"4" #1
%       " = "
%       " 120-140 ou 180-200 "
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
  \key bes \major
 
  \partie_melodie_a 

 

 \partie_melodie_b |
  \partie_melodie_a_fin


}


accords = \chordmode {
  \small{
    \partie_accords_a
    \partie_accords_a
    \partie_accords_a
    \partie_accords_a
    \partie_accords_a
 %%    g2:m7 c:m7| f:7 bes:7+ |
 %%      \partie_accords_a
 %%   \partie_accords_a
 %%    g2:m7 c:m7| f:7 bes:7+ |
    \partie_accords_b
      \partie_accords_a
    \partie_accords_a
    \partie_accords_a
    \partie_accords_a
    \partie_accords_a_fin


}}
\book {
  \paper {
    print-all-headers = ##t
  }
  \header {
    title="Retour de vacances"
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
      title = "Retour de vacances"
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


