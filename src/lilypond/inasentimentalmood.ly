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
  title="In a Sentimental Mood"
  composer="Duke ELLINGTON"
  subtitle = "as played with John Coltrane"
  %poet = "Poete"
  instrument = "Piano"
  %meter=\markup {\bold {"Remarque sur le rhythme"}}
  style = "Jazz"
  maintainer = "Alexandre Touret"
  maintainerEmail = "alexandre.touret@free.fr"
  maintainerWeb = "http://blog.touret.info"
  lastupdated = ""
  source = "Real book"
  footer = "Footer"
}


%%%% RELATIVE A MODIFIER + TEMPO+ CLE

upper=
\relative c'{
  \clef treble
  \time 4/4
  \tempo 4=60
  \key des \major
  r des8 es f as bes des
  \repeat volta 2 {
    es1~
    es4 des8 es des c bes as
    f4 bes8 f~ f2~ \break

    f4 f8 as bes e, es des
    bes2~ bes8 des f as
    c2. bes4
    ges2 c, \break

  }
  \alternative {{
    es4 des8 es f as bes des
                }
                {
                  des,2. r4
                }
  }\break
  as'4 ges8 as b a as ges
  des4 b8des eses e des b
  a2 \times 2/3 { d4 es ges}
  \times 2/3 {g4 as b} \times 2/3 { c des e} \break
  as,4 ges8 as b a as ges
  des4 b8 des eses e des b
  as1
  r4 des8 es f as bes des \break
  es1~
  es4 des8 es es c bes as
  f4 bes8 f~ f2~
  f4 f8 as bes e, es des
  bes2~ bes8 des8 f as c2.
  bes4
  ges2 c,
  des1 \bar "|"

  %% fin .

}

lower=
\relative c{
  \clef bass
  \time 4/4
  \tempo 4=60
  \key as \major

}

accords = \chordmode {
  \small{
    r1
    \repeat volta 2{
      bes2:m bes2:m7+
      bes2:m7 bes2:m6
      es:m
      es:m7+
      es:m7 es4:m6 f:7
      bes1:m
      bes:7
      es2:m7 eses:7
    }
    \alternative {{
      des1:maj7
                  }
                  {
                    des2:maj7 e:7
                  }
    }
    a2:maj7 ges:m7
    b:m7 e:7
    a:maj7 ges:7
    b:7 e:7
    a:maj7 ges:m7
    b:m7 e:7
    es1:m7
    as:7
    bes2:m bes2:m7+
    bes2:m7 bes2:m6
    es:m
    es:m7+
    es:m7 es4:m6 f:7
    bes1:m
    bes:7
    es2:m7 as:7.9-
    des1:maj7

}}
\score {

  \new PianoStaff ="piano" <<
    \set PianoStaff.instrumentName = "Piano"

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


