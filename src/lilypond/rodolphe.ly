\version "2.18.2"
%%myStaffSize = #16
%%##(set-global-staff-size myStaffSize)
#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eq? n 6) (eq? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eq? n 0) (eq? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))

#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map (lambda (x) (naturalize x)) es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))

naturalizeMusic =
#(define-music-function (parser location m)
   (ly:music?)
   (naturalize m))

\header {
  title="Rodolphe"
  composer="Wilfrid Petit"
  subtitle = ""
  %poet = "Poete"
  instrument = "Saxophone Ténor"
  %meter=\markup {\bold {"Remarque sur le rhythme"}}
  style = "Jazz"
  maintainer = "Alexandre Touret"
  maintainerEmail = "alexandre.touret@free.fr"
  maintainerWeb = "http://blog.touret.info"
  lastupdated = ""
  source = "Composition"
  footer = "Footer"
}


%%%% RELATIVE A MODIFIER + TEMPO+ CLE

upper=
\relative c''{
  \clef treble
  \time 4/4
  \tempo 4=120
  \key bes \major
    r g8 d' c a4. 
   r8 bes c c c c4.
   r8 bes c c c c4.
   r8 bes a4 bes8 a4. \break
   r4 f'8 d f d f a~ 
   a4 f2.
   c'4 bes4. g8 f d
   c bes g4 r2 \break
  a'4 g4. ees8 d bes
  a g e b'~ b2
  r8 bes c c c c4.
  r8 bes c c c c4.
  %% fin .

}


accords = \chordmode {
  \small{
c1:7
c1:7
c1:7
c1:7
f:7
f:7
c:7
c:7
d:m7
g:7
c:7
c:7
   

}}
\score {

  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Sax. Ténor"

    \new Staff = "upper"  {\upper}

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
  
 
}

\score {
  \unfoldRepeats \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Sax Ténor"

    \new Staff = "upper"  {\upper}

    \context ChordNames {
      \set chordChanges = ##t
      {\accords}
    }
  >>
  \midi{}
  
}


