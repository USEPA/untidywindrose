## Test environments
* local R installation, R 4.0.3
* ubuntu 16.04 (on travis-ci), R 4.0.3
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

# I am recieving the following note
Possibly mis-spelled words in DESCRIPTION:
    Windrose (4:15)
    windroses (12:53)
    
These words are not misspelled but I don't think it is possible to have
devtools::check to ignore this note. These words have been added to the
WORDLIST file.
