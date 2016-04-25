Next Word Prediction App
========================================================
author: Charin

Executive Summary
========================================================

- The app uses a quad-gram back-off model with [modified Kneser-Ney smoothing](http://www.aclweb.org/anthology/P/P96/P96-1041.pdf) to predict the next word of a sentence. 
- The alorithm learns from 1% of the [Coursera SwiftKey data](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip). 
- It requires only 5 ms per query to run on average with a total of 41.3 MB of database. 
- Benchmark using [Jan-san](https://github.com/jan-san/dsci-benchmark/)'s implementation results in 14.31% overall top-3 score as compared to the baseline of 6.64%.
- The app is hosted [here](https://cstorm125.shinyapps.io/swiftkey). The GitHub repository is [here](https://cstorm125.shinyapps.io/swiftkey).
- Simply enter a word into the text box; predictions, modified Kneser-Ney probabilities and word clouds will appear.

Modified Kneser-Ney Smoothing
========================================================

- Creates a probability for a given n-gram based on its context interpolated with lower-level n-grams. It is considered by many to be [the most effective smoothing algorithm in n-gram models](http://nlp.stanford.edu/~wcmac/papers/20050421-smoothing-tutorial.pdf). 
- Example: The word 'DeNiro' will have a rather high word frequency on its own. However, almost the only context it appears in is with 'Robert'; thus, we can assume that it is actually much 'less frequent'. 
- [Chen and Goodman (1998) ](http://www.aclweb.org/anthology/P/P96/P96-1041.pdf) devised modified Kneser-Ney smoothing to take this into account. 
- An improvement from Kneser-Ney smoothing, modified Kneser-Ney smoothing use different discount weights according to frequencies of frequencies of words to achieve more accurate results.

Backoff Model
========================================================
The backoff model is a Markov-chain based model where the highest-order n-grams (in our case quad-grams) are used first to determine the next word. If there is no match, the lower-order n-grams are used ending with uni-grams, effectively selecting the single word with the highest probability in the corpus.

```
   user  system elapsed 
  0.754   0.018   0.774 
```

```
      pred        pkn ngram
1:    most 0.11220957     4
2:    best 0.08201405     4
3:   first 0.03617392     4
4:   worst 0.02200244     4
5: biggest 0.01932833     4
```

Benchmarking
========================================================

Below is the benchmarking results using [Jan-san](https://github.com/jan-san/dsci-benchmark/)'s implementation. The numbers in parantheses are those of baseline predictions.


```r
Overall top-3 score:     14.31 % (6.64 %)
Overall top-1 precision: 10.23 % (5.42 %)
Overall top-3 precision: 17.82 % (8.11 %)

Average runtime:         5.00 msec (0.09 msec)
Number of predictions:   28464
Total memory used:       704.73 MB (286.76 MB)
```
