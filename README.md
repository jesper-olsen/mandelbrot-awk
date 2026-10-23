# Mandelbrot in Awk 

This repository contains an Awk program for generating visualizations of the Mandelbrot set. 

It can render the Mandelbrot set directly to the terminal as ASCII art or produce a data file for `gnuplot` to generate a high-resolution PNG image.


### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.

| Language                                                       | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| **[Awk](https://github.com/jesper-olsen/mandelbrot-awk)**      |           146.3 |              |      |                     |
| [C](https://github.com/jesper-olsen/mandelbrot-c)              |             3.6 |          0.6 |  0.7 |               0.2   |
| [C++](https://github.com/jesper-olsen/mandelbrot-cpp)          |             3.7 |          0.6 |  0.7 |               0.2   |
| [Erlang](https://github.com/jesper-olsen/mandelbrot_erl)       |            35.6 |          8.3 |      |                     |
| [Fortran](https://github.com/jesper-olsen/mandelbrot-f)        |             4.5 |              |      |                     |
| [Go](https://github.com/jesper-olsen/mandelbrot-go)            |             4.1 |          0.8 |  1.3 |               0.4   |
| [Goose](https://github.com/jesper-olsen/mandelbrot-goose)      |             3.9 |          0.7 |      |                     |
| [Java](https://github.com/jesper-olsen/mandelbrot-java)        |             3.9 |          0.8 |  1.4 |               0.5   |
| [Lean](https://github.com/jesper-olsen/mandelbrot-lean)        |             4.0 |              |      |                     |
| [Lua](https://github.com/jesper-olsen/mandelbrot-lua)          |            33.2 |              |      |                     |
| [Mojo](https://github.com/jesper-olsen/mandelbrot-mojo)        |             3.8 |          1.2 |  0.7 |               0.4   |
| [Odin](https://github.com/jesper-olsen/mandelbrot-odin)        |             4.4 |              |      |                     |
| [Py](https://github.com/jesper-olsen/mandelbrot-py)            |     (pure) 93.3 | (jax)    5.9 |      |                     |
| [R](https://github.com/jesper-olsen/mandelbrot-R)              |           335.0 |              |      |                     |
| [Rust](https://github.com/jesper-olsen/mandelbrot-rs)          |             4.7 |          1.3 |  1.4 |               0.8   |
| [Swift](https://github.com/jesper-olsen/mandelbrot-swift)      |             4.5 |          1.2 |  1.3 |               0.7   |
| [Tcl](https://github.com/jesper-olsen/mandelbrot-tcl)          |           306.9 |              |      |                     |
| [Typescript](https://github.com/jesper-olsen/mandelbrot-ts)    |             4.1 |          0.8 |      |                     |
| [Zig](https://github.com/jesper-olsen/mandelbrot-zig)          |             4.9 |          0.9 |  0.7 |               0.3   |
|                                                                |                 |              |      |                     |
| [Bash5.3](https://github.com/jesper-olsen/mandelbrot-bash)     |         10187.3 |              |      |                     |
| [Zsh](https://github.com/jesper-olsen/mandelbrot-bash)         |          2683.6 |              |      |                     |
| [Ksh (93u+m)](https://github.com/jesper-olsen/mandelbrot-bash) |          1271.5 |              |      |                     |
| [Nu](https://github.com/jesper-olsen/mandelbrot-nu)            |   (est) 17186.6 |              |      |                     |



---

## Prerequisites

You will need the following installed:

1.  **Awk** - (e.g. [awk](https://github.com/onetrueawk/awk), gawk or mawk). 
2.  **Gnuplot** (required *only* for generating PNG images).

---


## Usage

The script can be configured via command-line arguments using a `key=value` format.

### 1. ASCII Art Output

To render the Mandelbrot set directly in your terminal, run the executable.

```sh
% awk -v width=100 -v height=75 -f mandelbrot.awk
                                                                                                    
                                                                                .                   
                                                                                                    
                                                                                                    
                                                                              ..                    
                                                                                                    
                                                                               .                    
                                                                               . .                  
                       .                                                        .                   
                                                                               .                    
                                                                              .  .      .           
                                                                                     . .....        
                                                                                 .        .         
                                                                                   .      .. . .    
                                                                                              ..    
 .                                                                                                  
  .                                                                                            .    
                         _                                                                          
                                                                                             . .    
  _                      .                                                                     _M.  
                          .                                                                    .M.  
       .               .. .                                                                   ._. ..
   .. ..             . ..                                                                 .  .    ..
     .MM.             .                  . .                                                      ._
     ..M.. .                          .                                                   .        .
      ..   .  .     ...                 .                                                           
    ...     . .     ..                 .                                                            
    .   .    ...    .                                                                               
    .        ..... .                    ..                                                          
             .   ...   .    .                                                                    .._
                   ..                   .                                                  .    _a..
                   ....     .            .                                              ._  a    .._
                   .....  ...         ....                                                ..a.   .._
                   .... .  .. .       ..._     .                .               ..    ..  a__......_
                   .._...  _...        .                                         .  ._..._._....aa.W
                    ..._......        .. .   .                ..                  .    ....__._.M_WM
                    ..2M.__a.   .      _....                                      .    .  .._a_MMMMM
               ..  ...MM2___..  .     ..._ ...                                         .  M.2MMMMMMM
                ......MMMMM._a  ... .  ._.                    .        .                  ._MMMMMMMM
                ._aa_aMMMMMM..a.._. ...__.                     . . .                     .__aMMMMMMM
             ..a_...2MMMMMMM..a._a..._..W._     .                 ...  ..  .             .2._MMMMMMM
            .  a   ..MMMMMMM...M_M_W_.M_M..    .                  .a_.._  _          _  ..M_MMMMMMMM
                   ._MMMMMMaMMMMMMaM.MMM_.2    .                   ._..M.             __..a_MMMMMMMM
                 ...__MMMMMMMMMMMMMMMaMMMM.  ...                    .._a_.__   .          _.MMMMMMMM
                   ...._MMMMMMMMMMMMMMMMM.a ...                   .._____.22   .          ._MMMMMMMM
    .        .   _..._WMMMMMMMMMMMMMMMMMa.......               _ _.a.._a...     ..       ..._MMMMMMM
       ..      .._..MMMMMMMMMMMMMMMMMMMMMMa....2.       .         ....aM_._.    .a_..     ..aMMMMMMM
        . _    ...__aMMMMMMMMMMMMMMMMMMMMM__.__         .           .aMMMaMM. M.M2Ma. W.  ._.aMMMMMM
         _.     ..MMMMMMMMMMMMMMMMMMMMMMMMMMM_                    .._2aMMMWW.  .__W_..aM......_MMMMM
          ..   ..._2MMMMMMMMMMMMMMMMMMMMMMMMa..          .  .    .Wa_WMMMMM2.a..MMMM.._M.2M.a.._MMMM
         ...  _..W2MMMMMMMMMMMMMMMMMMMMMMMMM_.W.         ._._ .   .M_MMMMMMM.MM.MMMM.MMMaaMaM2MMMMMM
      . ._.....W..2MMMMMMMMMMMMMMMMMMMMMMMMMM...         .._aW2_  ..2MMMMMMM..MWMMMMMMMMMMMMMMMMMMMM
    . .a. ._..a_MaMMMMMMMMMMMMMMMMMMMMMMMMMMMW.          ._MW_.......2MMMMM_aMMMMMMMMMMMMMMMMMMMMMMM
    . ..   ..aaMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_...   .    .a.MMM..2M.a.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    ...     ._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_M.     2. ...2MMM_.MM_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 .   .     ..._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM..     .2_M.._MMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           . ...._MMMMMMMMMMMMMMMMMMMMMMMMMMM_W.     __MM.2.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      .   .   ...aMMMMMMMMMMMMMMMMMMMMMMMMMMMM_. ..aM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               ..MMMMMMMMMMMMMMMMMMMMMMMMMMMM2..a..M_M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            . ....MMMMMMMMMMMMMMMMMMMMMMMMMMM....M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           ..._.._aMMMMMMMMMMMMMMMMMMMMMMMMM_..MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
             __._WMMMMMMMMMMMMMMMMMMMMMMMMMWM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ..._2MMaMMMMMMMMMMMMMMMMMMMMMMM_._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           _._ ._.._MMMMMMMMMMMMMMMMMMMMMMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ._   ..._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        .. .     2_.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        ...     . .Ma_WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 a_..2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 .  ...._M2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               _.    .2._._a_MM___MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                    .  ....M...MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ...._.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ..2._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                       M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                   _2...M_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
```


### 2. PNG Image Generation

To create a high-resolution PNG, you first generate a data file and then process it with `gnuplot`.


```sh
awk -v png=1 -v width=1000 -v height=750 -f mandelbrot.awk >image.txt

gnuplot topng.gp
open mandelbrot.png
```
![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-awk/main/mandelbrot.png)


## Performance

Benchmarks were run on an **Apple M5** system with gawk version 20200816

**Generating a 1000x750 data file:**

```sh
time awk -v png=1 -v width=1000 -v height=750 -f mandelbrot.awk >image.txt
11.41s user 0.02s system 99% cpu 11.437 total

time gawk -v png=1 -v width=1000 -v height=750 -f mandelbrot.awk >image.txt
10.01s user 0.02s system 99% cpu 10.048 total

time mawk -v png=1 -v width=1000 -v height=750 -f mandelbrot.awk >image.txt
4.01s user 0.01s system 99% cpu 4.031 total
```


**Generating a 5000x5000 data file:**

```sh
time mawk -v png=1 -v width=5000 -v height=5000 -f mandelbrot.awk >image.txt
145.20s user 0.41s system 99% cpu 2:26.25 total
```


