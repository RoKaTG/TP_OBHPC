set terminal pngcairo enhanced font "arial,10" fontscale 1.0 size 1600, 800
set output "comparison_clang.png"

set title "Performance Comparison for Different Functions and Optimization Flags for CLANG"
set ylabel "MiB/s"
set xlabel "Function and Optimization Level for CLANG compiler"
set style data histograms
set style histogram clustered gap 5
set style fill solid border rgb "black"
set boxwidth 1
set xtic scale 0
set style fill solid border -1

plot "data.dat" using 2:xtic(1) title 'O3' lc rgb "red", \
     "" using 3:xtic(1) title 'O2' lc rgb "green", \
     "" using 4:xtic(1) title 'O1' lc rgb "blue", \
     "" using 5:xtic(1) title 'Ofast' lc rgb "purple"

