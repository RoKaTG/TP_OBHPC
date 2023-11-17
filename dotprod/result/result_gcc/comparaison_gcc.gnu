set terminal png size 1536,768
set output 'comparison_gcc_dotprod.png'

set title "Performance Comparison for Different Functions and Optimization Flags for dotprod compilation using GCC"
set ylabel "MiB/s"
set xlabel "Function and Optimization Level for GCC compiler"

set style data histograms
set style histogram errorbars gap 1 linewidth 1
set style fill solid 1.00 border -1
set boxwidth 0.9
set xtics rotate by -0

set grid ytics
set key outside right top vertical Right noreverse enhanced autotitles columnhead nobox
set style data histograms

plot 'data.dat' using 2:3:xtic(1) title 'O3', \
     '' using 4:5 title 'O2', \
     '' using 6:7 title 'O1', \
     '' using 8:9 title 'Ofast'

unset output

