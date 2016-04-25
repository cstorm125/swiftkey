# Quad-gram Backoff Next Word Prediction Model with Modified Kneser-Ney Smoothing

This is the Coursera Data Science Specialization Capstone Project sponsored by Swiftkey.
- The app uses a quad-gram back-off model with [modified Kneser-Ney smoothing](http://www.aclweb.org/anthology/P/P96/P96-1041.pdf) to predict the next word of a sentence. 
- The alorithm learns from 1% of the [Coursera SwiftKey data](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip). 
- It requires only 5 ms per query to run on average with a total of 41.3 MB of database. 
- Benchmark using [Jan-san](https://github.com/jan-san/dsci-benchmark/)'s implementation results in 14.31% overall top-3 score as compared to the baseline of 6.64%.
- The app is hosted [here](https://cstorm125.shinyapps.io/swiftkey). The GitHub repository is [here](https://cstorm125.shinyapps.io/swiftkey).
- Simply enter a word into the text box; predictions, modified Kneser-Ney probabilities and word clouds will appear.

## mile.Rmd/.html
Milestone report/codebook
## swift-present.Rpres
Presentation deck, also found [here](http://rpubs.com/cstorm125/swiftkey)
## data
The final data tables containing words and their respective modified Kneser-Ney probabilities.
## Shiny
A shiny app hosted [here](http://cstorm125.shinyapps.io/swiftkey/)
## dsci-benchmark-master
Below is the benchmarking results using [Jan-san](https://github.com/jan-san/dsci-benchmark/)'s implementation. The numbers in parantheses are those of baseline predictions.
```{r, eval=FALSE}
Overall top-3 score:     14.31 % (6.64 %)
Overall top-1 precision: 10.23 % (5.42 %)
Overall top-3 precision: 17.82 % (8.11 %)

Average runtime:         5.00 msec (0.09 msec)
Number of predictions:   28464
Total memory used:       704.73 MB (286.76 MB)

Dataset details
 -Dataset "blogs" (599 lines, 14587 words)
 Score: 14.08 %, Top-1 precision: 10.10 %, Top-3 precision: 17.53 %
 -Dataset "tweets" (793 lines, 14071 words)
 Score: 14.53 %, Top-1 precision: 10.37 %, Top-3 precision: 18.10 %

R version 3.2.3 (2015-12-10), platform x86_64-apple-darwin13.4.0 (64-bit)
Attached non-base packages:   stringi (v1.0-1), digest (v0.6.9), plyr (v1.8.3), quanteda (v0.9.4), shinythemes (v1.0.1), wordcloud (v2.5), RColorBrewer (v1.1-2), data.table (v1.9.6), shiny (v0.13.1)
Unattached non-base packages: Rcpp (v0.12.3), lattice (v0.20-33), mime (v0.4), slam (v0.1-32), grid (v3.2.3), chron (v2.3-47), R6 (v2.1.2), xtable (v1.8-2), jsonlite (v0.9.19), ca (v0.64), Matrix (v1.2-3), tools (v3.2.3), compiler (v3.2.3), parallel (v3.2.3), httpuv (v1.3.3), rsconnect (v0.4.1.4), htmltools (v0.3)```
