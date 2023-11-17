reset
set terminal png size 2048,768 enhanced font 'Arial,10'
set output '../gcc_vs_clang_O1.png'

set title "Performance Comparison between GCC -O1 and Clang -O1 Optimization Flags for dotprod"
set ylabel "MiB/s"
set xlabel "Function and Optimization Level"

set style data histograms
set style histogram cluster gap 1
set style fill solid 1.00 border -1
set boxwidth 0.15

set key autotitle columnhead
set xtics rotate by -0
set grid ytics

# Define line styles
set style line 1 lc rgb "red" lw 2 pt 7 ps 1.5   # GCC histogram color
set style line 2 lc rgb "blue" lw 2 pt 11 ps 1.5 # Clang histogram color
set style line 3 lc rgb "black" lw 2 pt 7 ps 1.5 # Error bar color

# Define the position offset for GCC -O1 and Clang -O1 data
gcc_O1_offset = -0.1
clang_O1_offset = 0.1

# Plot GCC -O1 data with histograms and error bars
plot '../data_collection/gcc_O1.dat' using ($0+gcc_O1_offset):2:xtic(1) title 'GCC -O1' with boxes ls 1, \
     '' using ($0+gcc_O1_offset):2:3 title 'Error' with yerrorbars ls 3 pt 0, \
     '../data_collection/clang_O1.dat' using ($0+clang_O1_offset):2 title 'Clang -O1' with boxes ls 2, \
     '' using ($0+clang_O1_offset):2:3 title 'Error' with yerrorbars ls 3 pt 0

unset output

