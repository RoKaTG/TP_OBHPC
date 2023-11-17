reset
set terminal png size 2048,768 enhanced font 'Arial,10'
set output '../gcc_vs_clang_Ofast.png'

set title "Performance Comparison between GCC -Ofast and Clang -Ofast Optimization Flags for dotprod"
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

# Define the position offset for GCC -Ofast and Clang -Ofast data
gcc_Ofast_offset = -0.1
clang_Ofast_offset = 0.1

# Plot GCC -Ofast data with histograms and error bars
plot '../data_collection/gcc_Ofast.dat' using ($0+gcc_Ofast_offset):2:xtic(1) title 'GCC -Ofast' with boxes ls 1, \
     '' using ($0+gcc_Ofast_offset):2:3 title 'Error' with yerrorbars ls 3 pt 0, \
     '../data_collection/clang_Ofast.dat' using ($0+clang_Ofast_offset):2 title 'Clang -Ofast' with boxes ls 2, \
     '' using ($0+clang_Ofast_offset):2:3 title 'Error' with yerrorbars ls 3 pt 0

unset output

